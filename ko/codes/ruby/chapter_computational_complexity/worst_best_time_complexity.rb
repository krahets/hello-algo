=begin
File: worst_best_time_complexity.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 원소가 1, 2, ..., n이며 순서가 섞인 배열 생성 ###
def random_numbers(n)
  # 배열 nums =: 1, 2, 3, ..., n을 생성한다
  nums = Array.new(n) { |i| i + 1 }
  # 배열 원소를 무작위로 섞는다
  nums.shuffle!
end

### 배열 nums에서 숫자 1이 있는 인덱스 탐색 ###
def find_one(nums)
  for i in 0...nums.length
    # 원소 1이 배열 맨 앞에 있으면 최선 시간 복잡도 O(1)에 도달한다
    # 원소 1이 배열 맨 뒤에 있으면 최악 시간 복잡도 O(n)에 도달한다
    return i if nums[i] == 1
  end

  -1
end

### 실행 코드 ###
if __FILE__ == $0
  for i in 0...10
    n = 100
    nums = random_numbers(n)
    index = find_one(nums)
    puts "\n배열 [ 1, 2, ..., n ]을 섞은 결과 = #{nums}"
    puts "숫자 1의 인덱스: #{index}"
  end
end
