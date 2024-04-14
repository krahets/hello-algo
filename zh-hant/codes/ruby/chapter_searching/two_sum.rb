=begin
File: two_sum.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

### 方法一：暴力列舉 ###
def two_sum_brute_force(nums, target)
  # 兩層迴圈，時間複雜度為 O(n^2)
  for i in 0...(nums.length - 1)
    for j in (i + 1)...nums.length
      return [i, j] if nums[i] + nums[j] == target
    end
  end

  []
end

### 方法二：輔助雜湊表 ###
def two_sum_hash_table(nums, target)
  # 輔助雜湊表，空間複雜度為 O(n)
  dic = {}
  # 單層迴圈，時間複雜度為 O(n)
  for i in 0...nums.length
    return [dic[target - nums[i]], i] if dic.has_key?(target - nums[i])

    dic[nums[i]] = i
  end

  []
end

### Driver Code ###
if __FILE__ == $0
  # ======= Test Case =======
  nums = [2, 7, 11, 15]
  target = 13

  # ====== Driver Code ======
  # 方法一
  res = two_sum_brute_force(nums, target)
  puts "方法一 res = #{res}"
  # 方法二
  res = two_sum_hash_table(nums, target)
  puts "方法二 res = #{res}"
end
