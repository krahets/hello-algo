=begin
File: complexity_exercises.rb
Created Time: 2026-08-18
Author: Hello Algo Team
=end

### 반복으로 합 구하기 ###
def sum_iter(n)
  res = 0
  for i in 1..n
    res += i
  end
  res
end

### 재귀로 합 구하기 ###
def sum_recur(n)
  return 1 if n == 1

  n + sum_recur(n - 1)
end

### 선형 차수 반복문 ###
def linear_loop(n)
  res = 0
  for i in 0...n
    res += i
  end
  res
end

### 제곱 차수 반복문 ###
def quadratic_loop(n)
  res = 0
  for i in 0...n
    for j in i...n
      res += j
    end
  end
  res
end

### 로그 차수 반복문 ###
def logarithmic_loop(n)
  n /= 2 while n > 1
  n
end

if __FILE__ == $0
  raise '합 검증에 실패했다' unless sum_iter(1) == 1 && sum_recur(1) == 1
  raise '합 검증에 실패했다' unless sum_iter(4) == 10 && sum_recur(4) == 10
  raise '선형 차수 검증에 실패했다' unless linear_loop(4) == 6
  raise '제곱 차수 검증에 실패했다' unless quadratic_loop(4) == 20
  raise '로그 차수 검증에 실패했다' unless logarithmic_loop(4) == 1 && logarithmic_loop(5) == 1
end
