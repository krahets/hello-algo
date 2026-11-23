=begin
File: complexity_exercises.rb
Created Time: 2026-08-18
Author: Hello Algo Team
=end

### 反復による総和 ###
def sum_iter(n)
  res = 0
  for i in 1..n
    res += i
  end
  res
end

### 再帰による総和 ###
def sum_recur(n)
  return 1 if n == 1

  n + sum_recur(n - 1)
end

### 線形オーダーのループ ###
def linear_loop(n)
  res = 0
  for i in 0...n
    res += i
  end
  res
end

### 二次オーダーのループ ###
def quadratic_loop(n)
  res = 0
  for i in 0...n
    for j in i...n
      res += j
    end
  end
  res
end

### 対数オーダーのループ ###
def logarithmic_loop(n)
  n /= 2 while n > 1
  n
end

if __FILE__ == $0
  raise '総和の検証に失敗しました' unless sum_iter(1) == 1 && sum_recur(1) == 1
  raise '総和の検証に失敗しました' unless sum_iter(4) == 10 && sum_recur(4) == 10
  raise '線形オーダーの検証に失敗しました' unless linear_loop(4) == 6
  raise '二次オーダーの検証に失敗しました' unless quadratic_loop(4) == 20
  raise '対数オーダーの検証に失敗しました' unless logarithmic_loop(4) == 1 && logarithmic_loop(5) == 1
end
