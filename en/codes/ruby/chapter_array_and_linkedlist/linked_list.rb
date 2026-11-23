=begin
File: linked_list.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'
require_relative '../utils/print_util'

### Insert node _p after node n0 in the linked list ###
# In Ruby, `p` is a built-in method and `P` denotes a constant, so use `_p` instead
def insert(n0, _p)
  n1 = n0.next
  _p.next = n1
  n0.next = _p
end

### Remove the first node after node n0 in the linked list ###
def remove(n0)
  return if n0.next.nil?

  # n0 -> remove_node -> n1
  remove_node = n0.next
  n1 = remove_node.next
  n0.next = n1
end

### Access the node at index `index` in the linked list ###
def access(head, index)
  for i in 0...index
    return nil if head.nil?
    head = head.next
  end

  head
end

### Find the first node with value target in the linked list ###
def find(head, target)
  index = 0
  while head
    return index if head.val == target
    head = head.next
    index += 1
  end

  -1
end

### Driver code ###
if __FILE__ == $0
  # Initialize the linked list
  # Initialize the individual nodes
  n0 = ListNode.new(1)
  n1 = ListNode.new(3)
  n2 = ListNode.new(2)
  n3 = ListNode.new(5)
  n4 = ListNode.new(4)
  # Set up references between the nodes
  n0.next = n1
  n1.next = n2
  n2.next = n3
  n3.next = n4
  puts "The initialized linked list is"
  print_linked_list(n0)

  # Insert a node
  insert(n0, ListNode.new(0))
  print_linked_list n0

  # Remove a node
  remove(n0)
  puts "The linked list after removing a node is"
  print_linked_list(n0)

  # Access a node
  node = access(n0, 3)
  puts "Value of the node at index 3 in the linked list = #{node.val}"

  # Find a node
  index = find(n0, 2)
  puts "Index of the node with value 2 in the linked list = #{index}"
end
