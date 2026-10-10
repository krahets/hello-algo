=begin
File: simple_hash.rb
Created Time: 2024-04-14
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Additive hash ###
def add_hash(key)
  hash = 0
  modulus = 1_000_000_007

  key.each_char { |c| hash += c.ord }

  hash % modulus
end

### Multiplicative hash ###
def mul_hash(key)
  hash = 0
  modulus = 1_000_000_007

  key.each_char { |c| hash = 31 * hash + c.ord }

  hash % modulus
end

### XOR hash ###
def xor_hash(key)
  hash = 0
  modulus = 1_000_000_007

  key.each_char { |c| hash ^= c.ord }

  hash % modulus
end

### Rotational hash ###
def rot_hash(key)
  hash = 0
  modulus = 1_000_000_007

  key.each_char { |c| hash = (hash << 4) ^ (hash >> 28) ^ c.ord }

  hash % modulus
end

### Driver Code ###
if __FILE__ == $0
  key = "Hello Algo"

  hash = add_hash(key)
  puts "Additive hash value is #{hash}"

  hash = mul_hash(key)
  puts "Multiplicative hash value is #{hash}"

  hash = xor_hash(key)
  puts "XOR hash value is #{hash}"

  hash = rot_hash(key)
  puts "Rotational hash value is #{hash}"
end
