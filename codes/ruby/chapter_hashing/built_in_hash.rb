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
  puts "整数 #{num} 的哈希值为 #{hash_num}"
  # 整数 3 的哈希值为 -4385856518450339636

  bol = true
  hash_bol = bol.hash
  puts "布尔量 #{bol} 的哈希值为 #{hash_bol}"
  # 布尔量 true 的哈希值为 -1617938112149317027

  dec = 3.14159
  hash_dec = dec.hash
  puts "小数 #{dec} 的哈希值为 #{hash_dec}"
  # 小数 3.14159 的哈希值为 -1479186995943067893

  str = "Hello 算法"
  hash_str = str.hash
  puts "字符串“#{str}”的哈希值为 #{hash_str}"
  # 字符串“Hello 算法”的哈希值为 -4075943250025831763

  arr = [12836, '小哈']
  hash_arr = arr.hash
  puts "数组 #{arr} 的哈希值为 #{hash_arr}"
  # 数组 [12836, "小哈"] 的哈希值为 1999544809202288822

  obj = ListNode.new(0)
  hash_obj = obj.hash
  puts "节点对象 #{obj} 的哈希值为 #{hash_obj}"
  # 节点对象 #<ListNode:0x000078133140ab70> 的哈希值为 4302940560806366381
  # [endregion]{builtin_hash}
end
