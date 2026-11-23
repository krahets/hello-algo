=begin
File: binary_search.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

### 이진 탐색(양 끝을 포함하는 닫힌 구간) ###
def binary_search(nums, target)
  # 닫힌 구간 [0, n-1]을 초기화한다. i와 j는 각각 배열의 첫 원소와 마지막 원소를 가리킨다
  i, j = 0, nums.length - 1

  # 반복하다 탐색 구간이 비면 종료한다(i > j이면 빈 구간이다)
  while i <= j
    # Ruby의 정수는 이론상 메모리가 허용하는 만큼 커질 수 있으므로 큰 수의 오버플로를 고려할 필요가 없다
    m = (i + j) / 2   # 중간 인덱스 m을 계산한다
  
    if nums[m] < target
      i = m + 1 # 이 경우 target은 구간 [m+1, j]에 있다
    elsif nums[m] > target
      j = m - 1 # 이 경우 target은 구간 [i, m-1]에 있다
    else
      return m  # 목표 원소를 찾았으므로 해당 인덱스를 반환한다
    end
  end

  -1  # 목표 원소를 찾지 못했으므로 -1을 반환한다
end

### 이진 탐색(왼쪽 끝은 포함하고 오른쪽 끝은 제외하는 구간) ###
def binary_search_lcro(nums, target)
  # 왼쪽 끝만 포함하는 구간 [0, n)을 초기화한다. i는 배열의 첫 원소를, j는 마지막 원소 바로 다음 위치를 가리킨다
  i, j = 0, nums.length

  # 반복하다 탐색 구간이 비면 종료한다(i = j이면 빈 구간이다)
  while i < j
    # 중간 인덱스 m을 계산한다
    m = (i + j) / 2

    if nums[m] < target
      i = m + 1 # 이 경우 target은 구간 [m+1, j)에 있다
    elsif nums[m] > target
      j = m - 1 # 이 경우 target은 구간 [i, m)에 있다
    else
      return m  # 목표 원소를 찾았으므로 해당 인덱스를 반환한다
    end
  end

  -1  # 목표 원소를 찾지 못했으므로 -1을 반환한다
end

### 실행 코드 ###
if __FILE__ == $0
  target = 6
  nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

  # 이진 탐색(양 끝을 포함하는 닫힌 구간)
  index = binary_search(nums, target)
  puts "목표 원소 6의 인덱스 = #{index}"

  # 이진 탐색(왼쪽 끝은 포함하고 오른쪽 끝은 제외하는 구간)
  index = binary_search_lcro(nums, target)
  puts "목표 원소 6의 인덱스 = #{index}"
end
