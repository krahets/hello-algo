=begin
File: linear_search.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative '../utils/list_node'

### Linear search in an array ###
def linear_search_array(nums, target)
  # Traverse the array
  for i in 0...nums.length
    return i if nums[i] == target # Found the target. Return its index
  end

  -1 # Target not found. Return -1
end

### Linear search in a linked list ###
def linear_search_linkedlist(head, target)
  # Traverse the linked list
  while head
    return head if head.val == target # Found the target node. Return it

    head = head.next
  end

  nil # Target node not found. Return None
end

### Driver code ###
if __FILE__ == $0
  target = 3

  # Run linear search on the array
  nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
  index = linear_search_array(nums, target)
  puts "Index of target 3 = #{index}"

  # Run linear search on the linked list
  head = arr_to_linked_list(nums)
  node = linear_search_linkedlist(head, target)
  puts "Node object for target value 3 = #{node}"
end
