=begin
File: merge_sort.rb
Created Time: 2024-04-10
Author: junminhong (junminhong1110@gmail.com)
=end

### 合併左、右子陣列 ###
def merge(nums, left, mid, right)
  # 左子陣列的區間為 [left, mid]，右子陣列的區間為 [mid+1, right]
  # 建立暫存陣列 tmp，用來存放合併結果
  tmp = Array.new(right - left + 1, 0)
  # 設定左、右子陣列的起始索引
  i, j, k = left, mid + 1, 0
  # 當左、右子陣列都還有元素時，比較兩邊的元素，將較小的元素複製到暫存陣列
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
  # 將左、右子陣列中剩餘的元素複製到暫存陣列
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
  # 將暫存陣列 tmp 的元素複製回原陣列 nums 的對應區間
  (0...tmp.length).each do |k|
    nums[left + k] = tmp[k]
  end
end

### 合併排序 ###
def merge_sort(nums, left, right)
  # 終止條件
  # 當子陣列的長度為 1 時，終止遞迴
  return if left >= right
  # 分割階段
  mid = left + (right - left) / 2 # 計算中點
  merge_sort(nums, left, mid) # 遞迴處理左子陣列
  merge_sort(nums, mid + 1, right) # 遞迴處理右子陣列
  # 合併階段
  merge(nums, left, mid, right)
end

### 主程式 ###
if __FILE__ == $0
  nums = [7, 3, 2, 6, 0, 1, 5, 4]
  merge_sort(nums, 0, nums.length - 1)
  puts "合併排序完成後 nums = #{nums.inspect}"
end
