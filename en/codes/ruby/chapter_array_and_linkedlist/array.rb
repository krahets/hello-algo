=begin
File: array.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Access an element at a random index ###
def random_access(nums)
  # Choose a random index in the interval [0, nums.length)
  random_index = Random.rand(0...nums.length)

  # Get and return the randomly selected element
  nums[random_index]
end


### Extend the array length ###
# Ruby Array is a dynamic array that can grow directly
# For learning purposes, this function treats Array as a fixed-length array
def extend(nums, enlarge)
  # Initialize an array with the extended length
  res = Array.new(nums.length + enlarge, 0)

  # Copy all elements from the original array to the new array
  for i in 0...nums.length
    res[i] = nums[i]
  end

  # Return the new, extended array
  res
end

### Insert element num at index `index` in the array ###
def insert(nums, num, index)
  # Shift all elements at and after index `index` one position to the right
  for i in (nums.length - 1).downto(index + 1)
    nums[i] = nums[i - 1]
  end

  # Assign num to the element at index `index`
  nums[index] = num
end


### Remove the element at index `index` ###
def remove(nums, index)
  # Shift all elements after index `index` one position to the left
  for i in index...(nums.length - 1)
    nums[i] = nums[i + 1]
  end
end

### Traverse the array ###
def traverse(nums)
  count = 0

  # Traverse the array by index
  for i in 0...nums.length
    count += nums[i]
  end

  # Iterate directly over the array elements
  for num in nums
    count += num
  end
end

### Find a specified element in the array ###
def find(nums, target)
  for i in 0...nums.length
    return i if nums[i] == target
  end

  -1
end


### Driver code ###
if __FILE__ == $0
  # Initialize the array
  arr = Array.new(5, 0)
  puts "Array arr = #{arr}"
  nums = [1, 3, 2, 5, 4]
  puts "Array nums = #{nums}"

  # Random access
  random_num = random_access(nums)
  puts "Random element from nums: #{random_num}"

  # Extend the length
  nums = extend(nums, 3)
  puts "After extending the array length to 8, nums = #{nums}"

  # Insert an element
  insert(nums, 6, 3)
  puts "After inserting 6 at index 3, nums = #{nums}"

  # Remove an element
  remove(nums, 2)
  puts "After removing the element at index 2, nums = #{nums}"

  # Traverse the array
  traverse(nums)

  # Find an element
  index = find(nums, 3)
  puts "Search for 3 in nums: index = #{index}"
end
