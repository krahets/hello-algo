=begin
File: built_in_hash.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'

### 実行用コード ###
if __FILE__ == $0
  num = 3
  hash_num = num.hash
  puts "整数 #{num} のハッシュ値は #{hash_num}"

  bol = true
  hash_bol = bol.hash
  puts "真偽値 #{bol} のハッシュ値は #{hash_bol}"

  dec = 3.14159
  hash_dec = dec.hash
  puts "小数 #{dec} のハッシュ値は #{hash_dec}"

  str = "Hello 算法"
  hash_str = str.hash
  puts "文字列 #{str} のハッシュ値は #{hash_str}"

  tup = [12836, '小哈']
  hash_tup = tup.hash
  puts "タプル #{tup} のハッシュ値は #{hash_tup}"

  obj = ListNode.new(0)
  hash_obj = obj.hash
  puts "ノードオブジェクト #{obj} のハッシュ値は #{hash_obj}"
end
