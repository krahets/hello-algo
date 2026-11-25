=begin
File: selection_sort.rb
Created Time: 2024-05-03
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 선택 정렬 ###
def selection_sort(nums)
  n = nums.length
  # 바깥 루프: 미정렬 구간은 [i, n-1]
  for i in 0...(n - 1)
    # 안쪽 루프: 미정렬 구간에서 최솟값 찾기
    k = i
    for j in (i + 1)...n
      if nums[j] < nums[k]
        k = j # 최솟값의 인덱스 기록
      end
    end
    # 최솟값과 미정렬 구간의 첫 원소 교환
    nums[i], nums[k] = nums[k], nums[i]
  end
end

### 실행 예제 ###
if __FILE__ == $0
  nums = [4, 1, 3, 1, 5, 2]
  selection_sort(nums)
  puts "선택 정렬 후 nums = #{nums}"
end
