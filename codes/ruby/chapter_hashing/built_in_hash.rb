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
  puts "整数 #{num} 的哈希值为 #{hash_num}"

  bol = true
  hash_bol = bol.hash
  puts "布尔量 #{bol} 的哈希值为 #{hash_bol}"

  dec = 3.14159
  hash_dec = dec.hash
  puts "小数 #{dec} 的哈希值为 #{hash_dec}"

  str = "Hello 算法"
  hash_str = str.hash
  puts "字符串 #{str} 的哈希值为 #{hash_str}"

  tup = [12836, '小哈']
  hash_tup = tup.hash
  puts "元组 #{tup} 的哈希值为 #{hash_tup}"

  obj = ListNode.new(0)
  hash_obj = obj.hash
  puts "节点对象 #{obj} 的哈希值为 #{hash_obj}"
end
