=begin
File: quick_sort.rb
Created Time: 2024-04-01
Author: Cy (3739004@gmail.com), Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Quick sort class ###
class QuickSort
  class << self
    ### Sentinel partition ###
    def partition(nums, left, right)
      # Use nums[left] as the pivot
      i, j = left, right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # Search from right to left for the first element smaller than the pivot
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # Search from left to right for the first element greater than the pivot
        end
        # Swap elements
        nums[i], nums[j] = nums[j], nums[i]
      end
      # Swap the pivot to the boundary between the two subarrays
      nums[i], nums[left] = nums[left], nums[i]
      i # Return the index of the pivot
    end

    ### Quick sort class ###
    def quick_sort(nums, left, right)
      # Recurse when subarray length is not 1
      if left < right
        # Sentinel partition
        pivot = partition(nums, left, right)
        # Recursively process the left subarray and right subarray
        quick_sort(nums, left, pivot - 1)
        quick_sort(nums, pivot + 1, right)
      end
      nums
    end
  end
end

### Quick sort class (median optimization) ###
class QuickSortMedian
  class << self
    ### Select median of three candidate elements ###
    def median_three(nums, left, mid, right)
      # Select the median of three candidate elements
      _l, _m, _r = nums[left], nums[mid], nums[right]
      # m is between l and r
      return mid if (_l <= _m && _m <= _r) || (_r <= _m && _m <= _l)
      # l is between m and r
      return left if (_m <= _l && _l <= _r) || (_r <= _l && _l <= _m)
      return right
    end

    ### Sentinel partition (median of three) ###
    def partition(nums, left, right)
      ### Use nums[left] as pivot
      med = median_three(nums, left, (left + right) / 2, right)
      # Swap median to leftmost position of array
      nums[left], nums[med] = nums[med], nums[left]
      i, j = left, right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # Search from right to left for the first element smaller than the pivot
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # Search from left to right for the first element greater than the pivot
        end
        # Swap elements
        nums[i], nums[j] = nums[j], nums[i]
      end
      # Swap the pivot to the boundary between the two subarrays
      nums[i], nums[left] = nums[left], nums[i]
      i # Return the index of the pivot
    end

    ### Quick sort ###
    def quick_sort(nums, left, right)
      # Recurse when subarray length is not 1
      if left < right
        # Sentinel partition
        pivot = partition(nums, left, right)
        # Recursively process the left subarray and right subarray
        quick_sort(nums, left, pivot - 1)
        quick_sort(nums, pivot + 1, right)
      end
      nums
    end
  end
end

### Quick sort class (recursion depth optimization) ###
class QuickSortTailCall
  class << self
    ### Sentinel partition ###
    def partition(nums, left, right)
      # Use nums[left] as pivot
      i = left
      j = right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # Search from right to left for the first element smaller than the pivot
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # Search from left to right for the first element greater than the pivot
        end
        # Swap elements
        nums[i], nums[j] = nums[j], nums[i]
      end
      # Swap the pivot to the boundary between the two subarrays
      nums[i], nums[left] = nums[left], nums[i]
      i # Return the index of the pivot
    end

    ### Quick sort (recursion depth optimization) ###
    def quick_sort(nums, left, right)
      # Recurse when subarray length is not 1
      while left < right
        # Sentinel partition
        pivot = partition(nums, left, right)
        # Perform quick sort on the shorter of the two subarrays
        if pivot - left < right - pivot
          quick_sort(nums, left, pivot - 1)
          left = pivot + 1 # Remaining unsorted interval is [pivot + 1, right]
        else
          quick_sort(nums, pivot + 1, right)
          right = pivot - 1 # Remaining unsorted interval is [left, pivot - 1]
        end
      end
    end
  end
end

### Driver Code ###
if __FILE__ == $0
  # Quick sort
  nums = [2, 4, 1, 0, 3, 5]
  QuickSort.quick_sort(nums, 0, nums.length - 1)
  puts "After quick sort, nums = #{nums}"

  # Quick sort (recursion depth optimization)
  nums1 = [2, 4, 1, 0, 3, 5]
  QuickSortMedian.quick_sort(nums1, 0, nums1.length - 1)
  puts "After quick sort (median pivot optimization), nums1 = #{nums1}"

  # Quick sort (recursion depth optimization)
  nums2 = [2, 4, 1, 0, 3, 5]
  QuickSortTailCall.quick_sort(nums2, 0, nums2.length - 1)
  puts "After quick sort (recursion depth optimization), nums2 = #{nums2}"
end
