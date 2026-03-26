=begin
File: built_in_hash.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'

### Driver Code ###
if __FILE__ == $0
  num = 3
  hash_num = num.hash
  puts "Хеш-значение целого числа #{num} равно #{hash_num}"

  bol = true
  hash_bol = bol.hash
  puts "Хеш-значение логического значения #{bol} равно #{hash_bol}"

  dec = 3.14159
  hash_dec = dec.hash
  puts "Хеш-значение десятичного числа #{dec} равно #{hash_dec}"

  str = "Hello Algo"
  hash_str = str.hash
  puts "Хеш-значение строки #{str} равно #{hash_str}"

  tup = [12836, 'Сяо Ха']
  hash_tup = tup.hash
  puts "Хеш-значение кортежа #{tup} равно #{hash_tup}"

  obj = ListNode.new(0)
  hash_obj = obj.hash
  puts "объект узла #{obj} равно #{hash_obj}"
end
