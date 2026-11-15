=begin
File: hash_map.rb
Created Time: 2024-04-14
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/print_util'

### 실행 코드 ###
if __FILE__ == $0
  # [region]{init_hash_map}
  # 해시 테이블 초기화
  hmap = {}
  # [endregion]{init_hash_map}

  # [region]{add_pairs}
  # 추가 연산
  # 해시 테이블에 (key, value) 키-값 쌍을 추가한다
  hmap[12836] = "小哈"
  hmap[15937] = "小啰"
  hmap[16750] = "小算"
  hmap[13276] = "小法"
  hmap[10583] = "小鸭"
  # [endregion]{add_pairs}
  puts "\n추가를 마친 후의 해시 테이블\n키 -> 값"
  print_hash_map(hmap)

  # [region]{get_value}
  # 조회 연산
  # 해시 테이블에 키 key를 입력하여 값 value를 얻는다
  name = hmap[15937]
  # [endregion]{get_value}
  puts "\n학번 15937을 입력하여 조회한 이름 #{name}"

  # [region]{remove_pair}
  # 삭제 연산
  # 해시 테이블에서 (key, value) 키-값 쌍을 삭제한다
  hmap.delete(10583)
  # [endregion]{remove_pair}
  puts "\n10583을 삭제한 후의 해시 테이블\n키 -> 값"
  print_hash_map(hmap)

  puts "\n키-값 쌍(키->값) 순회"
  # [region]{iterate_pairs}
  # 해시 테이블 순회
  # 키-값 쌍 key->value를 순회한다
  hmap.entries.each { |key, value| puts "#{key} -> #{value}" }
  # [endregion]{iterate_pairs}

  puts "\n키 Key만 순회"
  # [region]{iterate_keys}
  # 키 key만 순회한다
  hmap.keys.each { |key| puts key }
  # [endregion]{iterate_keys}

  puts "\n값 Value만 순회"
  # [region]{iterate_values}
  # 값 value만 순회한다
  hmap.values.each { |val| puts val }
  # [endregion]{iterate_values}
end
