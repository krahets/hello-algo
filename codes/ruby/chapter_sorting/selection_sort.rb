# File: selection_sort.rb
# Created Time: 2024-03-15
# Author: jasper (junminhong1110@gmail.com)

# 負責找到最小元素的pointer並回傳
def find_smallest_value_pointer(nums, pointer)
  smallest_pointer = pointer
  smallest_value = nums[pointer]

  # 內迴圈: 找到未排序區間內的最小元素
  while pointer < nums.size
    if nums[pointer] < smallest_value
      smallest_value = nums[pointer]
      # 記錄最小的元素的索引
      smallest_pointer = pointer
    end
    pointer += 1
  end

  return smallest_pointer
end

# 選擇排序
def selection_sort(nums)
  pointer = 0
  # 外迴圈: 未排序區間[i, n - 1]
  while pointer < nums.size - 1
    smallest_pointer = find_smallest_value_pointer(nums, pointer)

    # swap
    nums[pointer], nums[smallest_pointer] = nums[smallest_pointer], nums[pointer]

    pointer += 1
  end
  return nums
end

puts selection_sort([76, 98, 28, 51, 14, 44, 21, 13, 90, 97])
