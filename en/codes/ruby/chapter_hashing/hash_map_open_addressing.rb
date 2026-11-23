=begin
File: hash_map_open_addressing.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative './array_hash_map'

### Hash table with open addressing ###
class HashMapOpenAddressing
  TOMBSTONE = Pair.new(-1, '-1') # Tombstone marker

  ### Constructor ###
  def initialize
    @size = 0 # Number of key-value pairs
    @capacity = 4 # Hash table capacity
    @load_thres = 2.0 / 3.0 # Load factor threshold that triggers capacity growth
    @extend_ratio = 2 # Capacity growth factor
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

  ### Find the bucket index for key ###
  def find_bucket(key)
    index = hash_func(key)
    first_tombstone = -1
    # Probe linearly until an empty bucket is reached
    while !@buckets[index].nil?
      # If key is found, return its bucket index
      if @buckets[index].key == key
        # If a tombstone was encountered earlier, move the key-value pair to that index
        if first_tombstone != -1
          @buckets[first_tombstone] = @buckets[index]
          @buckets[index] = TOMBSTONE
          return first_tombstone # Return the bucket index after the move
        end
        return index # Return the bucket index
      end
      # Record the first tombstone encountered
      first_tombstone = index if first_tombstone == -1 && @buckets[index] == TOMBSTONE
      # Calculate the bucket index, wrapping to the beginning after the end
      index = (index + 1) % @capacity
    end
    # If key is absent, return the index for insertion
    first_tombstone == -1 ? index : first_tombstone
  end

  ### Lookup operation ###
  def get(key)
    # Find the bucket index for key
    index = find_bucket(key)
    # If the key-value pair is found, return its val
    return @buckets[index].val unless [nil, TOMBSTONE].include?(@buckets[index])
    # Return nil if the key-value pair does not exist
    nil
  end

  ### Insert operation ###
  def put(key, val)
    # Grow the capacity when the load factor exceeds the threshold
    extend if load_factor > @load_thres
    # Find the bucket index for key
    index = find_bucket(key)
    # If the key-value pair is found, overwrite val and return
    unless [nil, TOMBSTONE].include?(@buckets[index])
      @buckets[index].val = val
      return
    end
    # If the key-value pair is absent, insert it
    @buckets[index] = Pair.new(key, val)
    @size += 1
  end

  ### Remove operation ###
  def remove(key)
    # Find the bucket index for key
    index = find_bucket(key)
    # If the key-value pair is found, replace it with a tombstone
    unless [nil, TOMBSTONE].include?(@buckets[index])
      @buckets[index] = TOMBSTONE
      @size -= 1
    end
  end

  ### Grow the hash table capacity ###
  def extend
    # Keep a reference to the original hash table
    buckets_tmp = @buckets
    # Initialize a new hash table with the expanded capacity
    @capacity *= @extend_ratio
    @buckets = Array.new(@capacity)
    @size = 0
    # Move the key-value pairs from the original hash table to the new one
    for pair in buckets_tmp
      put(pair.key, pair.val) unless [nil, TOMBSTONE].include?(pair)
    end
  end

  ### Print the hash table ###
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

### Driver code ###
if __FILE__ == $0
  # Initialize the hash table
  hashmap = HashMapOpenAddressing.new

  # Insert operation
  # Insert the key-value pair (key, val) into the hash table
  hashmap.put(12836, "小哈")
  hashmap.put(15937, "小啰")
  hashmap.put(16750, "小算")
  hashmap.put(13276, "小法")
  hashmap.put(10583, "小鸭")
  puts "\nHash table after insertion:\nKey -> Value"
  hashmap.print

  # Lookup operation
  # Look up key in the hash table to obtain val
  name = hashmap.get(13276)
  puts "\nLook up student ID 13276: name = #{name}"

  # Remove operation
  # Remove the key-value pair (key, val) from the hash table
  hashmap.remove(16750)
  puts "\nHash table after removing 16750:\nKey -> Value"
  hashmap.print
end
