=begin
File: selection_sort.rb
Created Time: 2024-05-03
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 选择排序 ###
def selection_sort(nums)
  n = nums.length
  # 外循环：未排序区间为 [i, n-1]
  for i in 0...(n - 1)
    # 内循环：找到未排序区间内的最小元素
    k = i
    for j in (i + 1)...n
      if nums[j] < nums[k]
        k = j # 记录最小元素的索引
      end
    end
    # 将该最小元素与未排序区间的首个元素交换
    nums[i], nums[k] = nums[k], nums[i]
  end
end

### Driver Code ###
if __FILE__ == $0
  nums = [4, 1, 3, 1, 5, 2]
  selection_sort(nums)
  puts "选择排序完成后 nums = #{nums}"
end
