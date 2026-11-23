=begin
File: binary_search_recur.rb
Created Time: 2024-05-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 이진 탐색: 문제 f(i, j) ###
def dfs(nums, target, i, j)
  # 구간이 비어 있으면 목표 원소가 없다는 뜻이므로 -1을 반환한다
  return -1 if i > j
  
  # 중간 인덱스 m을 계산한다
  m = (i + j) / 2

  if nums[m] < target
    # 부분 문제 f(m+1, j)를 재귀적으로 푼다
    return dfs(nums, target, m + 1, j)
  elsif nums[m] > target
    # 부분 문제 f(i, m-1)를 재귀적으로 푼다
    return dfs(nums, target, i, m - 1)
  else
    # 목표 원소를 찾았으므로 해당 인덱스를 반환한다
    return m
  end
end

### 이진 탐색 ###
def binary_search(nums, target)
  n = nums.length
  # 문제 f(0, n-1)을 푼다
  dfs(nums, target, 0, n - 1)
end

### 실행 코드 ###
if __FILE__ == $0
  target = 6
  nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

  # 이진 탐색(양 끝을 포함하는 닫힌 구간)
  index = binary_search(nums, target)
  puts "목표 원소 6의 인덱스 = #{index}"
end
