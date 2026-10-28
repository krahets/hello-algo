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

### 제곱 차수 ###
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

### 제곱 차수(버블 정렬)###
def bubble_sort(nums)
  count = 0  # 카운터

  # 바깥쪽 반복문: 정렬되지 않은 구간은 [0, i]이다
  for i in (nums.length - 1).downto(0)
    # 안쪽 반복문: 정렬되지 않은 구간 [0, i]의 최댓값을 교환하여 이 구간의 맨 오른쪽으로 옮긴다
    for j in 0...i
      if nums[j] > nums[j + 1]
        # nums[j]와 nums[j + 1]을 교환한다
        tmp = nums[j]
        nums[j] = nums[j + 1]
        nums[j + 1] = tmp
        count += 3 # 원소 교환에는 단위 연산 3회가 포함된다
      end
    end
  end

  count
end

### 지수 차수(반복문 구현)###
def exponential(n)
  count, base = 0, 1

  # 세포가 매번 둘로 나뉘어 수열 1, 2, 4, 8, ..., 2^(n-1)을 이룬다
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

### 로그 차수(반복문 구현)###
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
  # 하나에서 n개로 분열한다
  (0...n).each { count += factorial_recur(n - 1) }

  count
end

### 실행 코드 ###
if __FILE__ == $0
  # n을 바꾸어 실행하면서 각 복잡도에서 연산 횟수가 어떻게 변하는지 살펴볼 수 있다
  n = 8
  puts "입력 데이터 크기 n = #{n}"

  count = constant(n)
  puts "상수 차수의 연산 횟수 = #{count}"

  count = linear(n)
  puts "선형 차수의 연산 횟수 = #{count}"
  count = array_traversal(Array.new(n, 0))
  puts "선형 차수(배열 순회)의 연산 횟수 = #{count}"

  count = quadratic(n)
  puts "제곱 차수의 연산 횟수 = #{count}"
  nums = Array.new(n) { |i| n - i } # [n, n-1, ..., 2, 1]
  count = bubble_sort(nums)
  puts "제곱 차수(버블 정렬)의 연산 횟수 = #{count}"

  count = exponential(n)
  puts "지수 차수(반복문 구현)의 연산 횟수 = #{count}"
  count = exp_recur(n)
  puts "지수 차수(재귀 구현)의 연산 횟수 = #{count}"

  count = logarithmic(n)
  puts "로그 차수(반복문 구현)의 연산 횟수 = #{count}"
  count = log_recur(n)
  puts "로그 차수(재귀 구현)의 연산 횟수 = #{count}"

  count = linear_log_recur(n)
  puts "선형 로그 차수(재귀 구현)의 연산 횟수 = #{count}"

  count = factorial_recur(n)
  puts "팩토리얼 차수(재귀 구현)의 연산 횟수 = #{count}"
end
