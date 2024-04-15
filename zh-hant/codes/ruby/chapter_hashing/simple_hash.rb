=begin
File: simple_hash.rb
Created Time: 2024-04-14
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 加法雜湊 ###
def add_hash(key)
  hash = 0
  modulus = 1_000_000_007

  key.each_char { |c| hash += c.ord }

  hash % modulus
end

### 乘法雜湊 ###
def mul_hash(key)
  hash = 0
  modulus = 1_000_000_007

  key.each_char { |c| hash = 31 * hash + c.ord }

  hash % modulus
end

### 互斥或雜湊 ###
def xor_hash(key)
  hash = 0
  modulus = 1_000_000_007

  key.each_char { |c| hash ^= c.ord }

  hash % modulus
end

### 旋轉雜湊 ###
def rot_hash(key)
  hash = 0
  modulus = 1_000_000_007

  key.each_char { |c| hash = (hash << 4) ^ (hash >> 28) ^ c.ord }

  hash % modulus
end

### Driver Code ###
if __FILE__ == $0
  key = "Hello 演算法"

  hash = add_hash(key)
  puts "加法雜湊值為 #{hash}"

  hash = mul_hash(key)
  puts "乘法雜湊值為 #{hash}"

  hash = xor_hash(key)
  puts "互斥或雜湊值為 #{hash}"

  hash = rot_hash(key)
  puts "旋轉雜湊值為 #{hash}"
end
