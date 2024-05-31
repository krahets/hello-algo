=begin
File: counting_sort.rb
Created Time: 2024-05-02
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 計數排序 ###
def counting_sort_naive(nums)
  # 簡單實現，無法用於排序物件
  # 1. 統計陣列最大元素 m
  m = 0
  nums.each { |num| m = [m, num].max }
  # 2. 統計各數字的出現次數
  # counter[num] 代表 num 的出現次數
  counter = Array.new(m + 1, 0)
  nums.each { |num| counter[num] += 1 }
  # 3. 走訪 counter ，將各元素填入原陣列 nums
  i = 0
  for num in 0...(m + 1)
    (0...counter[num]).each do
      nums[i] = num
      i += 1
    end
  end
end

### 計數排序 ###
def counting_sort(nums)
  # 完整實現，可排序物件，並且是穩定排序
  # 1. 統計陣列最大元素 m
  m = nums.max
  # 2. 統計各數字的出現次數
  # counter[num] 代表 num 的出現次數
  counter = Array.new(m + 1, 0)
  nums.each { |num| counter[num] += 1 }
  # 3. 求 counter 的前綴和，將“出現次數”轉換為“尾索引”
  # 即 counter[num]-1 是 num 在 res 中最後一次出現的索引
  (0...m).each { |i| counter[i + 1] += counter[i] }
  # 4. 倒序走訪 nums, 將各元素填入結果陣列 res
  # 初始化陣列 res 用於記錄結果
  n = nums.length
  res = Array.new(n, 0)
  (n - 1).downto(0).each do |i|
    num = nums[i]
    res[counter[num] - 1] = num # 將 num 放置到對應索引處
    counter[num] -= 1 # 令前綴和自減 1 ，得到下次放置 num 的索引
  end
  # 使用結果陣列 res 覆蓋原陣列 nums
  (0...n).each { |i| nums[i] = res[i] }
end

### Driver Code ###
if __FILE__ == $0
  nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]

  counting_sort_naive(nums)
  puts "計數排序（無法排序物件）完成後 nums = #{nums}"

  nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
  counting_sort(nums1)
  puts "計數排序完成後 nums1 = #{nums1}"
end
