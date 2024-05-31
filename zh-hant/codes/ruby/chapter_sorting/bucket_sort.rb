=begin
File: bucket_sort.rb
Created Time: 2024-04-17
Author: Martin Xu (martin.xus@gmail.com)
=end

### 桶排序 ###
def bucket_sort(nums)
  # 初始化 k = n/2 個桶，預期向每個桶分配 2 個元素
  k = nums.length / 2
  buckets = Array.new(k) { [] }
  
  # 1. 將陣列元素分配到各個桶中
  nums.each do |num|
    # 輸入資料範圍為 [0, 1)，使用 num * k 對映到索引範圍 [0, k-1]
    i = (num * k).to_i
    # 將 num 新增進桶 i
    buckets[i] << num
  end

  # 2. 對各個桶執行排序
  buckets.each do |bucket|
    # 使用內建排序函式，也可以替換成其他排序演算法
    bucket.sort!
  end

  # 3. 走訪桶合併結果
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
  # 設輸入資料為浮點數，範圍為 [0, 1)
  nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37]
  bucket_sort(nums)
  puts "桶排序完成後 nums = #{nums}"
end
