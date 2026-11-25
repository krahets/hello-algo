=begin
File: simple_hash.rb
Created Time: 2024-04-14
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Аддитивное хеширование ###
def add_hash(key)
  hash = 0
  modulus = 1_000_000_007

  key.each_char { |c| hash += c.ord }

  hash % modulus
end

### Мультипликативное хеширование ###
def mul_hash(key)
  hash = 0
  modulus = 1_000_000_007

  key.each_char { |c| hash = 31 * hash + c.ord }

  hash % modulus
end

### Хеширование с помощью XOR ###
def xor_hash(key)
  hash = 0
  modulus = 1_000_000_007

  key.each_char { |c| hash ^= c.ord }

  hash % modulus
end

### Хеширование с циклическим сдвигом ###
def rot_hash(key)
  hash = 0
  modulus = 1_000_000_007

  key.each_char { |c| hash = (hash << 4) ^ (hash >> 28) ^ c.ord }

  hash % modulus
end

### Демонстрационный код ###
if __FILE__ == $0
  key = "Hello 算法"

  hash = add_hash(key)
  puts "Аддитивный хеш: #{hash}"

  hash = mul_hash(key)
  puts "Мультипликативный хеш: #{hash}"

  hash = xor_hash(key)
  puts "Хеш на основе XOR: #{hash}"

  hash = rot_hash(key)
  puts "Хеш с циклическим сдвигом: #{hash}"
end
