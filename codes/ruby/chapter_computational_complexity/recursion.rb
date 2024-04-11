=begin
File: recursion.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 递归 ###
def recur(n)
  # 终止条件
  return 1 if n == 1
  # 递：递归调用
  res = recur(n - 1)
  # 归：返回结果
  n + res
end

### 使用迭代模拟递归 ###
def for_loop_recur(n)
  # 使用一个显式的栈来模拟系统调用栈
  stack = []
  res = 0

  # 递：递归调用
  for i in n.downto(0)
    # 通过“入栈操作”模拟“递”
    stack << i
  end
  # 归：返回结果
  while !stack.empty?
    res += stack.pop
  end

  # res = 1+2+3+...+n
  res
end

### 尾递归 ###
def tail_recur(n, res)
  # 终止条件
  return res if n == 0
  # 尾递归调用
  tail_recur(n - 1, res + n)
end

### 斐波那契数列：递归 ###
def fib(n)
  # 终止条件 f(1) = 0, f(2) = 1
  return n - 1 if n == 1 || n == 2
  # 递归调用 f(n) = f(n-1) + f(n-2)
  res = fib(n - 1) + fib(n - 2)
  # 返回结果 f(n)
  res
end

### Driver Code ###
if __FILE__ == $0
  n = 5

  res = recur(n)
  puts "\n递归函数的求和结果 res = #{res}"

  res = for_loop_recur(n)
  puts "\n使用迭代模拟递归求和结果 res = #{res}"

  res = tail_recur(n, 0)
  puts "\n尾递归函数的求和结果 res = #{res}"

  res = fib(n)
  puts "\n斐波那契数列的第 #{n} 项为 #{res}"
end
