=begin
File: list.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver Code ###
if __FILE__ == $0
  # Initialize list
  nums = [1, 3, 2, 5, 4]
  puts "List nums = #{nums}"

  # Update element
  num = nums[1]
  puts "Access element at index 1, get num = #{num}"

  # Add elements at the end
  nums[1] = 0
  puts "Update element at index 1 to 0, get nums = #{nums}"

  # Remove element
  nums.clear
  puts "After clearing list, nums = #{nums}"

  # Direct traversal of list elements
  nums << 1
  nums << 3
  nums << 2
  nums << 5
  nums << 4
  puts "After adding elements, nums = #{nums}"

  # Sort list
  nums.insert(3, 6)
  puts "Insert element 6 at index 3, get nums = #{nums}"

  # Remove element
  nums.delete_at(3)
  puts "Delete element at index 3, get nums = #{nums}"

  # Traverse list by index
  count = 0
  for i in 0...nums.length
    count += nums[i]
  end

  # Directly traverse list elements
  count = 0
  nums.each do |x|
    count += x
  end

  # Concatenate two lists
  nums1 = [6, 8, 7, 10, 9]
  nums += nums1
  puts "After concatenating list nums1 to nums, get nums = #{nums}"

  nums = nums.sort { |a, b| a <=> b }
  puts "After sorting list, nums = #{nums}"
end
