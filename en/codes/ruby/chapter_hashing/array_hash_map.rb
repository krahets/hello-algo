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

### Hash table implemented with an array ###
class ArrayHashMap
  ### Constructor ###
  def initialize
    # Initialize an array containing 100 buckets
    @buckets = Array.new(100)
  end

  ### Hash function ###
  def hash_func(key)
    index = key % 100
  end

  ### Lookup operation ###
  def get(key)
    index = hash_func(key)
    pair = @buckets[index]

    return if pair.nil?
    pair.val
  end

  ### Insert operation ###
  def put(key, val)
    pair = Pair.new(key, val)
    index = hash_func(key)
    @buckets[index] = pair
  end

  ### Remove operation ###
  def remove(key)
    index = hash_func(key)
    # Set the bucket to nil to indicate removal
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

  # Insert operation
  # Insert the key-value pair (key, value) into the hash table
  hmap.put(12836, "小哈")
  hmap.put(15937, "小啰")
  hmap.put(16750, "小算")
  hmap.put(13276, "小法")
  hmap.put(10583, "小鸭")
  puts "\nHash table after insertion:\nKey -> Value"
  hmap.print

  # Lookup operation
  # Look up key in the hash table to obtain value
  name = hmap.get(15937)
  puts "\nLook up student ID 15937: name = #{name}"

  # Remove operation
  # Remove the key-value pair (key, value) from the hash table
  hmap.remove(10583)
  puts "\nHash table after removing 10583:\nKey -> Value"
  hmap.print

  # Traverse the hash table
  puts "\nTraverse key-value pairs: Key->Value"
  for pair in hmap.entry_set
    puts "#{pair.key} -> #{pair.val}"
  end

  puts "\nTraverse the keys only"
  for key in hmap.key_set
    puts key
  end

  puts "\nTraverse values only: Value"
  for val in hmap.value_set
    puts val
  end
end
