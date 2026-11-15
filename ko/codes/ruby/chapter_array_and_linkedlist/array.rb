=begin
File: array.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 원소에 임의 접근 ###
def random_access(nums)
  # 구간 [0, nums.length)에서 숫자 하나를 무작위로 뽑는다
  random_index = Random.rand(0...nums.length)

  # 무작위 원소를 가져와 반환한다
  nums[random_index]
end


### 배열 길이 확장 ###
# Ruby의 Array는 동적 배열이므로 직접 확장할 수 있다
# 학습의 편의를 위해 이 함수에서는 Array를 길이가 고정된 배열로 취급한다
def extend(nums, enlarge)
  # 길이를 확장한 배열을 초기화한다
  res = Array.new(nums.length + enlarge, 0)

  # 원래 배열의 모든 원소를 새 배열에 복사한다
  for i in 0...nums.length
    res[i] = nums[i]
  end

  # 확장한 새 배열을 반환한다
  res
end

### 배열의 인덱스 index에 원소 num 삽입 ###
def insert(nums, num, index)
  # 인덱스 index와 그 뒤에 있는 모든 원소를 한 칸씩 뒤로 이동한다
  for i in (nums.length - 1).downto(index + 1)
    nums[i] = nums[i - 1]
  end

  # index 위치의 원소에 num을 대입한다
  nums[index] = num
end


### 인덱스 index에 있는 원소 삭제 ###
def remove(nums, index)
  # 인덱스 index 뒤에 있는 모든 원소를 한 칸씩 앞으로 이동한다
  for i in index...(nums.length - 1)
    nums[i] = nums[i + 1]
  end
end

### 배열 순회 ###
def traverse(nums)
  count = 0

  # 인덱스를 통해 배열을 순회한다
  for i in 0...nums.length
    count += nums[i]
  end

  # 배열의 원소를 직접 순회한다
  for num in nums
    count += num
  end
end

### 배열에서 지정한 원소 탐색 ###
def find(nums, target)
  for i in 0...nums.length
    return i if nums[i] == target
  end

  -1
end


### 실행 코드 ###
if __FILE__ == $0
  # 배열 초기화
  arr = Array.new(5, 0)
  puts "배열 arr = #{arr}"
  nums = [1, 3, 2, 5, 4]
  puts "배열 nums = #{nums}"

  # 임의 접근
  random_num = random_access(nums)
  puts "nums에서 무작위로 가져온 원소 #{random_num}"

  # 길이 확장
  nums = extend(nums, 3)
  puts "배열 길이를 8로 확장한 후 nums = #{nums}"

  # 원소 삽입
  insert(nums, 6, 3)
  puts "인덱스 3에 숫자 6을 삽입한 후 nums = #{nums}"

  # 원소 삭제
  remove(nums, 2)
  puts "인덱스 2의 원소를 삭제한 후 nums = #{nums}"

  # 배열 순회
  traverse(nums)

  # 원소 탐색
  index = find(nums, 3)
  puts "nums에서 원소 3을 탐색하여 얻은 인덱스 = #{index}"
end
