=begin
File: hash_map_chaining.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative './array_hash_map'

### Hash table using chaining ###
class HashMapChaining
  ### Constructor ###
  def initialize
    @size = 0 # Number of key-value pairs
    @capacity = 4 # Hash table capacity
    @load_thres = 2.0 / 3.0 # Load factor threshold that triggers capacity growth
    @extend_ratio = 2 # Capacity growth factor
    @buckets = Array.new(@capacity) { [] } # Bucket array
  end

  ### Hash function ###
  def hash_func(key)
    key % @capacity
  end

  ### Load factor ###
  def load_factor
    @size / @capacity
  end

  ### Lookup operation ###
  def get(key)
    index = hash_func(key)
    bucket = @buckets[index]
    # Traverse the bucket; if key is found, return its corresponding val
    for pair in bucket
      return pair.val if pair.key == key
    end
    # Return nil if key is not found
    nil
  end

  ### Insert operation ###
  def put(key, val)
    # Grow the capacity when the load factor exceeds the threshold
    extend if load_factor > @load_thres
    index = hash_func(key)
    bucket = @buckets[index]
    # Traverse the bucket; if the specified key is found, update its val and return
    for pair in bucket
      if pair.key == key
        pair.val = val
        return
      end
    end
    # If key is absent, append the key-value pair at the end
    pair = Pair.new(key, val)
    bucket << pair
    @size += 1
  end

  ### Remove operation ###
  def remove(key)
    index = hash_func(key)
    bucket = @buckets[index]
    # Traverse the bucket and remove the key-value pair
    for pair in bucket
      if pair.key == key
        bucket.delete(pair)
        @size -= 1
        break
      end
    end
  end

  ### Grow the hash table capacity ###
  def extend
    # Temporarily store the original hash table
    buckets = @buckets
    # Initialize a new hash table with the expanded capacity
    @capacity *= @extend_ratio
    @buckets = Array.new(@capacity) { [] }
    @size = 0
    # Move the key-value pairs from the original hash table to the new one
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

  # Insert operation
  # Insert the key-value pair (key, value) into the hash table
  hashmap.put(12836, "小哈")
  hashmap.put(15937, "小啰")
  hashmap.put(16750, "小算")
  hashmap.put(13276, "小法")
  hashmap.put(10583, "小鸭")
  puts "\nHash table after insertion:\n[Key1 -> Value1, Key2 -> Value2, ...]"
  hashmap.print

  # Lookup operation
  # Look up key in the hash table to obtain value
  name = hashmap.get(13276)
  puts "\nLook up student ID 13276: name = #{name}"

  # Remove operation
  # Remove the key-value pair (key, value) from the hash table
  hashmap.remove(12836)
  puts "\nHash table after removing 12836:\n[Key1 -> Value1, Key2 -> Value2, ...]"
  hashmap.print
end
