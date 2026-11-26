=begin
File: iteration.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com), Cy (9738314@gmail.com)
=end

### for ループ ###
def for_loop(n)
  res = 0

  # 1, 2, ..., n-1, n の和をループで求める
  for i in 1..n
    res += i
  end

  res
end

### while ループ ###
def while_loop(n)
  res = 0
  i = 1 # 条件判定用の変数を初期化

  # 1, 2, ..., n-1, n の和をループで求める
  while i <= n
    res += i
    i += 1 # 条件判定用の変数を更新
  end

  res
end

### while ループ（2 回更新）###
def while_loop_ii(n)
  res = 0
  i = 1 # 条件判定用の変数を初期化

  # 1, 4, 10, ... の和をループで求める
  while i <= n
    res += i
    # 条件判定用の変数を更新
    i += 1
    i *= 2
  end

  res
end

### 二重の for ループ ###
def nested_for_loop(n)
  res = ""

  # i = 1, 2, ..., n-1, n の順に繰り返す
  for i in 1..n
    # j = 1, 2, ..., n-1, n の順に繰り返す
    for j in 1..n
      res += "(#{i}, #{j}), "
    end
  end

  res
end

### 実行例 ###
if __FILE__ == $0
  n = 5

  res = for_loop(n)
  puts "\nfor ループによる総和 res = #{res}"

  res = while_loop(n)
  puts "\nwhile ループによる総和 res = #{res}"

  res = while_loop_ii(n)
  puts "\nwhile ループ（2 回更新）による総和 res = #{res}"

  res = nested_for_loop(n)
  puts "\n二重の for ループの走査結果 #{res}"
end
