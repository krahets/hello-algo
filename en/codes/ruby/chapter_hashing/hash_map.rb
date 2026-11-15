=begin
File: hash_map.rb
Created Time: 2024-04-14
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/print_util'

### Driver code ###
if __FILE__ == $0
  # [region]{init_hash_map}
  # Initialize the hash table
  hmap = {}
  # [endregion]{init_hash_map}

  # [region]{add_pairs}
  # Insert operation
  # Insert the key-value pair (key, value) into the hash table
  hmap[12836] = "小哈"
  hmap[15937] = "小啰"
  hmap[16750] = "小算"
  hmap[13276] = "小法"
  hmap[10583] = "小鸭"
  # [endregion]{add_pairs}
  puts "\nHash table after insertion:\nKey -> Value"
  print_hash_map(hmap)

  # [region]{get_value}
  # Lookup operation
  # Look up key in the hash table to obtain value
  name = hmap[15937]
  # [endregion]{get_value}
  puts "\nLook up student ID 15937: name = #{name}"

  # [region]{remove_pair}
  # Remove operation
  # Remove the key-value pair (key, value) from the hash table
  hmap.delete(10583)
  # [endregion]{remove_pair}
  puts "\nHash table after removing 10583:\nKey -> Value"
  print_hash_map(hmap)

  puts "\nTraverse key-value pairs: Key->Value"
  # [region]{iterate_pairs}
  # Traverse the hash table
  # Traverse key-value pairs: key->value
  hmap.entries.each { |key, value| puts "#{key} -> #{value}" }
  # [endregion]{iterate_pairs}

  puts "\nTraverse keys only: Key"
  # [region]{iterate_keys}
  # Traverse keys only: key
  hmap.keys.each { |key| puts key }
  # [endregion]{iterate_keys}

  puts "\nTraverse values only: Value"
  # [region]{iterate_values}
  # Traverse values only: value
  hmap.values.each { |val| puts val }
  # [endregion]{iterate_values}
end
