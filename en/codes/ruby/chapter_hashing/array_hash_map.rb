=begin
File: array_hash_map.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Key-value pair ###
class Pair
  attr_accessor :key, :val

  def initialize(key, val)
    @key = key
    @val = val
  end
end

### Array-based hash table ###
class ArrayHashMap
  ### Constructor ###
  def initialize
    # Initialize an array with 100 buckets
    @buckets = Array.new(100)
  end

  ### Hash function ###
  def hash_func(key)
    index = key % 100
  end

  ### Look up a value ###
  def get(key)
    index = hash_func(key)
    pair = @buckets[index]

    return if pair.nil?
    pair.val
  end

  ### Insert a key-value pair ###
  def put(key, val)
    pair = Pair.new(key, val)
    index = hash_func(key)
    @buckets[index] = pair
  end

  ### Remove a key-value pair ###
  def remove(key)
    index = hash_func(key)
    # Set the slot to nil to remove the entry
    @buckets[index] = nil
  end

  ### Get all key-value pairs ###
  def entry_set
    result = []
    @buckets.each { |pair| result << pair unless pair.nil? }
    result
  end

  ### Get all keys ###
  def key_set
    result = []
    @buckets.each { |pair| result << pair.key unless pair.nil? }
    result
  end

  ### Get all values ###
  def value_set
    result = []
    @buckets.each { |pair| result << pair.val unless pair.nil? }
    result
  end

  ### Print the hash table ###
  def print
    @buckets.each { |pair| puts "#{pair.key} -> #{pair.val}" unless pair.nil? }
  end
end

### Driver code ###
if __FILE__ == $0
  # Initialize the hash table
  hmap = ArrayHashMap.new

  # Insert a key-value pair
  # Insert the pair (key, value) into the hash table
  hmap.put(12836, "Xiao Ha")
  hmap.put(15937, "Xiao Luo")
  hmap.put(16750, "Xiao Suan")
  hmap.put(13276, "Xiao Fa")
  hmap.put(10583, "Xiao Ya")
  puts "\nHash table after insertion:\nKey -> Value"
  hmap.print

  # Look up a value
  # Look up key in the hash table to get value
  name = hmap.get(15937)
  puts "\nName for student ID 15937: #{name}"

  # Remove a key-value pair
  # Remove the pair (key, value) from the hash table
  hmap.remove(10583)
  puts "\nHash table after removing 10583:\nKey -> Value"
  hmap.print

  # Iterate over the hash table
  puts "\nIterate over key-value pairs (Key->Value)"
  for pair in hmap.entry_set
    puts "#{pair.key} -> #{pair.val}"
  end

  puts "\nIterate over keys only"
  for key in hmap.key_set
    puts key
  end

  puts "\nIterate over values only"
  for val in hmap.value_set
    puts val
  end
end
