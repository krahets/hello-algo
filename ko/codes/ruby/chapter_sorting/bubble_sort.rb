=begin
File: bubble_sort.rb
Created Time: 2024-05-02
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 버블 정렬 ###
def bubble_sort(nums)
  n = nums.length
  # 바깥쪽 반복문: 정렬되지 않은 구간은 [0, i]이다
  for i in (n - 1).downto(1)
    # 안쪽 반복문: 정렬되지 않은 구간 [0, i]의 최댓값을 교환하여 이 구간의 맨 오른쪽으로 옮긴다
    for j in 0...i
      if nums[j] > nums[j + 1]
        # nums[j]와 nums[j + 1]을 교환한다
        nums[j], nums[j + 1] = nums[j + 1], nums[j]
      end
    end
  end
end

### 버블 정렬(플래그 최적화)###
def bubble_sort_with_flag(nums)
  n = nums.length
  # 바깥쪽 반복문: 정렬되지 않은 구간은 [0, i]이다
  for i in (n - 1).downto(1)
    flag = false # 플래그를 초기화한다

    # 안쪽 반복문: 정렬되지 않은 구간 [0, i]의 최댓값을 교환하여 이 구간의 맨 오른쪽으로 옮긴다
    for j in 0...i
      if nums[j] > nums[j + 1]
        # nums[j]와 nums[j + 1]을 교환한다
        nums[j], nums[j + 1] = nums[j + 1], nums[j]
        flag = true # 원소가 교환되었음을 기록한다
      end
    end

    break unless flag # 이번 버블 과정에서 원소 교환이 없었으므로 바로 종료한다
  end
end

### 실행 코드 ###
if __FILE__ == $0
  nums = [4, 1, 3, 1, 5, 2]
  bubble_sort(nums)
  puts "버블 정렬을 마친 후 nums = #{nums}"

  nums1 = [4, 1, 3, 1, 5, 2]
  bubble_sort_with_flag(nums1)
  puts "버블 정렬을 마친 후 nums = #{nums1}"
end
