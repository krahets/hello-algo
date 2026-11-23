=begin
File: bubble_sort.rb
Created Time: 2024-05-02
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Bubble sort ###
def bubble_sort(nums)
  n = nums.length
  # Outer loop: the unsorted range is [0, i]
  for i in (n - 1).downto(1)
    # Inner loop: move the largest element in the unsorted range [0, i] to its right end through swaps
    for j in 0...i
      if nums[j] > nums[j + 1]
        # Swap nums[j] and nums[j + 1]
        nums[j], nums[j + 1] = nums[j + 1], nums[j]
      end
    end
  end
end

### Bubble sort (flag optimization)###
def bubble_sort_with_flag(nums)
  n = nums.length
  # Outer loop: the unsorted range is [0, i]
  for i in (n - 1).downto(1)
    flag = false # Initialize the flag

    # Inner loop: move the largest element in the unsorted range [0, i] to its right end through swaps
    for j in 0...i
      if nums[j] > nums[j + 1]
        # Swap nums[j] and nums[j + 1]
        nums[j], nums[j + 1] = nums[j + 1], nums[j]
        flag = true # Record that a swap occurred
      end
    end

    break unless flag # Exit immediately if this pass made no swaps
  end
end

### Driver code ###
if __FILE__ == $0
  nums = [4, 1, 3, 1, 5, 2]
  bubble_sort(nums)
  puts "After bubble sort, nums = #{nums}"

  nums1 = [4, 1, 3, 1, 5, 2]
  bubble_sort_with_flag(nums1)
  puts "After bubble sort, nums1 = #{nums1}"
end
