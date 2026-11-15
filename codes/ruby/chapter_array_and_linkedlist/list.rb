=begin
File: list.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver Code ###
if __FILE__ == $0
  # 初始化列表
  nums = [1, 3, 2, 5, 4]
  puts "列表 nums = #{nums}"

  # 访问元素
  num = nums[1]
  puts "访问索引 1 处的元素，得到 num = #{num}"

  # 更新元素
  nums[1] = 0
  puts "将索引 1 处的元素更新为 0 ，得到 nums = #{nums}"

  # 清空列表
  nums.clear
  puts "清空列表后 nums = #{nums}"

  # 在尾部添加元素
  nums << 1
  nums << 3
  nums << 2
  nums << 5
  nums << 4
  puts "添加元素后 nums = #{nums}"

  # 在中间插入元素
  nums.insert(3, 6)
  puts "在索引 3 处插入元素 6 ，得到 nums = #{nums}"

  # 删除元素
  nums.delete_at(3)
  puts "删除索引 3 处的元素，得到 nums = #{nums}"

  # 通过索引遍历列表
  count = 0
  for i in 0...nums.length
    count += nums[i]
  end

  # 直接遍历列表元素
  count = 0
  nums.each do |x|
    count += x
  end

  # 拼接两个列表
  nums1 = [6, 8, 7, 10, 9]
  nums += nums1
  puts "将列表 nums1 拼接到 nums 之后，得到 nums = #{nums}"

  nums = nums.sort { |a, b| a <=> b }
  puts "排序列表后 nums = #{nums}"
end
