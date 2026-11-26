=begin
File: radix_sort.rb
Created Time: 2024-05-03
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Get digit k of num, where exp = 10^(k-1) ###
def digit(num, exp)
  # Passing exp instead of k avoids repeating the costly exponentiation here
  (num / exp) % 10
end

### Counting sort by digit k of each element in nums###
def counting_sort_digit(nums, exp)
  # Decimal digits range from 0 to 9, so the bucket array needs 10 entries
  counter = Array.new(10, 0)
  n = nums.length
  # Count the occurrences of digits 0 through 9
  for i in 0...n
    d = digit(nums[i], exp) # Let d be digit k of nums[i]
    counter[d] += 1 # Count this occurrence of digit d
  end
  # Compute prefix sums to convert counts into array positions
  (1...10).each { |i| counter[i] += counter[i - 1] }
  # Traverse backward and use the bucket counts to place each element in res
  res = Array.new(n, 0)
  for i in (n - 1).downto(0)
    d = digit(nums[i], exp)
    j = counter[d] - 1 # Get the array index j for d
    res[j] = nums[i] # Place the current element at index j
    counter[d] -= 1 # Decrement the count for d by 1
  end
  # Copy the result back into nums
  (0...n).each { |i| nums[i] = res[i] }
end

### Radix sort ###
def radix_sort(nums)
  # Find the largest element to determine the maximum number of digits
  m = nums.max
  # Work from the least significant digit to the most significant
  exp = 1
  while exp <= m
    # Apply counting sort to the array elements by digit k
    # k = 1 -> exp = 1
    # k = 2 -> exp = 10
    # Here exp = 10^(k-1)
    counting_sort_digit(nums, exp)
    exp *= 10
  end
end

### Driver Code ###
if __FILE__ == $0
  # Radix sort
  nums = [
    10546151,
    35663510,
    42865989,
    34862445,
    81883077,
    88906420,
    72429244,
    30524779,
    82060337,
    63832996,
  ]
  radix_sort(nums)
  puts "After radix sort, nums = #{nums}"
end
