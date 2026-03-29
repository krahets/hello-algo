=begin
File: simple_hash.rb
Created Time: 2024-04-14
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 加算ハッシュ ###
def add_hash(key)
  hash = 0
  modulus = 1_000_000_007

  key.each_char { |c| hash += c.ord }

  hash % modulus
end

### 乗算ハッシュ ###
def mul_hash(key)
  hash = 0
  modulus = 1_000_000_007

  key.each_char { |c| hash = 31 * hash + c.ord }

  hash % modulus
end

### XOR ハッシュ ###
def xor_hash(key)
  hash = 0
  modulus = 1_000_000_007

  key.each_char { |c| hash ^= c.ord }

  hash % modulus
end

### 回転ハッシュ ###
def rot_hash(key)
  hash = 0
  modulus = 1_000_000_007

  key.each_char { |c| hash = (hash << 4) ^ (hash >> 28) ^ c.ord }

  hash % modulus
end

### Driver Code ###
if __FILE__ == $0
  key = "Hello アルゴリズム"

  hash = add_hash(key)
  puts "加算ハッシュ値は #{hash}"

  hash = mul_hash(key)
  puts "乗算ハッシュ値は #{hash}"

  hash = xor_hash(key)
  puts "XORハッシュ値は #{hash}"

  hash = rot_hash(key)
  puts "ローテーションハッシュ値は #{hash}"
end
