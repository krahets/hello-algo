=begin
File: hash_map.rb
Created Time: 2024-04-14
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/print_util'

### 실행 예제 ###
if __FILE__ == $0
  # 해시 테이블 초기화
  hmap = {}

  # 추가
  # 해시 테이블에 키-값 쌍 (key, value) 추가
  hmap[12836] = "샤오하"
  hmap[15937] = "샤오뤄"
  hmap[16750] = "샤오쑤안"
  hmap[13276] = "샤오파"
  hmap[10583] = "샤오야"
  puts "\n추가 후 해시 테이블\nKey -> Value"
  print_hash_map(hmap)

  # 조회
  # 해시 테이블에 키 key를 입력하여 값 value 조회
  name = hmap[15937]
  puts "\n학번 15937로 조회한 이름: #{name}"

  # 삭제
  # 해시 테이블에서 키-값 쌍 (key, value) 삭제
  hmap.delete(10583)
  puts "\n키 10583 삭제 후 해시 테이블\nKey -> Value"
  print_hash_map(hmap)

  # 해시 테이블 순회
  puts "\n키-값 쌍 순회 Key->Value"
  hmap.entries.each { |key, value| puts "#{key} -> #{value}" }

  puts "\n키만 순회 Key"
  hmap.keys.each { |key| puts key }

  puts "\n값만 순회 Value"
  hmap.values.each { |val| puts val }
end
