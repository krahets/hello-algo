=begin
File: built_in_hash.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'

### Driver Code ###
if __FILE__ == $0
  # [region]{builtin_hash}
  num = 3
  hash_num = num.hash
  puts "Хеш-значение целого числа #{num} = #{hash_num}"
  # Хеш-значение целого числа 3 = -4385856518450339636

  bol = true
  hash_bol = bol.hash
  puts "Хеш-значение булева значения #{bol} = #{hash_bol}"
  # Хеш-значение булева значения true = -1617938112149317027

  dec = 3.14159
  hash_dec = dec.hash
  puts "Хеш-значение десятичного числа #{dec} = #{hash_dec}"
  # Хеш-значение десятичного числа 3.14159 = -1479186995943067893

  str = "Hello Algo"
  hash_str = str.hash
  puts "Хеш-значение строки «#{str}» = #{hash_str}"
  # Хеш-значение строки «Hello Algo» = -4075943250025831763

  arr = [12836, 'Сяо Ха']
  hash_arr = arr.hash
  puts "Хеш-значение массива #{arr} = #{hash_arr}"
  # Хеш-значение массива [12836, "Сяо Ха"] = 1999544809202288822

  obj = ListNode.new(0)
  hash_obj = obj.hash
  puts "Хеш-значение объекта узла #{obj} = #{hash_obj}"
  # Хеш-значение объекта узла #<ListNode:0x000078133140ab70> = 4302940560806366381
  # [endregion]{builtin_hash}
end
