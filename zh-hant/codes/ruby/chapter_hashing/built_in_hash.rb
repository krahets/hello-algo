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
  puts "整數 #{num} 的雜湊值為 #{hash_num}"
  # 整數 3 的雜湊值為 -4385856518450339636

  bol = true
  hash_bol = bol.hash
  puts "布林量 #{bol} 的雜湊值為 #{hash_bol}"
  # 布林量 true 的雜湊值為 -1617938112149317027

  dec = 3.14159
  hash_dec = dec.hash
  puts "小數 #{dec} 的雜湊值為 #{hash_dec}"
  # 小數 3.14159 的雜湊值為 -1479186995943067893

  str = "Hello 演算法"
  hash_str = str.hash
  puts "字串“#{str}”的雜湊值為 #{hash_str}"
  # 字串“Hello 演算法”的雜湊值為 -4075943250025831763

  arr = [12836, '小哈']
  hash_arr = arr.hash
  puts "陣列 #{arr} 的雜湊值為 #{hash_arr}"
  # 陣列 [12836, "小哈"] 的雜湊值為 1999544809202288822

  obj = ListNode.new(0)
  hash_obj = obj.hash
  puts "節點物件 #{obj} 的雜湊值為 #{hash_obj}"
  # 節點物件 #<ListNode:0x000078133140ab70> 的雜湊值為 4302940560806366381
  # [endregion]{builtin_hash}
end
