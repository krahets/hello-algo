=begin
File: time_complexity.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 상수 차수 ###
def constant(n)
  count = 0
  size = 100000

  (0...size).each { count += 1 }

  count
end

### 선형 차수 ###
def linear(n)
  count = 0
  (0...n).each { count += 1 }
  count
end

### 선형 차수(배열 순회)###
def array_traversal(nums)
  count = 0

  # 반복 횟수는 배열 길이에 비례한다
  for num in nums
    count += 1
  end

  count
end

### 이차 차수 ###
def quadratic(n)
  count = 0

  # 반복 횟수는 데이터 크기 n의 제곱에 비례한다
  for i in 0...n
    for j in 0...n
      count += 1
    end
  end

  count
end

### 이차 차수(버블 정렬)###
def bubble_sort(nums)
  count = 0  # 카운터

  # 바깥 반복문: 정렬되지 않은 구간은 [0, i]이다
  for i in (nums.length - 1).downto(0)
    # 안쪽 반복문: 정렬되지 않은 구간 [0, i]에서 가장 큰 원소를 교환을 통해 맨 오른쪽으로 보낸다
    for j in 0...i
      if nums[j] > nums[j + 1]
        # nums[j]와 nums[j + 1]의 값을 맞바꾼다
        tmp = nums[j]
        nums[j] = nums[j + 1]
        nums[j + 1] = tmp
        count += 3 # 두 원소를 교환하는 데는 기본 연산 3회가 필요하다
      end
    end
  end

  count
end

### 지수 차수(반복 구현)###
def exponential(n)
  count, base = 0, 1

  # 세포가 매번 둘로 분열하여 그 수가 1, 2, 4, 8, ..., 2^(n-1)이 된다
  (0...n).each do
    (0...base).each { count += 1 }
    base *= 2
  end

  # count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
  count
end

### 지수 차수(재귀 구현)###
def exp_recur(n)
  return 1 if n == 1
  exp_recur(n - 1) + exp_recur(n - 1) + 1
end

### 로그 차수(반복 구현)###
def logarithmic(n)
  count = 0

  while n > 1
    n /= 2
    count += 1
  end

  count
end

### 로그 차수(재귀 구현)###
def log_recur(n)
  return 0 unless n > 1
  log_recur(n / 2) + 1
end

### 선형 로그 차수 ###
def linear_log_recur(n)
  return 1 unless n > 1

  count = linear_log_recur(n / 2) + linear_log_recur(n / 2)
  (0...n).each { count += 1 }

  count
end

### 팩토리얼 차수(재귀 구현)###
def factorial_recur(n)
  return 1 if n == 0

  count = 0
  # 하나가 n개로 나뉜다
  (0...n).each { count += factorial_recur(n - 1) }

  count
end

### 실행 예제 ###
if __FILE__ == $0
  # n을 바꿔 실행하며 복잡도에 따라 연산 횟수가 어떻게 변하는지 살펴보자
  n = 8
  puts "입력 크기 n = #{n}"

  count = constant(n)
  puts "상수 차수 연산 횟수 = #{count}"

  count = linear(n)
  puts "선형 차수 연산 횟수 = #{count}"
  count = array_traversal(Array.new(n, 0))
  puts "선형 차수(배열 순회) 연산 횟수 = #{count}"

  count = quadratic(n)
  puts "이차 차수 연산 횟수 = #{count}"
  nums = Array.new(n) { |i| n - i } # [n, n-1, ..., 2, 1]
  count = bubble_sort(nums)
  puts "이차 차수(버블 정렬) 연산 횟수 = #{count}"

  count = exponential(n)
  puts "지수 차수(반복 구현) 연산 횟수 = #{count}"
  count = exp_recur(n)
  puts "지수 차수(재귀 구현) 연산 횟수 = #{count}"

  count = logarithmic(n)
  puts "로그 차수(반복 구현) 연산 횟수 = #{count}"
  count = log_recur(n)
  puts "로그 차수(재귀 구현) 연산 횟수 = #{count}"

  count = linear_log_recur(n)
  puts "선형 로그 차수(재귀 구현) 연산 횟수 = #{count}"

  count = factorial_recur(n)
  puts "팩토리얼 차수(재귀 구현) 연산 횟수 = #{count}"
end
