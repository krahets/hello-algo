=begin
File: array.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Access a random element ###
def random_access(nums)
  # Pick a random index in [0, nums.length)
  random_index = Random.rand(0...nums.length)

  # Get and return the element at that index
  nums[random_index]
end


### Extend the array ###
# A Ruby Array is dynamic and can grow directly
# For this example, treat Array as a fixed-length array
def extend(nums, enlarge)
  # Initialize an array with the new length
  res = Array.new(nums.length + enlarge, 0)

  # Copy all elements from the original array into the new array
  for i in 0...nums.length
    res[i] = nums[i]
  end

  # Return the new, longer array
  res
end

### Insert num at the specified array index ###
def insert(nums, num, index)
  # Shift the elements from index onward one position to the right
  for i in (nums.length - 1).downto(index + 1)
    nums[i] = nums[i - 1]
  end

  # Store num at the specified index
  nums[index] = num
end


### Remove the element at the specified index ###
def remove(nums, index)
  # Shift all elements after index one position to the left
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

### Find a given element in the array ###
def find(nums, target)
  for i in 0...nums.length
    return i if nums[i] == target
  end

  -1
end


### Driver Code ###
if __FILE__ == $0
  # Initialize the array
  arr = Array.new(5, 0)
  puts "Array arr = #{arr}"
  nums = [1, 3, 2, 5, 4]
  puts "Array nums = #{nums}"

  # Random access
  random_num = random_access(nums)
  puts "Random element from nums: #{random_num}"

  # Extend the array
  nums = extend(nums, 3)
  puts "After extending the array to length 8, nums = #{nums}"

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
  puts "Index of 3 in nums = #{index}"
end
