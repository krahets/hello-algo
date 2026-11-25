=begin
File: merge_sort.rb
Created Time: 2024-04-10
Author: junminhong (junminhong1110@gmail.com)
=end

### 왼쪽 부분 배열과 오른쪽 부분 배열 병합 ###
def merge(nums, left, mid, right)
  # 왼쪽 부분 배열의 구간은 [left, mid], 오른쪽 부분 배열의 구간은 [mid+1, right]
  # 병합 결과를 담을 임시 배열 tmp 생성
  tmp = Array.new(right - left + 1, 0)
  # 왼쪽과 오른쪽 부분 배열의 시작 인덱스 초기화
  i, j, k = left, mid + 1, 0
  # 양쪽 부분 배열에 모두 원소가 남아 있으면 서로 비교하여 더 작은 원소를 임시 배열에 복사
  while i <= mid && j <= right
    if nums[i] <= nums[j]
      tmp[k] = nums[i]
      i += 1
    else
      tmp[k] = nums[j]
      j += 1
    end
    k += 1
  end
  # 양쪽 부분 배열에서 남은 원소를 임시 배열에 복사
  while i <= mid
    tmp[k] = nums[i]
    i += 1
    k += 1
  end
  while j <= right
    tmp[k] = nums[j]
    j += 1
    k += 1
  end
  # 임시 배열 tmp의 원소를 원래 배열 nums의 해당 구간에 다시 복사
  (0...tmp.length).each do |k|
    nums[left + k] = tmp[k]
  end
end

### 병합 정렬 ###
def merge_sort(nums, left, right)
  # 종료 조건
  # 부분 배열의 길이가 1이면 재귀 종료
  return if left >= right
  # 분할 단계
  mid = left + (right - left) / 2 # 중간 지점 계산
  merge_sort(nums, left, mid) # 왼쪽 부분 배열을 재귀적으로 정렬
  merge_sort(nums, mid + 1, right) # 오른쪽 부분 배열을 재귀적으로 정렬
  # 병합 단계
  merge(nums, left, mid, right)
end

### 실행 예제 ###
if __FILE__ == $0
  nums = [7, 3, 2, 6, 0, 1, 5, 4]
  merge_sort(nums, 0, nums.length - 1)
  puts "병합 정렬 후 nums = #{nums.inspect}"
end
