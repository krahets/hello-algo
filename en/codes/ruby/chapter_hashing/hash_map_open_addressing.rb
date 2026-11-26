=begin
File: hash_map_open_addressing.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative './array_hash_map'

### Hash table with open addressing ###
class HashMapOpenAddressing
  TOMBSTONE = Pair.new(-1, '-1') # Deletion marker

  ### Constructor ###
  def initialize
    @size = 0 # Number of key-value pairs
    @capacity = 4 # Hash table capacity
    @load_thres = 2.0 / 3.0 # Load factor threshold for resizing
    @extend_ratio = 2 # Growth factor
    @buckets = Array.new(@capacity) # Bucket array
  end

  ### Hash function ###
  def hash_func(key)
    key % @capacity
  end

  ### Load factor ###
  def load_factor
    @size / @capacity.to_f
  end

  ### Find the bucket index for key ###
  def find_bucket(key)
    index = hash_func(key)
    first_tombstone = -1
    # Probe linearly until an empty bucket is reached
    while !@buckets[index].nil?
      # If key is found, return its bucket index
      if @buckets[index].key == key
        # If a deletion marker was found earlier, move the pair to that index
        if first_tombstone != -1
          @buckets[first_tombstone] = @buckets[index]
          @buckets[index] = TOMBSTONE
          return first_tombstone # Return the new bucket index
        end
        return index # Return the bucket index
      end
      # Record the first deletion marker encountered
      first_tombstone = index if first_tombstone == -1 && @buckets[index] == TOMBSTONE
      # Compute the next bucket index, wrapping to the start at the end
      index = (index + 1) % @capacity
    end
    # If key is absent, return the index for insertion
    first_tombstone == -1 ? index : first_tombstone
  end

  ### Look up a value ###
  def get(key)
    # Find the bucket index for key
    index = find_bucket(key)
    # If the pair is found, return its val
    return @buckets[index].val unless [nil, TOMBSTONE].include?(@buckets[index])
    # Return nil if the pair is absent
    nil
  end

  ### Insert a key-value pair ###
  def put(key, val)
    # Expand the table when the load factor exceeds the threshold
    extend if load_factor > @load_thres
    # Find the bucket index for key
    index = find_bucket(key)
    # If the pair is found, overwrite val and return
    unless [nil, TOMBSTONE].include?(@buckets[index])
      @buckets[index].val = val
      return
    end
    # If the pair is absent, insert it
    @buckets[index] = Pair.new(key, val)
    @size += 1
  end

  ### Remove a key-value pair ###
  def remove(key)
    # Find the bucket index for key
    index = find_bucket(key)
    # If the pair is found, replace it with a deletion marker
    unless [nil, TOMBSTONE].include?(@buckets[index])
      @buckets[index] = TOMBSTONE
      @size -= 1
    end
  end

  ### Expand the hash table ###
  def extend
    # Save the original hash table
    buckets_tmp = @buckets
    # Initialize the larger hash table
    @capacity *= @extend_ratio
    @buckets = Array.new(@capacity)
    @size = 0
    # Move the key-value pairs from the old table into the new one
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

  # Insert a key-value pair
  # Insert the pair (key, val) into the hash table
  hashmap.put(12836, "Xiao Ha")
  hashmap.put(15937, "Xiao Luo")
  hashmap.put(16750, "Xiao Suan")
  hashmap.put(13276, "Xiao Fa")
  hashmap.put(10583, "Xiao Ya")
  puts "\nHash table after insertion:\nKey -> Value"
  hashmap.print

  # Look up a value
  # Look up key in the hash table to get val
  name = hashmap.get(13276)
  puts "\nName for student ID 13276: #{name}"

  # Remove a key-value pair
  # Remove the pair (key, val) from the hash table
  hashmap.remove(16750)
  puts "\nHash table after removing 16750:\nKey -> Value"
  hashmap.print
end
