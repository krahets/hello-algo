=begin
File: hash_map.rb
Created Time: 2024-04-14
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/print_util'

### Driver Code ###
if __FILE__ == $0
  # Initialize hash table
  hmap = {}

  # Add operation
  # Add key-value pair (key, value) to the hash table
  hmap[12836] = "Xiao Ha"
  hmap[15937] = "Xiao Luo"
  hmap[16750] = "Xiao Suan"
  hmap[13276] = "Xiao Fa"
  hmap[10583] = "Xiao Ya"
  puts "\nAfter adding is complete, hash table is\nKey -> Value"
  print_hash_map(hmap)

  # Query operation
  # Input key into hash table to get value
  name = hmap[15937]
  puts "\nInput student ID 15937, found name #{name}"

  # Remove operation
  # Remove key-value pair (key, value) from hash table
  hmap.delete(10583)
  puts "\nAfter removing 10583, hash table is\nKey -> Value"
  print_hash_map(hmap)

  # Traverse hash table
  puts "\nTraverse key-value pairs Key->Value"
  hmap.entries.each { |key, value| puts "#{key} -> #{value}" }

  puts "\nTraverse keys only Key"
  hmap.keys.each { |key| puts key }

  puts "\nTraverse values only Value"
  hmap.values.each { |val| puts val }
end
