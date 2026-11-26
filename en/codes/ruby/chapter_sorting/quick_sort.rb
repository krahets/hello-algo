=begin
File: quick_sort.rb
Created Time: 2024-04-01
Author: Cy (3739004@gmail.com), Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Quicksort class ###
class QuickSort
  class << self
    ### Partition with two pointers ###
    def partition(nums, left, right)
      # Use nums[left] as the pivot
      i, j = left, right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # Scan from right to left for the first element smaller than the pivot
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # Scan from left to right for the first element larger than the pivot
        end
        # Swap elements
        nums[i], nums[j] = nums[j], nums[i]
      end
      # Swap the pivot into place between the two subarrays
      nums[i], nums[left] = nums[left], nums[i]
      i # Return the pivot index
    end

    ### Quicksort class ###
    def quick_sort(nums, left, right)
      # Recurse when the subarray length differs from 1
      if left < right
        # Partition with two pointers
        pivot = partition(nums, left, right)
        # Recurse on the left and right subarrays
        quick_sort(nums, left, pivot - 1)
        quick_sort(nums, pivot + 1, right)
      end
      nums
    end
  end
end

### Quicksort class with median-of-three pivot selection###
class QuickSortMedian
  class << self
    ### Select the median of three candidates ###
    def median_three(nums, left, mid, right)
      # Select the median of three candidates
      _l, _m, _r = nums[left], nums[mid], nums[right]
      # m lies between l and r
      return mid if (_l <= _m && _m <= _r) || (_r <= _m && _m <= _l)
      # l lies between m and r
      return left if (_m <= _l && _l <= _r) || (_r <= _l && _l <= _m)
      return right
    end

    ### Partition with two pointers (median of three)###
    def partition(nums, left, right)
      ### Use nums[left] as the pivot
      med = median_three(nums, left, (left + right) / 2, right)
      # Swap the median into the leftmost position
      nums[left], nums[med] = nums[med], nums[left]
      i, j = left, right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # Scan from right to left for the first element smaller than the pivot
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # Scan from left to right for the first element larger than the pivot
        end
        # Swap elements
        nums[i], nums[j] = nums[j], nums[i]
      end
      # Swap the pivot into place between the two subarrays
      nums[i], nums[left] = nums[left], nums[i]
      i # Return the pivot index
    end

    ### Quicksort ###
    def quick_sort(nums, left, right)
      # Recurse when the subarray length differs from 1
      if left < right
        # Partition with two pointers
        pivot = partition(nums, left, right)
        # Recurse on the left and right subarrays
        quick_sort(nums, left, pivot - 1)
        quick_sort(nums, pivot + 1, right)
      end
      nums
    end
  end
end

### Quicksort class with reduced recursion depth###
class QuickSortTailCall
  class << self
    ### Partition with two pointers ###
    def partition(nums, left, right)
      # Use nums[left] as the pivot
      i = left
      j = right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # Scan from right to left for the first element smaller than the pivot
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # Scan from left to right for the first element larger than the pivot
        end
        # Swap elements
        nums[i], nums[j] = nums[j], nums[i]
      end
      # Swap the pivot into place between the two subarrays
      nums[i], nums[left] = nums[left], nums[i]
      i # Return the pivot index
    end

    ### Quicksort with reduced recursion depth###
    def quick_sort(nums, left, right)
      # Recurse when the subarray length differs from 1
      while left < right
        # Partition with two pointers
        pivot = partition(nums, left, right)
        # Apply quicksort to the shorter of the two subarrays
        if pivot - left < right - pivot
          quick_sort(nums, left, pivot - 1)
          left = pivot + 1 # The remaining unsorted range is [pivot + 1, right]
        else
          quick_sort(nums, pivot + 1, right)
          right = pivot - 1 # The remaining unsorted range is [left, pivot - 1]
        end
      end
    end
  end
end

### Driver Code ###
if __FILE__ == $0
  # Quicksort
  nums = [2, 4, 1, 0, 3, 5]
  QuickSort.quick_sort(nums, 0, nums.length - 1)
  puts "After quicksort, nums = #{nums}"

  # Quicksort with median-of-three pivot selection
  nums1 = [2, 4, 1, 0, 3, 5]
  QuickSortMedian.quick_sort(nums1, 0, nums1.length - 1)
  puts "After median-of-three quicksort, nums1 = #{nums1}"

  # Quicksort with reduced recursion depth
  nums2 = [2, 4, 1, 0, 3, 5]
  QuickSortTailCall.quick_sort(nums2, 0, nums2.length - 1)
  puts "After quicksort with reduced recursion depth, nums2 = #{nums2}"
end
