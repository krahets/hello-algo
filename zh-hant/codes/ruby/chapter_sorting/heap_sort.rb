=begin
File: heap_sort.rb
Created Time: 2024-04-10
Author: junminhong (junminhong1110@gmail.com)
=end

### 堆積的長度為 n，從節點 i 開始由上而下調整堆積 ###
def sift_down(nums, n, i)
  while true
    # 找出節點 i、l、r 中值最大的節點，記為 ma
    l = 2 * i + 1
    r = 2 * i + 2
    ma = i
    ma = l if l < n && nums[l] > nums[ma]
    ma = r if r < n && nums[r] > nums[ma]
    # 若節點 i 的值最大或索引 l、r 超出範圍，便無須繼續調整堆積，跳出迴圈
    break if ma == i
    # 交換兩個節點
    nums[i], nums[ma] = nums[ma], nums[i]
    # 以迴圈繼續向下調整堆積
    i = ma
  end
end

### 堆積排序 ###
def heap_sort(nums)
  # 建立堆積：對所有非葉節點執行堆積調整
  (nums.length / 2 - 1).downto(0) do |i|
    sift_down(nums, nums.length, i)
  end
  # 從堆積中取出最大元素，重複 n-1 輪
  (nums.length - 1).downto(1) do |i|
    # 交換根節點與最右側的葉節點（即交換首尾元素）
    nums[0], nums[i] = nums[i], nums[0]
    # 從根節點開始，由上而下調整堆積
    sift_down(nums, i, 0)
  end
end

### 主程式 ###
if __FILE__ == $0
  nums = [4, 1, 3, 1, 5, 2]
  heap_sort(nums)
  puts "堆積排序完成後 nums = #{nums.inspect}"
end
