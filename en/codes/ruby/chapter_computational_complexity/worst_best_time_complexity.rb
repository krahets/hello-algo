=begin
File: worst_best_time_complexity.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Generate an array containing 1, 2, ..., n in shuffled order ###
def random_numbers(n)
  # Generate the array nums = 1, 2, 3, ..., n
  nums = Array.new(n) { |i| i + 1 }
  # Randomly shuffle the array elements
  nums.shuffle!
end

### Find the index of the number 1 in array nums ###
def find_one(nums)
  for i in 0...nums.length
    # When 1 is at the start of the array, the best-case time complexity is O(1)
    # When 1 is at the end of the array, the worst-case time complexity is O(n)
    return i if nums[i] == 1
  end

  -1
end

### Driver code ###
if __FILE__ == $0
  for i in 0...10
    n = 100
    nums = random_numbers(n)
    index = find_one(nums)
    puts "\nArray [1, 2, ..., n] after shuffling = #{nums}"
    puts "Index of 1: #{index}"
  end
end
