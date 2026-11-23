=begin
File: time_complexity.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Constant complexity ###
def constant(n)
  count = 0
  size = 100000

  (0...size).each { count += 1 }

  count
end

### Linear complexity ###
def linear(n)
  count = 0
  (0...n).each { count += 1 }
  count
end

### Linear complexity (array traversal)###
def array_traversal(nums)
  count = 0

  # The number of iterations is proportional to the array length
  for num in nums
    count += 1
  end

  count
end

### Quadratic complexity ###
def quadratic(n)
  count = 0

  # The number of iterations is proportional to the square of the input size n
  for i in 0...n
    for j in 0...n
      count += 1
    end
  end

  count
end

### Quadratic complexity (bubble sort)###
def bubble_sort(nums)
  count = 0  # Counter

  # Outer loop: the unsorted range is [0, i]
  for i in (nums.length - 1).downto(0)
    # Inner loop: move the largest element in the unsorted range [0, i] to its right end through swaps
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

### Exponential complexity (iterative implementation)###
def exponential(n)
  count, base = 0, 1

  # Each cell divides into two per round, giving the sequence 1, 2, 4, 8, ..., 2^(n-1)
  (0...n).each do
    (0...base).each { count += 1 }
    base *= 2
  end

  # count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
  count
end

### Exponential complexity (recursive implementation)###
def exp_recur(n)
  return 1 if n == 1
  exp_recur(n - 1) + exp_recur(n - 1) + 1
end

### Logarithmic complexity (iterative implementation)###
def logarithmic(n)
  count = 0

  while n > 1
    n /= 2
    count += 1
  end

  count
end

### Logarithmic complexity (recursive implementation)###
def log_recur(n)
  return 0 unless n > 1
  log_recur(n / 2) + 1
end

### Linearithmic complexity ###
def linear_log_recur(n)
  return 1 unless n > 1

  count = linear_log_recur(n / 2) + linear_log_recur(n / 2)
  (0...n).each { count += 1 }

  count
end

### Factorial complexity (recursive implementation)###
def factorial_recur(n)
  return 1 if n == 0

  count = 0
  # Split one problem into n subproblems
  (0...n).each { count += factorial_recur(n - 1) }

  count
end

### Driver code ###
if __FILE__ == $0
  # Try different values of n to see how the operation count grows for each complexity
  n = 8
  puts "Input size n = #{n}"

  count = constant(n)
  puts "Operation count for constant time = #{count}"

  count = linear(n)
  puts "Operation count for linear time = #{count}"
  count = array_traversal(Array.new(n, 0))
  puts "Operation count for linear time (array traversal) = #{count}"

  count = quadratic(n)
  puts "Operation count for quadratic time = #{count}"
  nums = Array.new(n) { |i| n - i } # [n, n-1, ..., 2, 1]
  count = bubble_sort(nums)
  puts "Operation count for quadratic time (bubble sort) = #{count}"

  count = exponential(n)
  puts "Operation count for exponential time (iteration) = #{count}"
  count = exp_recur(n)
  puts "Operation count for exponential time (recursion) = #{count}"

  count = logarithmic(n)
  puts "Operation count for logarithmic time (iteration) = #{count}"
  count = log_recur(n)
  puts "Operation count for logarithmic time (recursion) = #{count}"

  count = linear_log_recur(n)
  puts "Operation count for linearithmic time (recursion) = #{count}"

  count = factorial_recur(n)
  puts "Operation count for factorial time (recursion) = #{count}"
end
