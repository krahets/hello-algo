=begin
File: linear_search.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative '../utils/list_node'

### Linear search (array) ###
def linear_search_array(nums, target)
  # Traverse the array
  for i in 0...nums.length
    return i if nums[i] == target # The target element was found; return its index
  end

  -1 # The target element was not found; return -1
end

### Linear search (linked list) ###
def linear_search_linkedlist(head, target)
  # Traverse the linked list
  while head
    return head if head.val == target # The target node was found; return it

    head = head.next
  end

  nil # The target node was not found; return nil
end

### Driver code ###
if __FILE__ == $0
  target = 3

  # Perform linear search on the array
  nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
  index = linear_search_array(nums, target)
  puts "Index of target element 3 = #{index}"

  # Perform linear search on the linked list
  head = arr_to_linked_list(nums)
  node = linear_search_linkedlist(head, target)
  puts "Node object for target value 3: #{node}"
end
