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

### Linear time (array traversal)###
def array_traversal(nums)
  count = 0

  # The iteration count is proportional to the array length
  for num in nums
    count += 1
  end

  count
end

### Quadratic time ###
def quadratic(n)
  count = 0

  # The iteration count grows quadratically with input size n
  for i in 0...n
    for j in 0...n
      count += 1
    end
  end

  count
end

### Quadratic time (bubble sort)###
def bubble_sort(nums)
  count = 0  # Counter

  # Outer loop: the unsorted range is the closed interval [0, i]
  for i in (nums.length - 1).downto(0)
    # Inner loop: swap adjacent elements to move the largest in [0, i] to index i
    for j in 0...i
      if nums[j] > nums[j + 1]
        # Swap nums[j] and nums[j + 1]
        tmp = nums[j]
        nums[j] = nums[j + 1]
        nums[j + 1] = tmp
        count += 3 # Swapping two elements takes 3 elementary operations
      end
    end
  end

  count
end

### Exponential time (iterative)###
def exponential(n)
  count, base = 0, 1

  # Each cell divides in two per round, giving 1, 2, 4, 8, ..., 2^(n-1)
  (0...n).each do
    (0...base).each { count += 1 }
    base *= 2
  end

  # count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
  count
end

### Exponential time (recursive)###
def exp_recur(n)
  return 1 if n == 1
  exp_recur(n - 1) + exp_recur(n - 1) + 1
end

### Logarithmic time (iterative)###
def logarithmic(n)
  count = 0

  while n > 1
    n /= 2
    count += 1
  end

  count
end

### Logarithmic time (recursive)###
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

### Factorial time (recursive)###
def factorial_recur(n)
  return 1 if n == 0

  count = 0
  # Split one problem into n subproblems
  (0...n).each { count += factorial_recur(n - 1) }

  count
end

### Driver Code ###
if __FILE__ == $0
  # Try different values of n to see how the operation count grows for each complexity
  n = 8
  puts "Input size n = #{n}"

  count = constant(n)
  puts "Constant operation count = #{count}"

  count = linear(n)
  puts "Linear operation count = #{count}"
  count = array_traversal(Array.new(n, 0))
  puts "Linear operation count (array traversal) = #{count}"

  count = quadratic(n)
  puts "Quadratic operation count = #{count}"
  nums = Array.new(n) { |i| n - i } # [n, n-1, ..., 2, 1]
  count = bubble_sort(nums)
  puts "Quadratic operation count (bubble sort) = #{count}"

  count = exponential(n)
  puts "Exponential operation count (iterative) = #{count}"
  count = exp_recur(n)
  puts "Exponential operation count (recursive) = #{count}"

  count = logarithmic(n)
  puts "Logarithmic operation count (iterative) = #{count}"
  count = log_recur(n)
  puts "Logarithmic operation count (recursive) = #{count}"

  count = linear_log_recur(n)
  puts "Linearithmic operation count (recursive) = #{count}"

  count = factorial_recur(n)
  puts "Factorial operation count (recursive) = #{count}"
end
