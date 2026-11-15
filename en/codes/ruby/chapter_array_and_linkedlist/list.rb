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

  # [region]{access_element}
  # Access an element
  num = nums[1] # Access the element at index 1
  # [endregion]{access_element}
  puts "Access the element at index 1: num = #{num}"

  # [region]{update_element}
  # Update an element
  nums[1] = 0 # Update the element at index 1 to 0
  # [endregion]{update_element}
  puts "After updating the element at index 1 to 0, nums = #{nums}"

  # [region]{clear_list}
  # Clear the list
  nums.clear
  # [endregion]{clear_list}
  puts "After clearing the list, nums = #{nums}"

  # [region]{append_element}
  # Append an element at the end
  nums << 1
  nums << 3
  nums << 2
  nums << 5
  nums << 4
  # [endregion]{append_element}
  puts "After adding elements, nums = #{nums}"

  # [region]{insert_element}
  # Insert an element in the middle
  nums.insert(3, 6) # Insert the number 6 at index 3
  # [endregion]{insert_element}
  puts "After inserting element 6 at index 3, nums = #{nums}"

  # [region]{remove_element}
  # Remove an element
  nums.delete_at(3) # Remove the element at index 3
  # [endregion]{remove_element}
  puts "After removing the element at index 3, nums = #{nums}"

  # [region]{iterate_list}
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
  # [endregion]{iterate_list}

  # [region]{concat_list}
  # Concatenate two lists
  nums1 = [6, 8, 7, 10, 9]
  nums += nums1
  # [endregion]{concat_list}
  puts "After concatenating nums1 onto nums, nums = #{nums}"

  # [region]{sort_list}
  # Sort the list
  nums = nums.sort { |a, b| a <=> b } # After sorting, the list elements are in ascending order
  # [endregion]{sort_list}
  puts "After sorting the list, nums = #{nums}"
end
