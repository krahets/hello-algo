=begin
File: selection_sort.rb
Created Time: 2024-05-03
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 선택 정렬 ###
def selection_sort(nums)
  n = nums.length
  # 바깥쪽 반복문: 정렬되지 않은 구간은 [i, n-1]이다
  for i in 0...(n - 1)
    # 안쪽 반복문: 정렬되지 않은 구간의 최솟값을 찾는다
    k = i
    for j in (i + 1)...n
      if nums[j] < nums[k]
        k = j # 최솟값의 인덱스를 기록한다
      end
    end
    # 이 최솟값과 정렬되지 않은 구간의 첫 원소를 교환한다
    nums[i], nums[k] = nums[k], nums[i]
  end
end

### 실행 코드 ###
if __FILE__ == $0
  nums = [4, 1, 3, 1, 5, 2]
  selection_sort(nums)
  puts "선택 정렬을 마친 후 nums = #{nums}"
end
