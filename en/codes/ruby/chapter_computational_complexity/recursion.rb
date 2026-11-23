=begin
File: recursion.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Recursion ###
def recur(n)
  # Base case
  return 1 if n == 1
  # Recurse: make a recursive call
  res = recur(n - 1)
  # Unwind: return the result
  n + res
end

### Simulate recursion using iteration ###
def for_loop_recur(n)
  # Use an explicit stack to simulate the system call stack
  stack = []
  res = 0

  # Recurse: make a recursive call
  for i in n.downto(0)
    # Simulate recursive calls by pushing onto the stack
    stack << i
  end
  # Unwind: return the result
  while !stack.empty?
    res += stack.pop
  end

  # res = 1+2+3+...+n
  res
end

### Tail recursion ###
def tail_recur(n, res)
  # Base case
  return res if n == 0
  # Tail-recursive call
  tail_recur(n - 1, res + n)
end

### Fibonacci sequence: recursion ###
def fib(n)
  # Base cases: f(1) = 0, f(2) = 1
  return n - 1 if n == 1 || n == 2
  # Recursive calls: f(n) = f(n-1) + f(n-2)
  res = fib(n - 1) + fib(n - 2)
  # Return the result f(n)
  res
end

### Driver code ###
if __FILE__ == $0
  n = 5

  res = recur(n)
  puts "\nSum from recursion: res = #{res}"

  res = for_loop_recur(n)
  puts "\nSum from simulating recursion with iteration: res = #{res}"

  res = tail_recur(n, 0)
  puts "\nSum from tail recursion: res = #{res}"

  res = fib(n)
  puts "\nFibonacci term #{n} is #{res}"
end
