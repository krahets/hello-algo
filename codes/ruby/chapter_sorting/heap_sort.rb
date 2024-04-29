=begin
File: heap_sort.rb
Created Time: 2024-04-10
Author: junminhong (junminhong1110@gmail.com)
=end

### 堆的长度为 n ，从节点 i 开始，从顶至底堆化 ###
def sift_down(nums, n, i)
  while true
    # 判断节点 i, l, r 中值最大的节点，记为 ma
    l = 2 * i + 1
    r = 2 * i + 2
    ma = i
    ma = l if l < n && nums[l] > nums[ma]
    ma = r if r < n && nums[r] > nums[ma]
    # 若节点 i 最大或索引 l, r 越界，则无须继续堆化，跳出
    break if ma == i
    # 交换两节点
    nums[i], nums[ma] = nums[ma], nums[i]
    # 循环向下堆化
    i = ma
  end
end

### 堆排序 ###
def heap_sort(nums)
  # 建堆操作：堆化除叶节点以外的其他所有节点
  (nums.length / 2 - 1).downto(0) do |i|
    sift_down(nums, nums.length, i)
  end
  # 从堆中提取最大元素，循环 n-1 轮
  (nums.length - 1).downto(1) do |i|
    # 交换根节点与最右叶节点（交换首元素与尾元素）
    nums[0], nums[i] = nums[i], nums[0]
    # 以根节点为起点，从顶至底进行堆化
    sift_down(nums, i, 0)
  end
end

### Driver Code ###
if __FILE__ == $0
  nums = [4, 1, 3, 1, 5, 2]
  heap_sort(nums)
  puts "堆排序完成后 nums = #{nums.inspect}"
end
