=begin
File: binary_search_insertion.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

### 삽입 위치의 이진 탐색(중복 원소 없음) ###
def binary_search_insertion_simple(nums, target)
  # 닫힌 구간 [0, n-1]을 초기화한다
  i, j = 0, nums.length - 1

  while i <= j
    # 중간 인덱스 m을 계산한다
    m = (i + j) / 2

    if nums[m] < target
      i = m + 1 # target은 구간 [m+1, j]에 있다
    elsif nums[m] > target
      j = m - 1 # target은 구간 [i, m-1]에 있다
    else
      return m  # target을 찾았으므로 삽입 위치 m을 반환한다
    end
  end

  i # target을 찾지 못했으므로 삽입 위치 i를 반환한다
end

### 삽입 위치의 이진 탐색(중복 원소 있음) ###
def binary_search_insertion(nums, target)
  # 닫힌 구간 [0, n-1]을 초기화한다
  i, j = 0, nums.length - 1

  while i <= j
    # 중간 인덱스 m을 계산한다
    m = (i + j) / 2

    if nums[m] < target
      i = m + 1 # target은 구간 [m+1, j]에 있다
    elsif nums[m] > target
      j = m - 1 # target은 구간 [i, m-1]에 있다
    else
      j = m - 1 # target보다 작은 가장 오른쪽 원소는 구간 [i, m-1]에 있다
    end
  end

  i # 삽입 위치 i를 반환한다
end

### 실행 코드 ###
if __FILE__ == $0
  # 중복 원소가 없는 배열
  nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]
  puts "\n배열 nums = #{nums}"
  # 삽입 위치의 이진 탐색
  for target in [6, 9]
    index = binary_search_insertion_simple(nums, target)
    puts "원소 #{target}의 삽입 위치 인덱스: #{index}"
  end

  # 중복 원소를 포함하는 배열
  nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
  puts "\n배열 nums = #{nums}"
  # 삽입 위치의 이진 탐색
  for target in [2, 6, 20]
    index = binary_search_insertion(nums, target)
    puts "원소 #{target}의 삽입 위치 인덱스: #{index}"
  end
end
