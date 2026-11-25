=begin
File: hash_map_chaining.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative './array_hash_map'

### Hash table with chaining ###
class HashMapChaining
  ### Constructor ###
  def initialize
    @size = 0 # Number of key-value pairs
    @capacity = 4 # Hash table capacity
    @load_thres = 2.0 / 3.0 # Load factor threshold for resizing
    @extend_ratio = 2 # Growth factor
    @buckets = Array.new(@capacity) { [] } # Bucket array
  end

  ### Hash function ###
  def hash_func(key)
    key % @capacity
  end

  ### Load factor ###
  def load_factor
    @size / @capacity.to_f
  end

  ### Look up a value ###
  def get(key)
    index = hash_func(key)
    bucket = @buckets[index]
    # Scan the bucket and return the corresponding val if key is found
    for pair in bucket
      return pair.val if pair.key == key
    end
    # Return nil if key is absent
    nil
  end

  ### Insert a key-value pair ###
  def put(key, val)
    # Expand the table when the load factor exceeds the threshold
    extend if load_factor > @load_thres
    index = hash_func(key)
    bucket = @buckets[index]
    # Scan the bucket. If the specified key is found, update its val and return
    for pair in bucket
      if pair.key == key
        pair.val = val
        return
      end
    end
    # If key is absent, append the pair to the end of the list
    pair = Pair.new(key, val)
    bucket << pair
    @size += 1
  end

  ### Remove a key-value pair ###
  def remove(key)
    index = hash_func(key)
    bucket = @buckets[index]
    # Scan the bucket and remove the pair
    for pair in bucket
      if pair.key == key
        bucket.delete(pair)
        @size -= 1
        break
      end
    end
  end

  ### Expand the hash table ###
  def extend
    # Save the original hash table
    buckets = @buckets
    # Initialize the larger hash table
    @capacity *= @extend_ratio
    @buckets = Array.new(@capacity) { [] }
    @size = 0
    # Move the key-value pairs from the old table into the new one
    for bucket in buckets
      for pair in bucket
        put(pair.key, pair.val)
      end
    end
  end

  ### Print the hash table ###
  def print
    for bucket in @buckets
      res = []
      for pair in bucket
        res << "#{pair.key} -> #{pair.val}"
      end
      pp res
    end
  end
end

### Driver code ###
if __FILE__ == $0
  ### Initialize the hash table
  hashmap = HashMapChaining.new

  # Insert a key-value pair
  # Insert the pair (key, value) into the hash table
  hashmap.put(12836, "Xiao Ha")
  hashmap.put(15937, "Xiao Luo")
  hashmap.put(16750, "Xiao Suan")
  hashmap.put(13276, "Xiao Fa")
  hashmap.put(10583, "Xiao Ya")
  puts "\nHash table after insertion:\n[Key1 -> Value1, Key2 -> Value2, ...]"
  hashmap.print

  # Look up a value
  # Look up key in the hash table to get value
  name = hashmap.get(13276)
  puts "\nName for student ID 13276: #{name}"

  # Remove a key-value pair
  # Remove the pair (key, value) from the hash table
  hashmap.remove(12836)
  puts "\nHash table after removing 12836:\n[Key1 -> Value1, Key2 -> Value2, ...]"
  hashmap.print
end
