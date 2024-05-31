=begin
File: heap_sort.rb
Created Time: 2024-04-10
Author: junminhong (junminhong1110@gmail.com)
=end

### 堆積的長度為 n ，從節點 i 開始，從頂至底堆積化 ###
def sift_down(nums, n, i)
  while true
    # 判斷節點 i, l, r 中值最大的節點，記為 ma
    l = 2 * i + 1
    r = 2 * i + 2
    ma = i
    ma = l if l < n && nums[l] > nums[ma]
    ma = r if r < n && nums[r] > nums[ma]
    # 若節點 i 最大或索引 l, r 越界，則無須繼續堆積化，跳出
    break if ma == i
    # 交換兩節點
    nums[i], nums[ma] = nums[ma], nums[i]
    # 迴圈向下堆積化
    i = ma
  end
end

### 堆積排序 ###
def heap_sort(nums)
  # 建堆積操作：堆積化除葉節點以外的其他所有節點
  (nums.length / 2 - 1).downto(0) do |i|
    sift_down(nums, nums.length, i)
  end
  # 從堆積中提取最大元素，迴圈 n-1 輪
  (nums.length - 1).downto(1) do |i|
    # 交換根節點與最右葉節點（交換首元素與尾元素）
    nums[0], nums[i] = nums[i], nums[0]
    # 以根節點為起點，從頂至底進行堆積化
    sift_down(nums, i, 0)
  end
end

### Driver Code ###
if __FILE__ == $0
  nums = [4, 1, 3, 1, 5, 2]
  heap_sort(nums)
  puts "堆積排序完成後 nums = #{nums.inspect}"
end
