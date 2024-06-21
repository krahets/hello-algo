=begin
File: worst_best_time_complexity.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 生成一个数组，元素为: 1, 2, ..., n ，顺序被打乱 ###
def random_numbers(n)
  # 生成数组 nums =: 1, 2, 3, ..., n
  nums = Array.new(n) { |i| i + 1 }
  # 随机打乱数组元素
  nums.shuffle!
end

### 查找数组 nums 中数字 1 所在索引 ###
def find_one(nums)
  for i in 0...nums.length
    # 当元素 1 在数组头部时，达到最佳时间复杂度 O(1)
    # 当元素 1 在数组尾部时，达到最差时间复杂度 O(n)
    return i if nums[i] == 1
  end

  -1
end

### Driver Code ###
if __FILE__ == $0
  for i in 0...10
    n = 100
    nums = random_numbers(n)
    index = find_one(nums)
    puts "\n数组 [ 1, 2, ..., n ] 被打乱后 = #{nums}"
    puts "数字 1 的索引为 #{index}"
  end
end
