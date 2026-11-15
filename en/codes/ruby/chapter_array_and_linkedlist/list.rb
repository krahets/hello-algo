=begin
File: list.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver code ###
if __FILE__ == $0
  # Initialize the list
  nums = [1, 3, 2, 5, 4]
  puts "List nums = #{nums}"

  # Access an element
  num = nums[1]
  puts "Access the element at index 1: num = #{num}"

  # Update an element
  nums[1] = 0
  puts "After updating the element at index 1 to 0, nums = #{nums}"

  # Clear the list
  nums.clear
  puts "After clearing the list, nums = #{nums}"

  # Append an element at the end
  nums << 1
  nums << 3
  nums << 2
  nums << 5
  nums << 4
  puts "After adding elements, nums = #{nums}"

  # Insert an element in the middle
  nums.insert(3, 6)
  puts "After inserting element 6 at index 3, nums = #{nums}"

  # Remove an element
  nums.delete_at(3)
  puts "After removing the element at index 3, nums = #{nums}"

  # Traverse the list by index
  count = 0
  for i in 0...nums.length
    count += nums[i]
  end

  # Iterate directly over the list elements
  count = 0
  nums.each do |x|
    count += x
  end

  # Concatenate two lists
  nums1 = [6, 8, 7, 10, 9]
  nums += nums1
  puts "After concatenating nums1 onto nums, nums = #{nums}"

  nums = nums.sort { |a, b| a <=> b }
  puts "After sorting the list, nums = #{nums}"
end
