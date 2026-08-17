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

### Hash map based on array ###
class ArrayHashMap
  ### Constructor ###
  def initialize
    # Initialize array with 100 buckets
    @buckets = Array.new(100)
  end

  ### Hash function ###
  def hash_func(key)
    index = key % 100
  end

  ### Query operation ###
  def get(key)
    index = hash_func(key)
    pair = @buckets[index]

    return if pair.nil?
    pair.val
  end

  ### Add operation ###
  def put(key, val)
    pair = Pair.new(key, val)
    index = hash_func(key)
    @buckets[index] = pair
  end

  ### Delete operation ###
  def remove(key)
    index = hash_func(key)
    # Set to nil to delete
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

  ### Print hash table ###
  def print
    @buckets.each { |pair| puts "#{pair.key} -> #{pair.val}" unless pair.nil? }
  end
end

### Driver Code ###
if __FILE__ == $0
  # Initialize hash table
  hmap = ArrayHashMap.new

  # Add operation
  # Add key-value pair (key, value) to the hash table
  hmap.put(12836, "Xiao Ha")
  hmap.put(15937, "Xiao Luo")
  hmap.put(16750, "Xiao Suan")
  hmap.put(13276, "Xiao Fa")
  hmap.put(10583, "Xiao Ya")
  puts "\nAfter adding is complete, hash table is\nKey -> Value"
  hmap.print

  # Query operation
  # Input key to hash table, get value
  name = hmap.get(15937)
  puts "\nInput student ID 15937, found name #{name}"

  # Remove operation
  # Delete key-value pair (key, value) from hash table
  hmap.remove(10583)
  puts "\nAfter removing 10583, hash table is\nKey -> Value"
  hmap.print

  # Traverse hash table
  puts "\nTraverse key-value pairs Key->Value"
  for pair in hmap.entry_set
    puts "#{pair.key} -> #{pair.val}"
  end

  puts "\nTraverse keys separately"
  for key in hmap.key_set
    puts key
  end

  puts "\nTraverse values only Value"
  for val in hmap.value_set
    puts val
  end
end
