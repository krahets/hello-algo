=begin
File: list.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 실행 코드 ###
if __FILE__ == $0
  # 리스트 초기화
  nums = [1, 3, 2, 5, 4]
  puts "리스트 nums = #{nums}"

  # 원소 접근
  num = nums[1]
  puts "인덱스 1의 원소에 접근하여 얻은 num = #{num}"

  # 원소 갱신
  nums[1] = 0
  puts "인덱스 1의 원소를 0으로 갱신한 후 nums = #{nums}"

  # 리스트 비우기
  nums.clear
  puts "리스트를 비운 후 nums = #{nums}"

  # 맨 뒤에 원소 추가
  nums << 1
  nums << 3
  nums << 2
  nums << 5
  nums << 4
  puts "원소를 추가한 후 nums = #{nums}"

  # 중간에 원소 삽입
  nums.insert(3, 6)
  puts "인덱스 3에 원소 6을 삽입한 후 nums = #{nums}"

  # 원소 삭제
  nums.delete_at(3)
  puts "인덱스 3의 원소를 삭제한 후 nums = #{nums}"

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

  # 두 리스트 연결
  nums1 = [6, 8, 7, 10, 9]
  nums += nums1
  puts "리스트 nums1을 nums 뒤에 연결한 후 nums = #{nums}"

  nums = nums.sort { |a, b| a <=> b }
  puts "리스트를 정렬한 후 nums = #{nums}"
end
