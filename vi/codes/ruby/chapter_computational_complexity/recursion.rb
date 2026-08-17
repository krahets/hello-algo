=begin
File: recursion.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Recursion ###
def recur(n)
  # Termination condition
  return 1 if n == 1
  # Recurse: recursive call
  res = recur(n - 1)
  # Return: return result
  n + res
end

### Use iteration to simulate recursion ###
def for_loop_recur(n)
  # Use an explicit stack to simulate the system call stack
  stack = []
  res = 0

  # Recurse: recursive call
  for i in n.downto(0)
    # Simulate "recurse" with "push"
    stack << i
  end
  # Return: return result
  while !stack.empty?
    res += stack.pop
  end

  # res = 1+2+3+...+n
  res
end

### Tail recursion ###
def tail_recur(n, res)
  # Termination condition
  return res if n == 0
  # Tail recursive call
  tail_recur(n - 1, res + n)
end

### Fibonacci sequence: recursion ###
def fib(n)
  # Termination condition f(1) = 0, f(2) = 1
  return n - 1 if n == 1 || n == 2
  # Recursive call f(n) = f(n-1) + f(n-2)
  res = fib(n - 1) + fib(n - 2)
  # Return result f(n)
  res
end

### Driver Code ###
if __FILE__ == $0
  n = 5

  res = recur(n)
  puts "\nRecursion sum result res = #{res}"

  res = for_loop_recur(n)
  puts "\nUsing iteration to simulate recursion sum result res = #{res}"

  res = tail_recur(n, 0)
  puts "\nTail recursion sum result res = #{res}"

  res = fib(n)
  puts "\nThe #{n}th Fibonacci number is #{res}"
end
