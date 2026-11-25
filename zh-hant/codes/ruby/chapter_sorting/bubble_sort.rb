=begin
File: bubble_sort.rb
Created Time: 2024-05-02
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 氣泡排序 ###
def bubble_sort(nums)
  n = nums.length
  # 外層迴圈：尚未排序的區間為 [0, i]
  for i in (n - 1).downto(1)
    # 內層迴圈：逐次交換，將未排序區間 [0, i] 中的最大元素移到區間最右端
    for j in 0...i
      if nums[j] > nums[j + 1]
        # 交換 nums[j] 與 nums[j + 1]
        nums[j], nums[j + 1] = nums[j + 1], nums[j]
      end
    end
  end
end

### 氣泡排序（以旗標最佳化）###
def bubble_sort_with_flag(nums)
  n = nums.length
  # 外層迴圈：尚未排序的區間為 [0, i]
  for i in (n - 1).downto(1)
    flag = false # 初始化旗標

    # 內層迴圈：逐次交換，將未排序區間 [0, i] 中的最大元素移到區間最右端
    for j in 0...i
      if nums[j] > nums[j + 1]
        # 交換 nums[j] 與 nums[j + 1]
        nums[j], nums[j + 1] = nums[j + 1], nums[j]
        flag = true # 記錄本輪曾交換元素
      end
    end

    break unless flag # 這一輪「冒泡」未交換任何元素，直接跳出迴圈
  end
end

### 主程式 ###
if __FILE__ == $0
  nums = [4, 1, 3, 1, 5, 2]
  bubble_sort(nums)
  puts "氣泡排序完成後 nums = #{nums}"

  nums1 = [4, 1, 3, 1, 5, 2]
  bubble_sort_with_flag(nums1)
  puts "氣泡排序完成後 nums = #{nums1}"
end
