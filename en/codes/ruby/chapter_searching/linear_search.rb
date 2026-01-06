=begin
File: linear_search.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative '../utils/list_node'

### Linear search (array) ###
def linear_search_array(nums, target)
  # Traverse array
  for i in 0...nums.length
    return i if nums[i] == target # Found the target element, return its index
  end

  -1 # Target element not found, return -1
end

### Linear search (linked list) ###
def linear_search_linkedlist(head, target)
  # Traverse the linked list
  while head
    return head if head.val == target # Found the target node, return it

    head = head.next
  end

  nil # Target node not found, return None
end

### Driver Code ###
if __FILE__ == $0
  target = 3

  # Perform linear search in array
  nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
  index = linear_search_array(nums, target)
  puts "Index of target element 3 = #{index}"

  # Perform linear search in linked list
  head = arr_to_linked_list(nums)
  node = linear_search_linkedlist(head, target)
  puts "Node object for target value 3 is #{node}"
end
