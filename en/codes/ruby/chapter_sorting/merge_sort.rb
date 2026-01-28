=begin
File: merge_sort.rb
Created Time: 2024-04-10
Author: junminhong (junminhong1110@gmail.com)
=end

### Merge left and right subarrays ###
def merge(nums, left, mid, right)
  # Left subarray interval is [left, mid], right subarray interval is [mid+1, right]
  # Create temporary array tmp to store merged result
  tmp = Array.new(right - left + 1, 0)
  # Initialize the start indices of the left and right subarrays
  i, j, k = left, mid + 1, 0
  # While both subarrays still have elements, compare and copy the smaller element into the temporary array
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
  # Copy the remaining elements of the left and right subarrays into the temporary array
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
  # Copy the elements from the temporary array tmp back to the original array nums at the corresponding interval
  (0...tmp.length).each do |k|
    nums[left + k] = tmp[k]
  end
end

### Merge sort ###
def merge_sort(nums, left, right)
  # Termination condition
  # Terminate recursion when subarray length is 1
  return if left >= right
  # Divide and conquer stage
  mid = left + (right - left) / 2 # Calculate midpoint
  merge_sort(nums, left, mid) # Recursively process the left subarray
  merge_sort(nums, mid + 1, right) # Recursively process the right subarray
  # Merge stage
  merge(nums, left, mid, right)
end

### Driver Code ###
if __FILE__ == $0
  nums = [7, 3, 2, 6, 0, 1, 5, 4]
  merge_sort(nums, 0, nums.length - 1)
  puts "After merge sort, nums = #{nums.inspect}"
end
