=begin
File: iteration.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com), Cy (9738314@gmail.com)
=end

### for ループ ###
def for_loop(n)
  res = 0

  # ループで 1, 2, ..., n-1, n の和を求める
  for i in 1..n
    res += i
  end

  res
end

### while ループ ###
def while_loop(n)
  res = 0
  i = 1 # 条件変数を初期化する

  # ループで 1, 2, ..., n-1, n の和を求める
  while i <= n
    res += i
    i += 1 # 条件変数を更新する
  end

  res
end

### while ループ（2 回の更新）###
def while_loop_ii(n)
  res = 0
  i = 1 # 条件変数を初期化する

  # ループで 1, 4, 10, ... の和を求める
  while i <= n
    res += i
    # 条件変数を更新する
    i += 1
    i *= 2
  end

  res
end

### 二重 for ループ ###
def nested_for_loop(n)
  res = ""

  # i = 1, 2, ..., n-1, n のループ
  for i in 1..n
    # j = 1, 2, ..., n-1, n のループ
    for j in 1..n
      res += "(#{i}, #{j}), "
    end
  end

  res
end

### 実行用コード ###
if __FILE__ == $0
  n = 5

  res = for_loop(n)
  puts "\nfor ループで求めた和 res = #{res}"

  res = while_loop(n)
  puts "\nwhile ループで求めた和 res = #{res}"

  res = while_loop_ii(n)
  puts "\nwhile ループ（2 回の更新）で求めた和 res = #{res}"

  res = nested_for_loop(n)
  puts "\n二重 for ループの走査結果 #{res}"
end
