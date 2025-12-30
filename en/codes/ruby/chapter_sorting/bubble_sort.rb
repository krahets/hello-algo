=begin
File: bubble_sort.rb
Created Time: 2024-05-02
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Bubble sort ###
def bubble_sort(nums)
  n = nums.length
  # Outer loop: unsorted range is [0, i]
  for i in (n - 1).downto(1)
    # Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
    for j in 0...i
      if nums[j] > nums[j + 1]
        # Swap nums[j] and nums[j + 1]
        nums[j], nums[j + 1] = nums[j + 1], nums[j]
      end
    end
  end
end

### Bubble sort (flag optimization) ###
def bubble_sort_with_flag(nums)
  n = nums.length
  # Outer loop: unsorted range is [0, i]
  for i in (n - 1).downto(1)
    flag = false # Initialize flag

    # Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
    for j in 0...i
      if nums[j] > nums[j + 1]
        # Swap nums[j] and nums[j + 1]
        nums[j], nums[j + 1] = nums[j + 1], nums[j]
        flag = true # Record element swap
      end
    end

    break unless flag # No elements were swapped in this round of "bubbling", exit directly
  end
end

### Driver Code ###
if __FILE__ == $0
  nums = [4, 1, 3, 1, 5, 2]
  bubble_sort(nums)
  puts "After bubble sort, nums = #{nums}"

  nums1 = [4, 1, 3, 1, 5, 2]
  bubble_sort_with_flag(nums1)
  puts "After bubble sort, nums = #{nums1}"
end
