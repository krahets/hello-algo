=begin
File: worst_best_time_complexity.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 生成一個陣列，元素為: 1, 2, ..., n ，順序被打亂 ###
def random_numbers(n)
  # 生成陣列 nums =: 1, 2, 3, ..., n
  nums = Array.new(n) { |i| i + 1 }
  # 隨機打亂陣列元素
  nums.shuffle!
end

### 查詢陣列 nums 中數字 1 所在索引 ###
def find_one(nums)
  for i in 0...nums.length
    # 當元素 1 在陣列頭部時，達到最佳時間複雜度 O(1)
    # 當元素 1 在陣列尾部時，達到最差時間複雜度 O(n)
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
    puts "\n陣列 [ 1, 2, ..., n ] 被打亂後 = #{nums}"
    puts "數字 1 的索引為 #{index}"
  end
end
