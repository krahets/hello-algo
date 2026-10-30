=begin
File: bucket_sort.rb
Created Time: 2024-04-17
Author: Martin Xu (martin.xus@gmail.com)
=end

### Bucket sort ###
def bucket_sort(nums)
  # Initialize k = floor(n/2) buckets, aiming for about 2 elements per bucket
  k = nums.length / 2
  buckets = Array.new(k) { [] }
  
  # 1. Distribute the array elements among the buckets
  nums.each do |num|
    # The input range is [0, 1); use num * k to map each value to an index in [0, k-1]
    i = (num * k).to_i
    # Add num to bucket i
    buckets[i] << num
  end

  # 2. Sort each bucket
  buckets.each do |bucket|
    # Use the built-in sorting function, or replace it with another sorting algorithm
    bucket.sort!
  end

  # 3. Traverse the buckets to combine the results
  i = 0
  buckets.each do |bucket|
    bucket.each do |num|
      nums[i] = num
      i += 1
    end
  end
end

### Driver code ###
if __FILE__ == $0
  # Assume the input consists of floating-point numbers in [0, 1)
  nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37]
  bucket_sort(nums)
  puts "After bucket sort, nums = #{nums}"
end
