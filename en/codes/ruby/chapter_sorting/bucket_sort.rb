=begin
File: bucket_sort.rb
Created Time: 2024-04-17
Author: Martin Xu (martin.xus@gmail.com)
=end

### Bucket sort ###
def bucket_sort(nums)
  # Initialize k = n/2 buckets, expected to allocate 2 elements per bucket
  k = nums.length / 2
  buckets = Array.new(k) { [] }
  
  # 1. Distribute array elements into various buckets
  nums.each do |num|
    # Input data range is [0, 1), use num * k to map to index range [0, k-1]
    i = (num * k).to_i
    # Add num to bucket i
    buckets[i] << num
  end

  # 2. Sort each bucket
  buckets.each do |bucket|
    # Use built-in sorting function, can also replace with other sorting algorithms
    bucket.sort!
  end

  # 3. Traverse buckets to merge results
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
  # Assume input data is floating point, interval [0, 1)
  nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37]
  bucket_sort(nums)
  puts "After bucket sort, nums = #{nums}"
end
