=begin
File: built_in_hash.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'

### Демонстрационный код ###
if __FILE__ == $0
  num = 3
  hash_num = num.hash
  puts "Целое число #{num} имеет хеш #{hash_num}"

  bol = true
  hash_bol = bol.hash
  puts "Логическое значение #{bol} имеет хеш #{hash_bol}"

  dec = 3.14159
  hash_dec = dec.hash
  puts "Вещественное число #{dec} имеет хеш #{hash_dec}"

  str = "Hello 算法"
  hash_str = str.hash
  puts "Строка #{str} имеет хеш #{hash_str}"

  arr = [12836, '小哈']
  hash_arr = arr.hash
  puts "Массив #{arr} имеет хеш #{hash_arr}"

  obj = ListNode.new(0)
  hash_obj = obj.hash
  puts "Объект узла #{obj} имеет хеш #{hash_obj}"
end
