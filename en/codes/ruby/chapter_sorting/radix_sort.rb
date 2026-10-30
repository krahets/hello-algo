=begin
File: radix_sort.rb
Created Time: 2024-05-03
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Get the k-th digit of num, where exp = 10^(k-1) ###
def digit(num, exp)
  # Passing exp instead of k avoids repeatedly performing expensive exponentiation here
  (num / exp) % 10
end

### Counting sort (sort nums by the k-th digit)###
def counting_sort_digit(nums, exp)
  # Decimal digits range from 0 to 9, so the bucket array needs length 10
  counter = Array.new(10, 0)
  n = nums.length
  # Count the occurrences of each digit from 0 to 9
  for i in 0...n
    d = digit(nums[i], exp) # Get the k-th digit of nums[i] and store it in d
    counter[d] += 1 # Count the occurrences of digit d
  end
  # Compute prefix sums to convert occurrence counts into array positions
  (1...10).each { |i| counter[i] += counter[i - 1] }
  # Traverse in reverse and place each element into res according to the bucket counts
  res = Array.new(n, 0)
  for i in (n - 1).downto(0)
    d = digit(nums[i], exp)
    j = counter[d] - 1 # Get the destination index j for digit d in the array
    res[j] = nums[i] # Place the current element at index j
    counter[d] -= 1 # Decrease the count for d by 1
  end
  # Overwrite the original array nums with the result
  (0...n).each { |i| nums[i] = res[i] }
end

### Radix sort ###
def radix_sort(nums)
  # Get the largest array element to determine the maximum number of digits
  m = nums.max
  # Process digits from least significant to most significant
  exp = 1
  while exp <= m
    # Apply counting sort to the k-th digit of the array elements
    # k = 1 -> exp = 1
    # k = 2 -> exp = 10
    # That is, exp = 10^(k-1)
    counting_sort_digit(nums, exp)
    exp *= 10
  end
end

### Driver code ###
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
