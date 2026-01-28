=begin
File: array.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Random access element ###
def random_access(nums)
  # Randomly select a number in the interval [0, nums.length)
  random_index = Random.rand(0...nums.length)

  # Retrieve and return the random element
  nums[random_index]
end


### Extend array length ###
# Note: Ruby's Array is dynamic array, can be directly expanded
# For learning purposes, this function treats Array as fixed-length array
def extend(nums, enlarge)
  # Initialize an array with extended length
  res = Array.new(nums.length + enlarge, 0)

  # Copy all elements from the original array to the new array
  for i in 0...nums.length
    res[i] = nums[i]
  end

  # Return the extended new array
  res
end

### Insert element num at index in array ###
def insert(nums, num, index)
  # Move all elements at and after index index backward by one position
  for i in (nums.length - 1).downto(index + 1)
    nums[i] = nums[i - 1]
  end

  # Assign num to the element at index index
  nums[index] = num
end


### Delete element at index ###
def remove(nums, index)
  # Move all elements after index index forward by one position
  for i in index...(nums.length - 1)
    nums[i] = nums[i + 1]
  end
end

### Traverse array ###
def traverse(nums)
  count = 0

  # Traverse array by index
  for i in 0...nums.length
    count += nums[i]
  end

  # Direct traversal of array elements
  for num in nums
    count += num
  end
end

### Find specified element in array ###
def find(nums, target)
  for i in 0...nums.length
    return i if nums[i] == target
  end

  -1
end


### Driver Code ###
if __FILE__ == $0
  # Initialize array
  arr = Array.new(5, 0)
  puts "Array arr = #{arr}"
  nums = [1, 3, 2, 5, 4]
  puts "Array nums = #{nums}"

  # Insert element
  random_num = random_access(nums)
  puts "Get random element #{random_num} from nums"

  # Traverse array
  nums = extend(nums, 3)
  puts "Extend array length to 8, get nums = #{nums}"

  # Insert element
  insert(nums, 6, 3)
  puts "Insert number 6 at index 3, get nums = #{nums}"

  # Remove element
  remove(nums, 2)
  puts "Delete element at index 2, get nums = #{nums}"

  # Traverse array
  traverse(nums)

  # Find element
  index = find(nums, 3)
  puts "Find element 3 in nums, index = #{index}"
end
