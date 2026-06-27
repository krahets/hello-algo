=begin
File: hashing_search.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative '../utils/list_node'

### Hash search (array) ###
def hashing_search_array(hmap, target)
  # Hash table's key: target element, value: index
  # If this key does not exist in the hash table, return -1
  hmap[target] || -1
end

### Hash search (linked list) ###
def hashing_search_linkedlist(hmap, target)
  # Hash table's key: target element, value: node object
  # If this key does not exist in the hash table, return None
  hmap[target] || nil
end

### Driver Code ###
if __FILE__ == $0
  target = 3

  # Hash search (array)
  nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
  # Initialize hash table
  map0 = {}
  for i in 0...nums.length
    map0[nums[i]] = i # key: element, value: index
  end
  index = hashing_search_array(map0, target)
  puts "Index of target element 3 = #{index}"

  # Hash search (linked list)
  head = arr_to_linked_list(nums)
  # Initialize hash table
  map1 = {}
  while head
    map1[head.val] = head
    head = head.next
  end
  node = hashing_search_linkedlist(map1, target)
  puts "Node object for target value 3 is #{node}"
end
