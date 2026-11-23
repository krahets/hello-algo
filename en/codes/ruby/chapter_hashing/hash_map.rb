=begin
File: hash_map.rb
Created Time: 2024-04-14
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/print_util'

### Driver code ###
if __FILE__ == $0
  # Initialize the hash table
  hmap = {}

  # Insert operation
  # Insert the key-value pair (key, value) into the hash table
  hmap[12836] = "小哈"
  hmap[15937] = "小啰"
  hmap[16750] = "小算"
  hmap[13276] = "小法"
  hmap[10583] = "小鸭"
  puts "\nHash table after insertion:\nKey -> Value"
  print_hash_map(hmap)

  # Lookup operation
  # Look up key in the hash table to obtain value
  name = hmap[15937]
  puts "\nLook up student ID 15937: name = #{name}"

  # Remove operation
  # Remove the key-value pair (key, value) from the hash table
  hmap.delete(10583)
  puts "\nHash table after removing 10583:\nKey -> Value"
  print_hash_map(hmap)

  # Traverse the hash table
  puts "\nTraverse key-value pairs: Key->Value"
  hmap.entries.each { |key, value| puts "#{key} -> #{value}" }

  puts "\nTraverse keys only: Key"
  hmap.keys.each { |key| puts key }

  puts "\nTraverse values only: Value"
  hmap.values.each { |val| puts val }
end
