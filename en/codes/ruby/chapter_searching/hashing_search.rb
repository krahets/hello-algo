=begin
File: hashing_search.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative '../utils/list_node'

### Hash-based search (array) ###
def hashing_search_array(hmap, target)
  # Hash table key: target element; value: index
  # Return -1 if the hash table does not contain this key
  hmap[target] || -1
end

### Hash-based search (linked list) ###
def hashing_search_linkedlist(hmap, target)
  # Hash table key: target element; value: node object
  # Return nil if the hash table does not contain this key
  hmap[target] || nil
end

### Driver code ###
if __FILE__ == $0
  target = 3

  # Hash-based search (array)
  nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
  # Initialize the hash table
  map0 = {}
  for i in 0...nums.length
    map0[nums[i]] = i # key: element; value: index
  end
  index = hashing_search_array(map0, target)
  puts "Index of target element 3 = #{index}"

  # Hash-based search (linked list)
  head = arr_to_linked_list(nums)
  # Initialize the hash table
  map1 = {}
  while head
    map1[head.val] = head
    head = head.next
  end
  node = hashing_search_linkedlist(map1, target)
  puts "Node object for target value 3: #{node}"
end
