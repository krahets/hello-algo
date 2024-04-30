=begin
File: bucket_sort.rb
Created Time: 2024-04-17
Author: Martin Xu (martin.xus@gmail.com)
=end

### 桶排序 ###
def bucket_sort(nums)
  # 初始化 k = n/2 个桶，预期向每个桶分配 2 个元素
  k = nums.length / 2
  buckets = Array.new(k) { [] }
  
  # 1. 将数组元素分配到各个桶中
  nums.each do |num|
    # 输入数据范围为 [0, 1)，使用 num * k 映射到索引范围 [0, k-1]
    i = (num * k).to_i
    # 将 num 添加进桶 i
    buckets[i] << num
  end

  # 2. 对各个桶执行排序
  buckets.each do |bucket|
    # 使用内置排序函数，也可以替换成其他排序算法
    bucket.sort!
  end

  # 3. 遍历桶合并结果
  i = 0
  buckets.each do |bucket|
    bucket.each do |num|
      nums[i] = num
      i += 1
    end
  end
end

### Driver Code ###
if __FILE__ == $0
  # 设输入数据为浮点数，范围为 [0, 1)
  nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37]
  bucket_sort(nums)
  puts "桶排序完成后 nums = #{nums}"
end
