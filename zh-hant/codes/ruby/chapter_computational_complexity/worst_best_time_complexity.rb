=begin
File: worst_best_time_complexity.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 建立含有 1, 2, ..., n 的陣列，並打亂順序 ###
def random_numbers(n)
  # 建立陣列 nums = 1, 2, 3, ..., n
  nums = Array.new(n) { |i| i + 1 }
  # 隨機打亂陣列元素
  nums.shuffle!
end

### 在陣列 nums 中尋找數字 1 的索引 ###
def find_one(nums)
  for i in 0...nums.length
    # 若 1 在陣列開頭，最佳時間複雜度為 O(1)
    # 若 1 在陣列末端，最差時間複雜度為 O(n)
    return i if nums[i] == 1
  end

  -1
end

### 主程式 ###
if __FILE__ == $0
  for i in 0...10
    n = 100
    nums = random_numbers(n)
    index = find_one(nums)
    puts "\n陣列 [ 1, 2, ..., n ] 打亂順序後 = #{nums}"
    puts "數字 1 的索引為 #{index}"
  end
end
