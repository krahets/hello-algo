=begin
File: built_in_hash.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'

### Driver Code ###
if __FILE__ == $0
  num = 3
  hash_num = num.hash
  puts "Hash value of integer #{num} is #{hash_num}"

  bol = true
  hash_bol = bol.hash
  puts "Hash value of boolean #{bol} is #{hash_bol}"

  dec = 3.14159
  hash_dec = dec.hash
  puts "Hash value of decimal #{dec} is #{hash_dec}"

  str = "Hello Algo"
  hash_str = str.hash
  puts "Hash value of string #{str} is #{hash_str}"

  tup = [12836, 'Xiao Ha']
  hash_tup = tup.hash
  puts "Hash value of tuple #{tup} is #{hash_tup}"

  obj = ListNode.new(0)
  hash_obj = obj.hash
  puts "Hash value of object #{obj} is #{hash_obj}"
end
