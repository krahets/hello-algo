=begin
File: hash_map_chaining.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative './array_hash_map'

### Hash map with chaining ###
class HashMapChaining
  ### Constructor ###
  def initialize
    @size = 0 # Number of key-value pairs
    @capacity = 4 # Hash table capacity
    @load_thres = 2.0 / 3.0 # Load factor threshold for triggering expansion
    @extend_ratio = 2 # Expansion multiplier
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

  ### Query operation ###
  def get(key)
    index = hash_func(key)
    bucket = @buckets[index]
    # Traverse bucket, if key is found, return corresponding val
    for pair in bucket
      return pair.val if pair.key == key
    end
    # Return nil if key not found
    nil
  end

  ### Add operation ###
  def put(key, val)
    # When load factor exceeds threshold, perform expansion
    extend if load_factor > @load_thres
    index = hash_func(key)
    bucket = @buckets[index]
    # Traverse bucket, if specified key is encountered, update corresponding val and return
    for pair in bucket
      if pair.key == key
        pair.val = val
        return
      end
    end
    # If key does not exist, append key-value pair to the end
    pair = Pair.new(key, val)
    bucket << pair
    @size += 1
  end

  ### Delete operation ###
  def remove(key)
    index = hash_func(key)
    bucket = @buckets[index]
    # Traverse bucket and remove key-value pair from it
    for pair in bucket
      if pair.key == key
        bucket.delete(pair)
        @size -= 1
        break
      end
    end
  end

  ### Expand hash table ###
  def extend
    # Temporarily store original hash table
    buckets = @buckets
    # Initialize expanded new hash table
    @capacity *= @extend_ratio
    @buckets = Array.new(@capacity) { [] }
    @size = 0
    # Move key-value pairs from original hash table to new hash table
    for bucket in buckets
      for pair in bucket
        put(pair.key, pair.val)
      end
    end
  end

  ### Print hash table ###
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

### Driver Code ###
if __FILE__ == $0
  ### Initialize hash table
  hashmap = HashMapChaining.new

  # Add operation
  # Add key-value pair (key, value) to the hash table
  hashmap.put(12836, "Xiao Ha")
  hashmap.put(15937, "Xiao Luo")
  hashmap.put(16750, "Xiao Suan")
  hashmap.put(13276, "Xiao Fa")
  hashmap.put(10583, "Xiao Ya")
  puts "\nAfter adding, hash table is\n[Key1 -> Value1, Key2 -> Value2, ...]"
  hashmap.print

  # Query operation
  # Input key into hash table to get value
  name = hashmap.get(13276)
  puts "\nInput student ID 13276, found name #{name}"

  # Remove operation
  # Remove key-value pair (key, value) from hash table
  hashmap.remove(12836)
  puts "\nAfter deleting 12836, hash table is\n[Key1 -> Value1, Key2 -> Value2, ...]"
  hashmap.print
end
