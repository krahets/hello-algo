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
  puts "Hash value of integer #{num}: #{hash_num}"

  bol = true
  hash_bol = bol.hash
  puts "Hash value of Boolean #{bol}: #{hash_bol}"

  dec = 3.14159
  hash_dec = dec.hash
  puts "Hash value of floating-point number #{dec}: #{hash_dec}"

  str = "Hello 算法"
  hash_str = str.hash
  puts "Hash value of string #{str}: #{hash_str}"

  tup = [12836, '小哈']
  hash_tup = tup.hash
  puts "Hash value of array #{tup}: #{hash_tup}"

  obj = ListNode.new(0)
  hash_obj = obj.hash
  puts "Hash value of node object #{obj}: #{hash_obj}"
end
