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
  # 迴：回傳結果
  n + res
end

### 以迭代模擬遞迴 ###
def for_loop_recur(n)
  # 自行建立堆疊，模擬系統的呼叫堆疊
  stack = []
  res = 0

  # 遞：遞迴呼叫
  for i in n.downto(0)
    # 以「推入堆疊」模擬「遞」
    stack << i
  end
  # 迴：回傳結果
  while !stack.empty?
    res += stack.pop
  end

  # res = 1+2+3+...+n
  res
end

### 尾端遞迴 ###
def tail_recur(n, res)
  # 終止條件
  return res if n == 0
  # 尾端遞迴呼叫
  tail_recur(n - 1, res + n)
end

### 費氏數列：遞迴 ###
def fib(n)
  # 終止條件 f(1) = 0, f(2) = 1
  return n - 1 if n == 1 || n == 2
  # 遞迴呼叫 f(n) = f(n-1) + f(n-2)
  res = fib(n - 1) + fib(n - 2)
  # 回傳結果 f(n)
  res
end

### 主程式 ###
if __FILE__ == $0
  n = 5

  res = recur(n)
  puts "\n遞迴函式的總和 res = #{res}"

  res = for_loop_recur(n)
  puts "\n以迭代模擬遞迴的總和 res = #{res}"

  res = tail_recur(n, 0)
  puts "\n尾端遞迴函式總和 res = #{res}"

  res = fib(n)
  puts "\n費氏數列的第 #{n} 項為 #{res}"
end
