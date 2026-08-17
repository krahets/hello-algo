=begin
File: time_complexity.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Constant time ###
def constant(n)
  count = 0
  size = 100000

  (0...size).each { count += 1 }

  count
end

### Linear time ###
def linear(n)
  count = 0
  (0...n).each { count += 1 }
  count
end

### Linear time (array traversal) ###
def array_traversal(nums)
  count = 0

  # Number of iterations is proportional to the array length
  for num in nums
    count += 1
  end

  count
end

### Quadratic time ###
def quadratic(n)
  count = 0

  # Number of iterations is quadratically related to the data size n
  for i in 0...n
    for j in 0...n
      count += 1
    end
  end

  count
end

### Quadratic time (bubble sort) ###
def bubble_sort(nums)
  count = 0  # Counter

  # Outer loop: unsorted range is [0, i]
  for i in (nums.length - 1).downto(0)
    # Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
    for j in 0...i
      if nums[j] > nums[j + 1]
        # Swap nums[j] and nums[j + 1]
        tmp = nums[j]
        nums[j] = nums[j + 1]
        nums[j + 1] = tmp
        count += 3 # Element swap includes 3 unit operations
      end
    end
  end

  count
end

### Exponential time (iterative) ###
def exponential(n)
  count, base = 0, 1

  # Cells divide into two every round, forming sequence 1, 2, 4, 8, ..., 2^(n-1)
  (0...n).each do
    (0...base).each { count += 1 }
    base *= 2
  end

  # count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
  count
end

### Exponential time (recursive) ###
def exp_recur(n)
  return 1 if n == 1
  exp_recur(n - 1) + exp_recur(n - 1) + 1
end

### Logarithmic time (iterative) ###
def logarithmic(n)
  count = 0

  while n > 1
    n /= 2
    count += 1
  end

  count
end

### Logarithmic time (recursive) ###
def log_recur(n)
  return 0 unless n > 1
  log_recur(n / 2) + 1
end

### Linearithmic time ###
def linear_log_recur(n)
  return 1 unless n > 1

  count = linear_log_recur(n / 2) + linear_log_recur(n / 2)
  (0...n).each { count += 1 }

  count
end

### Factorial time (recursive) ###
def factorial_recur(n)
  return 1 if n == 0

  count = 0
  # Split from 1 into n
  (0...n).each { count += factorial_recur(n - 1) }

  count
end

### Driver Code ###
if __FILE__ == $0
  # You can modify n to run and observe the trend of the number of operations for various complexities
  n = 8
  puts "Input data size n = #{n}"

  count = constant(n)
  puts "Constant-time operations count = #{count}"

  count = linear(n)
  puts "Linear-time operations count = #{count}"
  count = array_traversal(Array.new(n, 0))
  puts "Linear-time (array traversal) operations count = #{count}"

  count = quadratic(n)
  puts "Quadratic-time operations count = #{count}"
  nums = Array.new(n) { |i| n - i } # [n, n-1, ..., 2, 1]
  count = bubble_sort(nums)
  puts "Quadratic-time (bubble sort) operations count = #{count}"

  count = exponential(n)
  puts "Exponential-time (iterative) operations count = #{count}"
  count = exp_recur(n)
  puts "Exponential-time (recursive) operations count = #{count}"

  count = logarithmic(n)
  puts "Logarithmic-time (iterative) operations count = #{count}"
  count = log_recur(n)
  puts "Logarithmic-time (recursive) operations count = #{count}"

  count = linear_log_recur(n)
  puts "Linearithmic-time (recursive) operations count = #{count}"

  count = factorial_recur(n)
  puts "Factorial-time (recursive) operations count = #{count}"
end
