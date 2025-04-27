=begin
File: insertion_sort.rb
Created Time: 2024-04-02
Author: Cy (3739004@gmail.com), Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 插入排序 ###
def insertion_sort(nums)
  n = nums.length
  # 外迴圈：已排序區間為 [0, i-1]
  for i in 1...n
    base = nums[i]
    j = i - 1
    # 內迴圈：將 base 插入到已排序區間 [0, i-1] 中的正確位置
    while j >= 0 && nums[j] > base
      nums[j + 1] = nums[j] # 將 nums[j] 向右移動一位
      j -= 1
    end
    nums[j + 1] = base # 將 base 賦值到正確位置
  end
end

### Driver Code ###
nums = [4, 1, 3, 1, 5, 2]
insertion_sort(nums)
puts "插入排序完成後 nums = #{nums}"
