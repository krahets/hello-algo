=begin
File: list.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver Code ###
if __FILE__ == $0
  # [region]{init_list}
  # 初始化串列
  # 無初始值
  empty_nums = []
  # 有初始值
  nums = [1, 3, 2, 5, 4]
  # [endregion]{init_list}
  puts "串列 nums = #{nums}"
  puts "串列 empty_nums = #{empty_nums}"

  # [region]{access_element}
  # 訪問元素
  num = nums[1] # 訪問索引 1 處的元素
  # [endregion]{access_element}
  puts "訪問索引 1 處的元素，得到 num = #{num}"

  # [region]{update_element}
  # 更新元素
  nums[1] = 0 # 將索引 1 處的元素更新為 0
  # [endregion]{update_element}
  puts "將索引 1 處的元素更新為 0 ，得到 nums = #{nums}"

  # [region]{clear_list}
  # 清空串列
  nums.clear
  # [endregion]{clear_list}
  puts "清空串列後 nums = #{nums}"

  # [region]{append_element}
  # 在尾部新增元素
  nums << 1
  nums << 3
  nums << 2
  nums << 5
  nums << 4
  # [endregion]{append_element}
  puts "新增元素後 nums = #{nums}"

  # [region]{insert_element}
  # 在中間插入元素
  nums.insert(3, 6) # 在索引 3 處插入數字 6
  # [endregion]{insert_element}
  puts "在索引 3 處插入元素 6 ，得到 nums = #{nums}"

  # [region]{remove_element}
  # 刪除元素
  nums.delete_at(3) # 刪除索引 3 處的元素
  # [endregion]{remove_element}
  puts "刪除索引 3 處的元素，得到 nums = #{nums}"

  # [region]{iterate_list}
  # 透過索引走訪串列
  count = 0
  for i in 0...nums.length
    count += nums[i]
  end

  # 直接走訪串列元素
  count = 0
  nums.each do |x|
    count += x
  end
  # [endregion]{iterate_list}

  # [region]{concat_list}
  # 拼接兩個串列
  nums1 = [6, 8, 7, 10, 9]
  nums += nums1
  # [endregion]{concat_list}
  puts "將串列 nums1 拼接到 nums 之後，得到 nums = #{nums}"

  # [region]{sort_list}
  # 排序串列
  nums = nums.sort { |a, b| a <=> b } # 排序後，串列元素從小到大排列
  # [endregion]{sort_list}
  puts "排序串列後 nums = #{nums}"
end
