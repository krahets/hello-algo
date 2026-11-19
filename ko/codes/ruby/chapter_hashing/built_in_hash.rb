=begin
File: built_in_hash.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'

### 실행 코드 ###
if __FILE__ == $0
  # [region]{builtin_hash}
  num = 3
  hash_num = num.hash
  puts "정수 #{num} → 해시값: #{hash_num}"
  # 정수 3 → 해시값: -4385856518450339636

  bol = true
  hash_bol = bol.hash
  puts "불리언 값 #{bol} → 해시값: #{hash_bol}"
  # 불리언 값 true → 해시값: -1617938112149317027

  dec = 3.14159
  hash_dec = dec.hash
  puts "소수 #{dec} → 해시값: #{hash_dec}"
  # 소수 3.14159 → 해시값: -1479186995943067893

  str = "Hello 算法"
  hash_str = str.hash
  puts "문자열 ‘#{str}’ → 해시값: #{hash_str}"
  # 문자열 ‘Hello 算法’ → 해시값: -4075943250025831763

  arr = [12836, '小哈']
  hash_arr = arr.hash
  puts "배열 #{arr} → 해시값: #{hash_arr}"
  # 배열 [12836, "小哈"] → 해시값: 1999544809202288822

  obj = ListNode.new(0)
  hash_obj = obj.hash
  puts "노드 객체 #{obj} → 해시값: #{hash_obj}"
  # 노드 객체 #<ListNode:0x000078133140ab70> → 해시값: 4302940560806366381
  # [endregion]{builtin_hash}
end
