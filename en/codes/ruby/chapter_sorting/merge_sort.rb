=begin
File: merge_sort.rb
Created Time: 2024-04-10
Author: junminhong (junminhong1110@gmail.com)
=end

### Merge the left and right subarrays ###
def merge(nums, left, mid, right)
  # The left subarray spans [left, mid] and the right spans [mid+1, right]
  # Create a temporary array tmp for the merged result
  tmp = Array.new(right - left + 1, 0)
  # Initialize the starting indices of the left and right subarrays
  i, j, k = left, mid + 1, 0
  # While both subarrays have elements left, compare their front elements and copy the smaller one to the temporary array
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
  # Copy any remaining elements from either subarray to the temporary array
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
  # Copy tmp back into the corresponding range of nums
  (0...tmp.length).each do |k|
    nums[left + k] = tmp[k]
  end
end

### Merge sort ###
def merge_sort(nums, left, right)
  # Base case
  # Stop recursing when the subarray has length 1
  return if left >= right
  # Divide
  mid = left + (right - left) / 2 # Find the midpoint
  merge_sort(nums, left, mid) # Recurse on the left subarray
  merge_sort(nums, mid + 1, right) # Recurse on the right subarray
  # Merge
  merge(nums, left, mid, right)
end

### Driver Code ###
if __FILE__ == $0
  nums = [7, 3, 2, 6, 0, 1, 5, 4]
  merge_sort(nums, 0, nums.length - 1)
  puts "After merge sort, nums = #{nums.inspect}"
end
