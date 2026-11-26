=begin
File: array.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 임의의 원소에 접근 ###
def random_access(nums)
  # 구간 [0, nums.length)에서 수 하나를 무작위로 선택
  random_index = Random.rand(0...nums.length)

  # 선택한 원소를 가져와 반환
  nums[random_index]
end


### 배열 길이 늘리기 ###
# Ruby의 Array는 동적 배열이므로 바로 확장할 수 있다.
# 이 함수에서는 학습을 위해 Array를 길이가 고정된 배열로 취급한다.
def extend(nums, enlarge)
  # 길이를 늘린 새 배열 초기화
  res = Array.new(nums.length + enlarge, 0)

  # 원래 배열의 모든 원소를 새 배열에 복사
  for i in 0...nums.length
    res[i] = nums[i]
  end

  # 길이를 늘린 새 배열 반환
  res
end

### 배열의 인덱스 index에 원소 num 삽입 ###
def insert(nums, num, index)
  # 인덱스 index부터 끝까지 모든 원소를 뒤로 한 칸씩 이동
  for i in (nums.length - 1).downto(index + 1)
    nums[i] = nums[i - 1]
  end

  # 인덱스 index의 원소에 num 대입
  nums[index] = num
end


### 인덱스 index의 원소 삭제 ###
def remove(nums, index)
  # 인덱스 index 다음의 모든 원소를 앞으로 한 칸씩 이동
  for i in index...(nums.length - 1)
    nums[i] = nums[i + 1]
  end
end

### 배열 순회 ###
def traverse(nums)
  count = 0

  # 인덱스로 배열 순회
  for i in 0...nums.length
    count += nums[i]
  end

  # 배열 원소를 직접 순회
  for num in nums
    count += num
  end
end

### 배열에서 지정한 원소 찾기 ###
def find(nums, target)
  for i in 0...nums.length
    return i if nums[i] == target
  end

  -1
end


### 실행 예제 ###
if __FILE__ == $0
  # 배열 초기화
  arr = Array.new(5, 0)
  puts "배열 arr = #{arr}"
  nums = [1, 3, 2, 5, 4]
  puts "배열 nums = #{nums}"

  # 임의 접근
  random_num = random_access(nums)
  puts "nums에서 무작위로 선택한 원소: #{random_num}"

  # 길이 늘리기
  nums = extend(nums, 3)
  puts "길이를 8로 늘린 배열 nums = #{nums}"

  # 원소 삽입
  insert(nums, 6, 3)
  puts "인덱스 3에 숫자 6을 삽입한 후 nums = #{nums}"

  # 원소 삭제
  remove(nums, 2)
  puts "인덱스 2의 원소를 삭제한 후 nums = #{nums}"

  # 배열 순회
  traverse(nums)

  # 원소 찾기
  index = find(nums, 3)
  puts "nums에서 원소 3을 찾은 인덱스 = #{index}"
end
