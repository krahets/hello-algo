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
  puts "整數 #{num} 的雜湊值為 #{hash_num}"

  bol = true
  hash_bol = bol.hash
  puts "布林量 #{bol} 的雜湊值為 #{hash_bol}"

  dec = 3.14159
  hash_dec = dec.hash
  puts "小數 #{dec} 的雜湊值為 #{hash_dec}"

  str = "Hello 演算法"
  hash_str = str.hash
  puts "字串 #{str} 的雜湊值為 #{hash_str}"

  tup = [12836, '小哈']
  hash_tup = tup.hash
  puts "元組 #{tup} 的雜湊值為 #{hash_tup}"

  obj = ListNode.new(0)
  hash_obj = obj.hash
  puts "節點物件 #{obj} 的雜湊值為 #{hash_obj}"
end
