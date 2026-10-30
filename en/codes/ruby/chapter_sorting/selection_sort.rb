=begin
File: selection_sort.rb
Created Time: 2024-05-03
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Selection sort ###
def selection_sort(nums)
  n = nums.length
  # Outer loop: the unsorted range is [i, n-1]
  for i in 0...(n - 1)
    # Inner loop: find the smallest element in the unsorted range
    k = i
    for j in (i + 1)...n
      if nums[j] < nums[k]
        k = j # Record the index of the smallest element
      end
    end
    # Swap the smallest element with the first element of the unsorted range
    nums[i], nums[k] = nums[k], nums[i]
  end
end

### Driver code ###
if __FILE__ == $0
  nums = [4, 1, 3, 1, 5, 2]
  selection_sort(nums)
  puts "After selection sort, nums = #{nums}"
end
