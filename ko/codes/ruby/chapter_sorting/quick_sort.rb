=begin
File: quick_sort.rb
Created Time: 2024-04-01
Author: Cy (3739004@gmail.com), Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 퀵 정렬 클래스 ###
class QuickSort
  class << self
    ### 양방향 포인터로 분할 ###
    def partition(nums, left, right)
      # nums[left]를 피벗으로 선택
      i, j = left, right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
        end
        # 원소 교환
        nums[i], nums[j] = nums[j], nums[i]
      end
      # 교환을 통해 피벗을 두 부분 배열의 경계에 배치
      nums[i], nums[left] = nums[left], nums[i]
      i # 피벗의 인덱스 반환
    end

    ### 퀵 정렬 클래스 ###
    def quick_sort(nums, left, right)
      # 부분 배열의 길이가 1이 아니면 재귀 호출
      if left < right
        # 양방향 포인터로 분할
        pivot = partition(nums, left, right)
        # 왼쪽과 오른쪽 부분 배열을 각각 재귀적으로 정렬
        quick_sort(nums, left, pivot - 1)
        quick_sort(nums, pivot + 1, right)
      end
      nums
    end
  end
end

### 퀵 정렬 클래스(중앙값 최적화)###
class QuickSortMedian
  class << self
    ### 세 후보 원소의 중앙값 선택 ###
    def median_three(nums, left, mid, right)
      # 세 후보 원소의 중앙값 선택
      _l, _m, _r = nums[left], nums[mid], nums[right]
      # m이 l과 r 사이에 있음
      return mid if (_l <= _m && _m <= _r) || (_r <= _m && _m <= _l)
      # l이 m과 r 사이에 있음
      return left if (_m <= _l && _l <= _r) || (_r <= _l && _l <= _m)
      return right
    end

    ### 양방향 포인터로 분할(세 값의 중앙값 선택)###
    def partition(nums, left, right)
      ### nums[left]를 피벗으로 선택
      med = median_three(nums, left, (left + right) / 2, right)
      # 교환을 통해 중앙값을 배열의 왼쪽 끝에 배치
      nums[left], nums[med] = nums[med], nums[left]
      i, j = left, right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
        end
        # 원소 교환
        nums[i], nums[j] = nums[j], nums[i]
      end
      # 교환을 통해 피벗을 두 부분 배열의 경계에 배치
      nums[i], nums[left] = nums[left], nums[i]
      i # 피벗의 인덱스 반환
    end

    ### 퀵 정렬 ###
    def quick_sort(nums, left, right)
      # 부분 배열의 길이가 1이 아니면 재귀 호출
      if left < right
        # 양방향 포인터로 분할
        pivot = partition(nums, left, right)
        # 왼쪽과 오른쪽 부분 배열을 각각 재귀적으로 정렬
        quick_sort(nums, left, pivot - 1)
        quick_sort(nums, pivot + 1, right)
      end
      nums
    end
  end
end

### 퀵 정렬 클래스(재귀 깊이 최적화)###
class QuickSortTailCall
  class << self
    ### 양방향 포인터로 분할 ###
    def partition(nums, left, right)
      # nums[left]를 피벗으로 선택
      i = left
      j = right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
        end
        # 원소 교환
        nums[i], nums[j] = nums[j], nums[i]
      end
      # 교환을 통해 피벗을 두 부분 배열의 경계에 배치
      nums[i], nums[left] = nums[left], nums[i]
      i # 피벗의 인덱스 반환
    end

    ### 퀵 정렬(재귀 깊이 최적화)###
    def quick_sort(nums, left, right)
      # 부분 배열의 길이가 1이 아니면 재귀 호출
      while left < right
        # 양방향 포인터로 분할
        pivot = partition(nums, left, right)
        # 두 부분 배열 중 더 짧은 쪽에 퀵 정렬 수행
        if pivot - left < right - pivot
          quick_sort(nums, left, pivot - 1)
          left = pivot + 1 # 남은 미정렬 구간은 [pivot + 1, right]
        else
          quick_sort(nums, pivot + 1, right)
          right = pivot - 1 # 남은 미정렬 구간은 [left, pivot - 1]
        end
      end
    end
  end
end

### 실행 예제 ###
if __FILE__ == $0
  # 퀵 정렬
  nums = [2, 4, 1, 0, 3, 5]
  QuickSort.quick_sort(nums, 0, nums.length - 1)
  puts "퀵 정렬 후 nums = #{nums}"

  # 퀵 정렬(중앙값 피벗 최적화)
  nums1 = [2, 4, 1, 0, 3, 5]
  QuickSortMedian.quick_sort(nums1, 0, nums1.length - 1)
  puts "퀵 정렬(중앙값 피벗 최적화) 후 nums1 = #{nums1}"

  # 퀵 정렬(재귀 깊이 최적화)
  nums2 = [2, 4, 1, 0, 3, 5]
  QuickSortTailCall.quick_sort(nums2, 0, nums2.length - 1)
  puts "퀵 정렬(재귀 깊이 최적화) 후 nums2 = #{nums2}"
end
