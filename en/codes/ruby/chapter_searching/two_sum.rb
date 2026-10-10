=begin
File: two_sum.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

### Method 1: Brute force enumeration ###
def two_sum_brute_force(nums, target)
  # Two nested loops, time complexity is O(n^2)
  for i in 0...(nums.length - 1)
    for j in (i + 1)...nums.length
      return [i, j] if nums[i] + nums[j] == target
    end
  end

  []
end

### Method 2: Auxiliary hash table ###
def two_sum_hash_table(nums, target)
  # Auxiliary hash table, space complexity is O(n)
  dic = {}
  # Single loop, time complexity is O(n)
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
  # Method 1
  res = two_sum_brute_force(nums, target)
  puts "Method 1 res = #{res}"
  # Method 2
  res = two_sum_hash_table(nums, target)
  puts "Method 2 res = #{res}"
end
