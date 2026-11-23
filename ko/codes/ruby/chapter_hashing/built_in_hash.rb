=begin
File: built_in_hash.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'

### 실행 코드 ###
if __FILE__ == $0
  num = 3
  hash_num = num.hash
  puts "정수 #{num} → 해시값: #{hash_num}"

  bol = true
  hash_bol = bol.hash
  puts "불리언 값 #{bol} → 해시값: #{hash_bol}"

  dec = 3.14159
  hash_dec = dec.hash
  puts "소수 #{dec} → 해시값: #{hash_dec}"

  str = "Hello 算法"
  hash_str = str.hash
  puts "문자열 #{str}의 해시값: #{hash_str}"

  arr = [12836, '小哈']
  hash_arr = arr.hash
  puts "배열 #{arr} → 해시값: #{hash_arr}"

  obj = ListNode.new(0)
  hash_obj = obj.hash
  puts "노드 객체 #{obj} → 해시값: #{hash_obj}"
end
