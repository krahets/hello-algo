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

  # [region]{access_element}
  # 访问元素
  num = nums[1] # 访问索引 1 处的元素
  # [endregion]{access_element}
  puts "访问索引 1 处的元素，得到 num = #{num}"

  # [region]{update_element}
  # 更新元素
  nums[1] = 0 # 将索引 1 处的元素更新为 0
  # [endregion]{update_element}
  puts "将索引 1 处的元素更新为 0 ，得到 nums = #{nums}"

  # [region]{clear_list}
  # 清空列表
  nums.clear
  # [endregion]{clear_list}
  puts "清空列表后 nums = #{nums}"

  # [region]{append_element}
  # 在尾部添加元素
  nums << 1
  nums << 3
  nums << 2
  nums << 5
  nums << 4
  # [endregion]{append_element}
  puts "添加元素后 nums = #{nums}"

  # [region]{insert_element}
  # 在中间插入元素
  nums.insert(3, 6) # 在索引 3 处插入数字 6
  # [endregion]{insert_element}
  puts "在索引 3 处插入元素 6 ，得到 nums = #{nums}"

  # [region]{remove_element}
  # 删除元素
  nums.delete_at(3) # 删除索引 3 处的元素
  # [endregion]{remove_element}
  puts "删除索引 3 处的元素，得到 nums = #{nums}"

  # [region]{iterate_list}
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
  # [endregion]{iterate_list}

  # [region]{concat_list}
  # 拼接两个列表
  nums1 = [6, 8, 7, 10, 9]
  nums += nums1
  # [endregion]{concat_list}
  puts "将列表 nums1 拼接到 nums 之后，得到 nums = #{nums}"

  # [region]{sort_list}
  # 排序列表
  nums = nums.sort { |a, b| a <=> b } # 排序后，列表元素从小到大排列
  # [endregion]{sort_list}
  puts "排序列表后 nums = #{nums}"
end
