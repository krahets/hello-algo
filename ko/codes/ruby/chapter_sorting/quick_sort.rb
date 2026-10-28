=begin
File: quick_sort.rb
Created Time: 2024-04-01
Author: Cy (3739004@gmail.com), Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 퀵 정렬 클래스 ###
class QuickSort
  class << self
    ### 센티널 분할 ###
    def partition(nums, left, right)
      # nums[left]를 피벗으로 삼는다
      i, j = left, right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # 오른쪽에서 왼쪽으로 피벗보다 작은 첫 번째 원소를 찾는다
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # 왼쪽에서 오른쪽으로 피벗보다 큰 첫 번째 원소를 찾는다
        end
        # 원소 교환
        nums[i], nums[j] = nums[j], nums[i]
      end
      # 피벗을 두 부분 배열의 경계로 교환하여 옮긴다
      nums[i], nums[left] = nums[left], nums[i]
      i # 피벗의 인덱스를 반환한다
    end

    ### 퀵 정렬 클래스 ###
    def quick_sort(nums, left, right)
      # 부분 배열의 길이가 1이 아니면 재귀 호출한다
      if left < right
        # 센티널 분할
        pivot = partition(nums, left, right)
        # 왼쪽 부분 배열과 오른쪽 부분 배열에 재귀 호출한다
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
      # m은 l과 r 사이에 있다
      return mid if (_l <= _m && _m <= _r) || (_r <= _m && _m <= _l)
      # l은 m과 r 사이에 있다
      return left if (_m <= _l && _l <= _r) || (_r <= _l && _l <= _m)
      return right
    end

    ### 센티널 분할(세 수의 중앙값 선택)###
    def partition(nums, left, right)
      ### nums[left]를 피벗으로 삼는다
      med = median_three(nums, left, (left + right) / 2, right)
      # 중앙값을 배열 맨 왼쪽으로 교환하여 옮긴다
      nums[left], nums[med] = nums[med], nums[left]
      i, j = left, right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # 오른쪽에서 왼쪽으로 피벗보다 작은 첫 번째 원소를 찾는다
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # 왼쪽에서 오른쪽으로 피벗보다 큰 첫 번째 원소를 찾는다
        end
        # 원소 교환
        nums[i], nums[j] = nums[j], nums[i]
      end
      # 피벗을 두 부분 배열의 경계로 교환하여 옮긴다
      nums[i], nums[left] = nums[left], nums[i]
      i # 피벗의 인덱스를 반환한다
    end

    ### 퀵 정렬 ###
    def quick_sort(nums, left, right)
      # 부분 배열의 길이가 1이 아니면 재귀 호출한다
      if left < right
        # 센티널 분할
        pivot = partition(nums, left, right)
        # 왼쪽 부분 배열과 오른쪽 부분 배열에 재귀 호출한다
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
    ### 센티널 분할 ###
    def partition(nums, left, right)
      # nums[left]를 피벗으로 삼는다
      i = left
      j = right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # 오른쪽에서 왼쪽으로 피벗보다 작은 첫 번째 원소를 찾는다
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # 왼쪽에서 오른쪽으로 피벗보다 큰 첫 번째 원소를 찾는다
        end
        # 원소 교환
        nums[i], nums[j] = nums[j], nums[i]
      end
      # 피벗을 두 부분 배열의 경계로 교환하여 옮긴다
      nums[i], nums[left] = nums[left], nums[i]
      i # 피벗의 인덱스를 반환한다
    end

    ### 퀵 정렬(재귀 깊이 최적화)###
    def quick_sort(nums, left, right)
      # 부분 배열의 길이가 1이 아니면 재귀 호출한다
      while left < right
        # 센티널 분할
        pivot = partition(nums, left, right)
        # 두 부분 배열 중 더 짧은 쪽에 퀵 정렬을 수행한다
        if pivot - left < right - pivot
          quick_sort(nums, left, pivot - 1)
          left = pivot + 1 # 남은 미정렬 구간은 [pivot + 1, right]이다
        else
          quick_sort(nums, pivot + 1, right)
          right = pivot - 1 # 남은 미정렬 구간은 [left, pivot - 1]이다
        end
      end
    end
  end
end

### 실행 코드 ###
if __FILE__ == $0
  # 퀵 정렬
  nums = [2, 4, 1, 0, 3, 5]
  QuickSort.quick_sort(nums, 0, nums.length - 1)
  puts "퀵 정렬을 마친 후 nums = #{nums}"

  # 퀵 정렬(중앙값 피벗 최적화)
  nums1 = [2, 4, 1, 0, 3, 5]
  QuickSortMedian.quick_sort(nums1, 0, nums1.length - 1)
  puts "퀵 정렬(중앙값 피벗 최적화)을 마친 후 nums1 = #{nums1}"

  # 퀵 정렬(재귀 깊이 최적화)
  nums2 = [2, 4, 1, 0, 3, 5]
  QuickSortTailCall.quick_sort(nums2, 0, nums2.length - 1)
  puts "퀵 정렬(재귀 깊이 최적화)을 마친 후 nums2 = #{nums2}"
end
