=begin
File: bubble_sort.rb
Created Time: 2024-05-02
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 泡沫排序 ###
def bubble_sort(nums)
  n = nums.length
  # 外迴圈：未排序區間為 [0, i]
  for i in (n - 1).downto(1)
    # 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
    for j in 0...i
      if nums[j] > nums[j + 1]
        # 交換 nums[j] 與 nums[j + 1]
        nums[j], nums[j + 1] = nums[j + 1], nums[j]
      end
    end
  end
end

### 泡沫排序（標誌最佳化）###
def bubble_sort_with_flag(nums)
  n = nums.length
  # 外迴圈：未排序區間為 [0, i]
  for i in (n - 1).downto(1)
    flag = false # 初始化標誌位

    # 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
    for j in 0...i
      if nums[j] > nums[j + 1]
        # 交換 nums[j] 與 nums[j + 1]
        nums[j], nums[j + 1] = nums[j + 1], nums[j]
        flag = true # 記錄交換元素
      end
    end

    break unless flag # 此輪“冒泡”未交換任何元素，直接跳出
  end
end

### Driver Code ###
if __FILE__ == $0
  nums = [4, 1, 3, 1, 5, 2]
  bubble_sort(nums)
  puts "泡沫排序完成後 nums = #{nums}"

  nums1 = [4, 1, 3, 1, 5, 2]
  bubble_sort_with_flag(nums1)
  puts "泡沫排序完成後 nums = #{nums1}"
end
