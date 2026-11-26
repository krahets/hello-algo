=begin
File: built_in_hash.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'

### Driver code ###
if __FILE__ == $0
  num = 3
  hash_num = num.hash
  puts "Integer #{num} has hash value #{hash_num}"

  bol = true
  hash_bol = bol.hash
  puts "Boolean #{bol} has hash value #{hash_bol}"

  dec = 3.14159
  hash_dec = dec.hash
  puts "Floating-point number #{dec} has hash value #{hash_dec}"

  str = "Hello 算法"
  hash_str = str.hash
  puts "String #{str} has hash value #{hash_str}"

  arr = [12836, '小哈']
  hash_arr = arr.hash
  puts "Array #{arr} has hash value #{hash_arr}"

  obj = ListNode.new(0)
  hash_obj = obj.hash
  puts "Node object #{obj} has hash value #{hash_obj}"
end
