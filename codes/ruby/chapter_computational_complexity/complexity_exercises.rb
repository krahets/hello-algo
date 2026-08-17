=begin
File: complexity_exercises.rb
Created Time: 2026-08-18
Author: Hello Algo Team
=end

### 迭代求和 ###
def sum_iter(n)
  res = 0
  for i in 1..n
    res += i
  end
  res
end

### 递归求和 ###
def sum_recur(n)
  return 1 if n == 1

  n + sum_recur(n - 1)
end

### 线性阶循环 ###
def linear_loop(n)
  res = 0
  for i in 0...n
    res += i
  end
  res
end

### 平方阶循环 ###
def quadratic_loop(n)
  res = 0
  for i in 0...n
    for j in i...n
      res += j
    end
  end
  res
end

### 对数阶循环 ###
def logarithmic_loop(n)
  n /= 2 while n > 1
  n
end

if __FILE__ == $0
  raise 'sum check failed' unless sum_iter(1) == 1 && sum_recur(1) == 1
  raise 'sum check failed' unless sum_iter(4) == 10 && sum_recur(4) == 10
  raise 'linear check failed' unless linear_loop(4) == 6
  raise 'quadratic check failed' unless quadratic_loop(4) == 20
  raise 'logarithmic check failed' unless logarithmic_loop(4) == 1 && logarithmic_loop(5) == 1
end
