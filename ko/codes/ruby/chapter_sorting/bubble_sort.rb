=begin
File: bubble_sort.rb
Created Time: 2024-05-02
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 버블 정렬 ###
def bubble_sort(nums)
  n = nums.length
  # 바깥 루프: 미정렬 구간은 [0, i]
  for i in (n - 1).downto(1)
    # 안쪽 루프: 미정렬 구간 [0, i]의 최댓값을 교환을 통해 구간의 오른쪽 끝으로 이동
    for j in 0...i
      if nums[j] > nums[j + 1]
        # nums[j]와 nums[j + 1] 교환
        nums[j], nums[j + 1] = nums[j + 1], nums[j]
      end
    end
  end
end

### 플래그로 최적화한 버블 정렬###
def bubble_sort_with_flag(nums)
  n = nums.length
  # 바깥 루프: 미정렬 구간은 [0, i]
  for i in (n - 1).downto(1)
    flag = false # 플래그 초기화

    # 안쪽 루프: 미정렬 구간 [0, i]의 최댓값을 교환을 통해 구간의 오른쪽 끝으로 이동
    for j in 0...i
      if nums[j] > nums[j + 1]
        # nums[j]와 nums[j + 1] 교환
        nums[j], nums[j + 1] = nums[j + 1], nums[j]
        flag = true # 원소가 교환되었음을 기록
      end
    end

    break unless flag # 이 회전에서 교환이 한 번도 없으면 바로 종료
  end
end

### 실행 예제 ###
if __FILE__ == $0
  nums = [4, 1, 3, 1, 5, 2]
  bubble_sort(nums)
  puts "버블 정렬 후 nums = #{nums}"

  nums1 = [4, 1, 3, 1, 5, 2]
  bubble_sort_with_flag(nums1)
  puts "버블 정렬 후 nums = #{nums1}"
end
