=begin
File: built_in_hash.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'

### Driver code ###
if __FILE__ == $0
  # [region]{builtin_hash}
  num = 3
  hash_num = num.hash
  puts "Integer #{num} has hash value #{hash_num}"
  # Integer 3 has hash value -4385856518450339636

  bol = true
  hash_bol = bol.hash
  puts "Boolean #{bol} has hash value #{hash_bol}"
  # Boolean true has hash value -1617938112149317027

  dec = 3.14159
  hash_dec = dec.hash
  puts "Floating-point number #{dec} has hash value #{hash_dec}"
  # Floating-point number 3.14159 has hash value -1479186995943067893

  str = "Hello 算法"
  hash_str = str.hash
  puts "String '#{str}' has hash value #{hash_str}"
  # String 'Hello 算法' has hash value -4075943250025831763

  arr = [12836, '小哈']
  hash_arr = arr.hash
  puts "Array #{arr} has hash value #{hash_arr}"
  # Array [12836, "小哈"] has hash value 1999544809202288822

  obj = ListNode.new(0)
  hash_obj = obj.hash
  puts "Node object #{obj} has hash value #{hash_obj}"
  # Node object #<ListNode:0x000078133140ab70> has hash value 4302940560806366381
  # [endregion]{builtin_hash}
end
