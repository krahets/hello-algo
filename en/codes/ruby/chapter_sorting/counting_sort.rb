=begin
File: counting_sort.rb
Created Time: 2024-05-02
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Counting sort ###
def counting_sort_naive(nums)
  # Simple implementation that cannot sort objects
  # 1. Find the largest array element m
  m = 0
  nums.each { |num| m = [m, num].max }
  # 2. Count the occurrences of each number
  # counter[num] holds the number of occurrences of num
  counter = Array.new(m + 1, 0)
  nums.each { |num| counter[num] += 1 }
  # 3. Traverse counter and write each value back into nums
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
  # Full implementation that can sort objects and is stable
  # 1. Find the largest array element m
  m = nums.max
  # 2. Count the occurrences of each number
  # counter[num] holds the number of occurrences of num
  counter = Array.new(m + 1, 0)
  nums.each { |num| counter[num] += 1 }
  # 3. Compute prefix sums in counter to locate the last position for each value
  # That is, counter[num]-1 is the last index of num in res
  (0...m).each { |i| counter[i + 1] += counter[i] }
  # 4. Traverse nums backward and place each element in the result array res
  # Initialize the result array res
  n = nums.length
  res = Array.new(n, 0)
  (n - 1).downto(0).each do |i|
    num = nums[i]
    res[counter[num] - 1] = num # Place num at its corresponding index
    counter[num] -= 1 # Decrement the prefix sum by 1 to find the next index for num
  end
  # Copy res back into the original array nums
  (0...n).each { |i| nums[i] = res[i] }
end

### Driver Code ###
if __FILE__ == $0
  nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]

  counting_sort_naive(nums)
  puts "After counting sort (values only), nums = #{nums}"

  nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
  counting_sort(nums1)
  puts "After counting sort, nums1 = #{nums1}"
end
