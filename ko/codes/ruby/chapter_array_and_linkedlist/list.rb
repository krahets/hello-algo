=begin
File: list.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 실행 코드 ###
if __FILE__ == $0
  # [region]{init_list}
  # 리스트 초기화
  # 초깃값 없음
  empty_nums = []
  # 초깃값 있음
  nums = [1, 3, 2, 5, 4]
  # [endregion]{init_list}
  puts "리스트 nums = #{nums}"
  puts "리스트 empty_nums = #{empty_nums}"

  # [region]{access_element}
  # 원소 접근
  num = nums[1] # 인덱스 1의 원소에 접근한다
  # [endregion]{access_element}
  puts "인덱스 1의 원소에 접근하여 얻은 num = #{num}"

  # [region]{update_element}
  # 원소 갱신
  nums[1] = 0 # 인덱스 1의 원소를 0으로 갱신한다
  # [endregion]{update_element}
  puts "인덱스 1의 원소를 0으로 갱신한 후 nums = #{nums}"

  # [region]{clear_list}
  # 리스트 비우기
  nums.clear
  # [endregion]{clear_list}
  puts "리스트를 비운 후 nums = #{nums}"

  # [region]{append_element}
  # 맨 뒤에 원소 추가
  nums << 1
  nums << 3
  nums << 2
  nums << 5
  nums << 4
  # [endregion]{append_element}
  puts "원소를 추가한 후 nums = #{nums}"

  # [region]{insert_element}
  # 중간에 원소 삽입
  nums.insert(3, 6) # 인덱스 3에 숫자 6을 삽입한다
  # [endregion]{insert_element}
  puts "인덱스 3에 원소 6을 삽입한 후 nums = #{nums}"

  # [region]{remove_element}
  # 원소 삭제
  nums.delete_at(3) # 인덱스 3의 원소를 삭제한다
  # [endregion]{remove_element}
  puts "인덱스 3의 원소를 삭제한 후 nums = #{nums}"

  # [region]{iterate_list}
  # 인덱스를 통해 리스트를 순회한다
  count = 0
  for i in 0...nums.length
    count += nums[i]
  end

  # 리스트의 원소를 직접 순회한다
  count = 0
  nums.each do |x|
    count += x
  end
  # [endregion]{iterate_list}

  # [region]{concat_list}
  # 두 리스트 연결
  nums1 = [6, 8, 7, 10, 9]
  nums += nums1
  # [endregion]{concat_list}
  puts "리스트 nums1을 nums 뒤에 연결한 후 nums = #{nums}"

  # [region]{sort_list}
  # 리스트 정렬
  nums = nums.sort { |a, b| a <=> b } # 정렬 후 리스트 원소는 작은 값부터 큰 값 순서로 나열된다
  # [endregion]{sort_list}
  puts "리스트를 정렬한 후 nums = #{nums}"
end
