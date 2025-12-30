=begin
File: hash_map_open_addressing.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative './array_hash_map'

### Hash map with open addressing ###
class HashMapOpenAddressing
  TOMBSTONE = Pair.new(-1, '-1') # Removal marker

  ### Constructor ###
  def initialize
    @size = 0 # Number of key-value pairs
    @capacity = 4 # Hash table capacity
    @load_thres = 2.0 / 3.0 # Load factor threshold for triggering expansion
    @extend_ratio = 2 # Expansion multiplier
    @buckets = Array.new(@capacity) # Bucket array
  end

  ### Hash function ###
  def hash_func(key)
    key % @capacity
  end

  ### Load factor ###
  def load_factor
    @size / @capacity
  end

  ### Search bucket index for key ###
  def find_bucket(key)
    index = hash_func(key)
    first_tombstone = -1
    # Linear probing, break when encountering an empty bucket
    while !@buckets[index].nil?
      # If key is encountered, return the corresponding bucket index
      if @buckets[index].key == key
        # If a removal marker was encountered before, move the key-value pair to that index
        if first_tombstone != -1
          @buckets[first_tombstone] = @buckets[index]
          @buckets[index] = TOMBSTONE
          return first_tombstone # Return the moved bucket index
        end
        return index # Return bucket index
      end
      # Record the first removal marker encountered
      first_tombstone = index if first_tombstone == -1 && @buckets[index] == TOMBSTONE
      # Calculate bucket index, wrap around to the head if past the tail
      index = (index + 1) % @capacity
    end
    # If key does not exist, return the index for insertion
    first_tombstone == -1 ? index : first_tombstone
  end

  ### Query operation ###
  def get(key)
    # Search for bucket index corresponding to key
    index = find_bucket(key)
    # If key-value pair is found, return corresponding val
    return @buckets[index].val unless [nil, TOMBSTONE].include?(@buckets[index])
    # Return nil if key-value pair does not exist
    nil
  end

  ### Add operation ###
  def put(key, val)
    # When load factor exceeds threshold, perform expansion
    extend if load_factor > @load_thres
    # Search for bucket index corresponding to key
    index = find_bucket(key)
    # If key-value pair found, overwrite val and return
    unless [nil, TOMBSTONE].include?(@buckets[index])
      @buckets[index].val = val
      return
    end
    # If key-value pair does not exist, add the key-value pair
    @buckets[index] = Pair.new(key, val)
    @size += 1
  end

  ### Delete operation ###
  def remove(key)
    # Search for bucket index corresponding to key
    index = find_bucket(key)
    # If key-value pair is found, overwrite it with removal marker
    unless [nil, TOMBSTONE].include?(@buckets[index])
      @buckets[index] = TOMBSTONE
      @size -= 1
    end
  end

  ### Expand hash table ###
  def extend
    # Temporarily store the original hash table
    buckets_tmp = @buckets
    # Initialize expanded new hash table
    @capacity *= @extend_ratio
    @buckets = Array.new(@capacity)
    @size = 0
    # Move key-value pairs from original hash table to new hash table
    for pair in buckets_tmp
      put(pair.key, pair.val) unless [nil, TOMBSTONE].include?(pair)
    end
  end

  ### Print hash table ###
  def print
    for pair in @buckets
      if pair.nil?
        puts "Nil"
      elsif pair == TOMBSTONE
        puts "TOMBSTONE"
      else
        puts "#{pair.key} -> #{pair.val}"
      end
    end
  end
end

### Driver Code ###
if __FILE__ == $0
  # Initialize hash table
  hashmap = HashMapOpenAddressing.new

  # Add operation
  # Add key-value pair (key, val) to the hash table
  hashmap.put(12836, "Xiao Ha")
  hashmap.put(15937, "Xiao Luo")
  hashmap.put(16750, "Xiao Suan")
  hashmap.put(13276, "Xiao Fa")
  hashmap.put(10583, "Xiao Ya")
  puts "\nAfter adding is complete, hash table is\nKey -> Value"
  hashmap.print

  # Query operation
  # Input key into hash table to get value val
  name = hashmap.get(13276)
  puts "\nInput student ID 13276, found name #{name}"

  # Remove operation
  # Remove key-value pair (key, val) from hash table
  hashmap.remove(16750)
  puts "\nAfter removing 16750, hash table is\nKey -> Value"
  hashmap.print
end
