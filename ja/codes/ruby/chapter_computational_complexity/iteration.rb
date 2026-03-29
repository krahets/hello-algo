=begin
File: iteration.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com), Cy (9738314@gmail.com)
=end

### for ループ ###
def for_loop(n)
  res = 0

  # 1, 2, ..., n-1, n を順に加算する
  for i in 1..n
    res += i
  end

  res
end

### while ループ ###
def while_loop(n)
  res = 0
  i = 1 # 条件変数を初期化する

  # 1, 2, ..., n-1, n を順に加算する
  while i <= n
    res += i
    i += 1 # 条件変数を更新する
  end

  res
end

# ## while ループ（2 回更新）###
def while_loop_ii(n)
  res = 0
  i = 1 # 条件変数を初期化する

  # 1, 4, 10, ... を順に加算する
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

  # i = 1, 2, ..., n-1, n とループする
  for i in 1..n
    # j = 1, 2, ..., n-1, n とループする
    for j in 1..n
      res += "(#{i}, #{j}), "
    end
  end

  res
end

### Driver Code ###
if __FILE__ == $0
  n = 5

  res = for_loop(n)
  puts "\nfor ループの合計結果 res = #{res}"

  res = while_loop(n)
  puts "\nwhile ループの合計結果 res = #{res}"

  res = while_loop_ii(n)
  puts "\nwhile ループ（2 回更新）の合計結果 res = #{res}"

  res = nested_for_loop(n)
  puts "\n二重 for ループの走査結果 #{res}"
end
