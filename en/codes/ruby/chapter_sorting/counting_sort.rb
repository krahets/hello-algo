=begin
File: counting_sort.rb
Created Time: 2024-05-02
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Counting sort ###
def counting_sort_naive(nums)
  # Simple implementation; cannot be used to sort objects
  # 1. Find the maximum array element m
  m = 0
  nums.each { |num| m = [m, num].max }
  # 2. Count the occurrences of each number
  # counter[num] is the number of occurrences of num
  counter = Array.new(m + 1, 0)
  nums.each { |num| counter[num] += 1 }
  # 3. Traverse counter and fill the original array nums with the elements
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
  # Full, stable implementation; the approach can be adapted to sort objects
  # 1. Find the maximum array element m
  m = nums.max
  # 2. Count the occurrences of each number
  # counter[num] is the number of occurrences of num
  counter = Array.new(m + 1, 0)
  nums.each { |num| counter[num] += 1 }
  # 3. Compute prefix sums of counter to convert occurrence counts into end positions
  # That is, counter[num]-1 is the index of the last occurrence of num in res
  (0...m).each { |i| counter[i + 1] += counter[i] }
  # 4. Traverse nums in reverse and place each element in the result array res
  # Initialize array res to store the result
  n = nums.length
  res = Array.new(n, 0)
  (n - 1).downto(0).each do |i|
    num = nums[i]
    res[counter[num] - 1] = num # Place num at the corresponding index
    counter[num] -= 1 # Decrement the prefix sum by 1 to determine where to place the next occurrence of num
  end
  # Overwrite the original array nums with the result array res
  (0...n).each { |i| nums[i] = res[i] }
end

### Driver code ###
if __FILE__ == $0
  nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]

  counting_sort_naive(nums)
  puts "After counting sort (cannot sort objects), nums = #{nums}"

  nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
  counting_sort(nums1)
  puts "After counting sort, nums1 = #{nums1}"
end
