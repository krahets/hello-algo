=begin
File: recursion.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 遞迴 ###
def recur(n)
  # 終止條件
  return 1 if n == 1
  # 遞：遞迴呼叫
  res = recur(n - 1)
  # 迴：返回結果
  n + res
end

### 使用迭代模擬遞迴 ###
def for_loop_recur(n)
  # 使用一個顯式的堆疊來模擬系統呼叫堆疊
  stack = []
  res = 0

  # 遞：遞迴呼叫
  for i in n.downto(0)
    # 透過“入堆疊操作”模擬“遞”
    stack << i
  end
  # 迴：返回結果
  while !stack.empty?
    res += stack.pop
  end

  # res = 1+2+3+...+n
  res
end

### 尾遞迴 ###
def tail_recur(n, res)
  # 終止條件
  return res if n == 0
  # 尾遞迴呼叫
  tail_recur(n - 1, res + n)
end

### 費波那契數列：遞迴 ###
def fib(n)
  # 終止條件 f(1) = 0, f(2) = 1
  return n - 1 if n == 1 || n == 2
  # 遞迴呼叫 f(n) = f(n-1) + f(n-2)
  res = fib(n - 1) + fib(n - 2)
  # 返回結果 f(n)
  res
end

### Driver Code ###
if __FILE__ == $0
  n = 5

  res = recur(n)
  puts "\n遞迴函式的求和結果 res = #{res}"

  res = for_loop_recur(n)
  puts "\n使用迭代模擬遞迴求和結果 res = #{res}"

  res = tail_recur(n, 0)
  puts "\n尾遞迴函式的求和結果 res = #{res}"

  res = fib(n)
  puts "\n費波那契數列的第 #{n} 項為 #{res}"
end
