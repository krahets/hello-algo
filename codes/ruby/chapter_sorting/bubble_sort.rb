=begin
File: bubble_sort.rb
Created Time: 2024-05-02
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 冒泡排序 ###
def bubble_sort(nums)
  n = nums.length
  # 外循环：未排序区间为 [0, i]
  for i in (n - 1).downto(1)
    # 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
    for j in 0...i
      if nums[j] > nums[j + 1]
        # 交换 nums[j] 与 nums[j + 1]
        nums[j], nums[j + 1] = nums[j + 1], nums[j]
      end
    end
  end
end

### 冒泡排序（标志优化）###
def bubble_sort_with_flag(nums)
  n = nums.length
  # 外循环：未排序区间为 [0, i]
  for i in (n - 1).downto(1)
    flag = false # 初始化标志位

    # 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
    for j in 0...i
      if nums[j] > nums[j + 1]
        # 交换 nums[j] 与 nums[j + 1]
        nums[j], nums[j + 1] = nums[j + 1], nums[j]
        flag = true # 记录交换元素
      end
    end

    break unless flag # 此轮“冒泡”未交换任何元素，直接跳出
  end
end

### Driver Code ###
if __FILE__ == $0
  nums = [4, 1, 3, 1, 5, 2]
  bubble_sort(nums)
  puts "冒泡排序完成后 nums = #{nums}"

  nums1 = [4, 1, 3, 1, 5, 2]
  bubble_sort_with_flag(nums1)
  puts "冒泡排序完成后 nums = #{nums1}"
end
