=begin
File: built_in_hash.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'

### 実行用コード ###
if __FILE__ == $0
  # [region]{builtin_hash}
  num = 3
  hash_num = num.hash
  puts "整数 #{num} のハッシュ値は #{hash_num}"
  # 整数 3 のハッシュ値は -4385856518450339636

  bol = true
  hash_bol = bol.hash
  puts "真偽値 #{bol} のハッシュ値は #{hash_bol}"
  # 真偽値 true のハッシュ値は -1617938112149317027

  dec = 3.14159
  hash_dec = dec.hash
  puts "小数 #{dec} のハッシュ値は #{hash_dec}"
  # 小数 3.14159 のハッシュ値は -1479186995943067893

  str = "Hello 算法"
  hash_str = str.hash
  puts "文字列「#{str}」のハッシュ値は #{hash_str}"
  # 文字列「Hello 算法」のハッシュ値は -4075943250025831763

  arr = [12836, '小哈']
  hash_arr = arr.hash
  puts "配列 #{arr} のハッシュ値は #{hash_arr}"
  # 配列 [12836, "小哈"] のハッシュ値は 1999544809202288822

  obj = ListNode.new(0)
  hash_obj = obj.hash
  puts "ノードオブジェクト #{obj} のハッシュ値は #{hash_obj}"
  # ノードオブジェクト #<ListNode:0x000078133140ab70> のハッシュ値は 4302940560806366381
  # [endregion]{builtin_hash}
end
