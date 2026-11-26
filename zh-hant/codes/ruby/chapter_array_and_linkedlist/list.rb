=begin
File: list.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 範例主程式 ###
if __FILE__ == $0
  # 初始化列表
  nums = [1, 3, 2, 5, 4]
  puts "列表 nums = #{nums}"

  # 存取元素
  num = nums[1]
  puts "存取索引 1 處的元素，得到 num = #{num}"

  # 更新元素
  nums[1] = 0
  puts "將索引 1 處的元素更新為 0，得到 nums = #{nums}"

  # 清空列表
  nums.clear
  puts "清空列表後，nums = #{nums}"

  # 在尾端加入元素
  nums << 1
  nums << 3
  nums << 2
  nums << 5
  nums << 4
  puts "加入元素後，nums = #{nums}"

  # 在中間插入元素
  nums.insert(3, 6)
  puts "在索引 3 處插入元素 6，得到 nums = #{nums}"

  # 刪除元素
  nums.delete_at(3)
  puts "刪除索引 3 處的元素，得到 nums = #{nums}"

  # 依索引走訪列表
  count = 0
  for i in 0...nums.length
    count += nums[i]
  end

  # 直接走訪列表中的元素
  count = 0
  nums.each do |x|
    count += x
  end

  # 串接兩個列表
  nums1 = [6, 8, 7, 10, 9]
  nums += nums1
  puts "將列表 nums1 接在 nums 之後，得到 nums = #{nums}"

  nums = nums.sort { |a, b| a <=> b }
  puts "列表排序後，nums = #{nums}"
end
