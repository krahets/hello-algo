=begin
File: recursion.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 再帰 ###
def recur(n)
  # 終了条件
  return 1 if n == 1
  # 往路：再帰呼び出し
  res = recur(n - 1)
  # 復路：結果を返す
  n + res
end

### 反復を使って再帰を再現する ###
def for_loop_recur(n)
  # 明示的なスタックを使って、システムの呼び出しスタックを再現する
  stack = []
  res = 0

  # 往路：再帰呼び出し
  for i in n.downto(0)
    # 「プッシュ操作」で再帰の「往路」を再現する
    stack << i
  end
  # 復路：結果を返す
  while !stack.empty?
    res += stack.pop
  end

  # res = 1+2+3+...+n
  res
end

### 末尾再帰 ###
def tail_recur(n, res)
  # 終了条件
  return res if n == 0
  # 末尾再帰呼び出し
  tail_recur(n - 1, res + n)
end

### フィボナッチ数列：再帰 ###
def fib(n)
  # 終了条件 f(1) = 0, f(2) = 1
  return n - 1 if n == 1 || n == 2
  # 再帰呼び出し f(n) = f(n-1) + f(n-2)
  res = fib(n - 1) + fib(n - 2)
  # 結果 f(n) を返す
  res
end

### 実行用コード ###
if __FILE__ == $0
  n = 5

  res = recur(n)
  puts "\n再帰関数で求めた和 res = #{res}"

  res = for_loop_recur(n)
  puts "\n反復で再帰を再現して求めた和 res = #{res}"

  res = tail_recur(n, 0)
  puts "\n末尾再帰関数で求めた和 res = #{res}"

  res = fib(n)
  puts "\nフィボナッチ数列の第 #{n} 項は #{res}"
end
