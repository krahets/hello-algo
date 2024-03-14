# File: bubble_sort.rb
# Created Time: 2024-03-15
# Author: jasper (junminhong1110@gmail.com)

# 冒泡排序
def bubble_sort(nums)
  pointer = 0
  # 外迴圈: 未排序區間[0, i]
  while pointer < nums.size - 1
    sub_pointer = 0
     # 內迴圈: 將未排序區間[0, i]中的最大元素交換至該區間的最右邊
    while sub_pointer < pointer
      if nums[pointer] < nums[sub_pointer]
        # swap
        nums[sub_pointer], nums[sub_pointer + 1] = nums[sub_pointer + 1], nums[sub_pointer]
      end
      sub_pointer += 1
    end
    pointer += 1
  end
  return nums
end

# 優化後的冒泡排序
def optimization_bubble_sort(nums)
  pointer = 0
  # 外迴圈: 未排序區間[0, i]
  while pointer < nums.size - 1
    sub_pointer = 0
    # 初始化flag
    flag = false
    # 內迴圈: 將未排序區間[0, i]中的最大元素交換至該區間的最右邊
    while sub_pointer < pointer
      if nums[pointer] < nums[sub_pointer]
        # swap
        nums[sub_pointer], nums[sub_pointer + 1] = nums[sub_pointer + 1], nums[sub_pointer]
        # 記錄有交換元素
        flag = true
      end

      # 此輪未交換任何元素, 直接離開
      break unless flag

      sub_pointer += 1
    end
    pointer += 1
  end
  return nums
end
