=begin
File: selection_sort.rb
Created Time: 2024-05-03
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 選擇排序 ###
def selection_sort(nums)
  n = nums.length
  # 外層迴圈：未排序區間為 [i, n-1]
  for i in 0...(n - 1)
    # 內層迴圈：找出未排序區間中的最小元素
    k = i
    for j in (i + 1)...n
      if nums[j] < nums[k]
        k = j # 記錄最小元素的索引
      end
    end
    # 將最小元素與未排序區間的第一個元素交換
    nums[i], nums[k] = nums[k], nums[i]
  end
end

### 主程式 ###
if __FILE__ == $0
  nums = [4, 1, 3, 1, 5, 2]
  selection_sort(nums)
  puts "選擇排序完成後 nums = #{nums}"
end
