=begin
File: hash_map.rb
Created Time: 2024-04-14
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/print_util'

### 실행 코드 ###
if __FILE__ == $0
  # 해시 테이블 초기화
  hmap = {}

  # 추가 연산
  # 해시 테이블에 (key, value) 키-값 쌍을 추가한다
  hmap[12836] = "小哈"
  hmap[15937] = "小啰"
  hmap[16750] = "小算"
  hmap[13276] = "小法"
  hmap[10583] = "小鸭"
  puts "\n추가를 마친 후의 해시 테이블\n키 -> 값"
  print_hash_map(hmap)

  # 조회 연산
  # 해시 테이블에 키 key를 입력하여 값 value를 얻는다
  name = hmap[15937]
  puts "\n학번 15937을 입력하여 조회한 이름 #{name}"

  # 삭제 연산
  # 해시 테이블에서 (key, value) 키-값 쌍을 삭제한다
  hmap.delete(10583)
  puts "\n10583을 삭제한 후의 해시 테이블\n키 -> 값"
  print_hash_map(hmap)

  # 해시 테이블 순회
  puts "\n키-값 쌍(키->값) 순회"
  hmap.entries.each { |key, value| puts "#{key} -> #{value}" }

  puts "\n키 Key만 순회"
  hmap.keys.each { |key| puts key }

  puts "\n값 Value만 순회"
  hmap.values.each { |val| puts val }
end
