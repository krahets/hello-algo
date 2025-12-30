=begin
File: radix_sort.rb
Created Time: 2024-05-03
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Get k-th digit of element num, where exp = 10^(k-1) ###
def digit(num, exp)
  # Passing exp instead of k avoids expensive exponentiation calculations
  (num / exp) % 10
end

### Counting sort (sort by k-th digit of nums) ###
def counting_sort_digit(nums, exp)
  # Decimal digit range is 0~9, therefore need a bucket array of length 10
  counter = Array.new(10, 0)
  n = nums.length
  # Count the occurrence of digits 0~9
  for i in 0...n
    d = digit(nums[i], exp) # Get the k-th digit of nums[i], noted as d
    counter[d] += 1 # Count the occurrence of digit d
  end
  # Calculate prefix sum, converting "occurrence count" into "array index"
  (1...10).each { |i| counter[i] += counter[i - 1] }
  # Traverse in reverse, based on bucket statistics, place each element into res
  res = Array.new(n, 0)
  for i in (n - 1).downto(0)
    d = digit(nums[i], exp)
    j = counter[d] - 1 # Get the index j for d in the array
    res[j] = nums[i] # Place the current element at index j
    counter[d] -= 1 # Decrease the count of d by 1
  end
  # Use result to overwrite the original array nums
  (0...n).each { |i| nums[i] = res[i] }
end

### Radix sort ###
def radix_sort(nums)
  # Get the maximum element of the array, used to determine the maximum number of digits
  m = nums.max
  # Traverse from the lowest to the highest digit
  exp = 1
  while exp <= m
    # Perform counting sort on the k-th digit of array elements
    # k = 1 -> exp = 1
    # k = 2 -> exp = 10
    # i.e., exp = 10^(k-1)
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
