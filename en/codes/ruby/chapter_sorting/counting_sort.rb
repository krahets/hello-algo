=begin
File: counting_sort.rb
Created Time: 2024-05-02
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Counting sort ###
def counting_sort_naive(nums)
  # Simple implementation, cannot be used for sorting objects
  # 1. Count the maximum element m in the array
  m = 0
  nums.each { |num| m = [m, num].max }
  # 2. Count the occurrence of each number
  # counter[num] represents the occurrence of num
  counter = Array.new(m + 1, 0)
  nums.each { |num| counter[num] += 1 }
  # 3. Traverse counter, filling each element back into the original array nums
  i = 0
  for num in 0...(m + 1)
    (0...counter[num]).each do
      nums[i] = num
      i += 1
    end
  end
end

### Counting sort ###
def counting_sort(nums)
  # Complete implementation, can sort objects and is a stable sort
  # 1. Count the maximum element m in the array
  m = nums.max
  # 2. Count the occurrence of each number
  # counter[num] represents the occurrence of num
  counter = Array.new(m + 1, 0)
  nums.each { |num| counter[num] += 1 }
  # 3. Calculate the prefix sum of counter, converting "occurrence count" to "tail index"
  # counter[num]-1 is the last index where num appears in res
  (0...m).each { |i| counter[i + 1] += counter[i] }
  # 4. Traverse nums in reverse, fill elements into result array res
  # Initialize the array res to record results
  n = nums.length
  res = Array.new(n, 0)
  (n - 1).downto(0).each do |i|
    num = nums[i]
    res[counter[num] - 1] = num # Place num at the corresponding index
    counter[num] -= 1 # Decrement the prefix sum by 1, getting the next index to place num
  end
  # Use result array res to overwrite the original array nums
  (0...n).each { |i| nums[i] = res[i] }
end

### Driver Code ###
if __FILE__ == $0
  nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]

  counting_sort_naive(nums)
  puts "After counting sort (cannot sort objects), nums = #{nums}"

  nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
  counting_sort(nums1)
  puts "After counting sort, nums1 = #{nums1}"
end
