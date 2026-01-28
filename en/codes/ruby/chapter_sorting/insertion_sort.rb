=begin
File: insertion_sort.rb
Created Time: 2024-04-02
Author: Cy (3739004@gmail.com), Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Insertion sort ###
def insertion_sort(nums)
  n = nums.length
  # Outer loop: sorted interval is [0, i-1]
  for i in 1...n
    base = nums[i]
    j = i - 1
    # Inner loop: insert base into the correct position within the sorted interval [0, i-1]
    while j >= 0 && nums[j] > base
      nums[j + 1] = nums[j] # Move nums[j] to the right by one position
      j -= 1
    end
    nums[j + 1] = base # Assign base to the correct position
  end
end

### Driver Code ###
nums = [4, 1, 3, 1, 5, 2]
insertion_sort(nums)
puts "After insertion sort, nums = #{nums}"
