=begin
File: merge_sort.rb
Created Time: 2024-04-10
Author: junminhong (junminhong1110@gmail.com)
=end

### 合併左子陣列和右子陣列 ###
def merge(nums, left, mid, right)
  # 左子陣列區間為 [left, mid], 右子陣列區間為 [mid+1, right]
  # 建立一個臨時陣列 tmp，用於存放合併後的結果
  tmp = Array.new(right - left + 1, 0)
  # 初始化左子陣列和右子陣列的起始索引
  i, j, k = left, mid + 1, 0
  # 當左右子陣列都還有元素時，進行比較並將較小的元素複製到臨時陣列中
  while i <= mid && j <= right
    if nums[i] <= nums[j]
      tmp[k] = nums[i]
      i += 1
    else
      tmp[k] = nums[j]
      j += 1
    end
    k += 1
  end
  # 將左子陣列和右子陣列的剩餘元素複製到臨時陣列中
  while i <= mid
    tmp[k] = nums[i]
    i += 1
    k += 1
  end
  while j <= right
    tmp[k] = nums[j]
    j += 1
    k += 1
  end
  # 將臨時陣列 tmp 中的元素複製回原陣列 nums 的對應區間
  (0...tmp.length).each do |k|
    nums[left + k] = tmp[k]
  end
end

### 合併排序 ###
def merge_sort(nums, left, right)
  # 終止條件
  # 當子陣列長度為 1 時終止遞迴
  return if left >= right
  # 劃分階段
  mid = left + (right - left) / 2 # 計算中點
  merge_sort(nums, left, mid) # 遞迴左子陣列
  merge_sort(nums, mid + 1, right) # 遞迴右子陣列
  # 合併階段
  merge(nums, left, mid, right)
end

### Driver Code ###
if __FILE__ == $0
  nums = [7, 3, 2, 6, 0, 1, 5, 4]
  merge_sort(nums, 0, nums.length - 1)
  puts "合併排序完成後 nums = #{nums.inspect}"
end
