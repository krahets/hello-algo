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

  # Insert a key-value pair
  # Insert the pair (key, value) into the hash table
  hmap[12836] = "Xiao Ha"
  hmap[15937] = "Xiao Luo"
  hmap[16750] = "Xiao Suan"
  hmap[13276] = "Xiao Fa"
  hmap[10583] = "Xiao Ya"
  puts "\nHash table after insertion:\nKey -> Value"
  print_hash_map(hmap)

  # Look up a value
  # Look up key in the hash table to get value
  name = hmap[15937]
  puts "\nName for student ID 15937: #{name}"

  # Remove a key-value pair
  # Remove the pair (key, value) from the hash table
  hmap.delete(10583)
  puts "\nHash table after removing 10583:\nKey -> Value"
  print_hash_map(hmap)

  # Iterate over the hash table
  puts "\nIterate over key-value pairs (Key->Value)"
  hmap.entries.each { |key, value| puts "#{key} -> #{value}" }

  puts "\nIterate over keys only"
  hmap.keys.each { |key| puts key }

  puts "\nIterate over values only"
  hmap.values.each { |val| puts val }
end
