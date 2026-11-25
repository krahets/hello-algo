=begin
File: worst_best_time_complexity.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Generate a shuffled array containing 1, 2, ..., n ###
def random_numbers(n)
  # Generate nums with elements 1, 2, 3, ..., n
  nums = Array.new(n) { |i| i + 1 }
  # Shuffle the array elements at random
  nums.shuffle!
end

### Find the index of 1 in the array nums ###
def find_one(nums)
  for i in 0...nums.length
    # Best case: 1 is the first element, so the search takes O(1) time
    # Worst case: 1 is the last element, so the search takes O(n) time
    return i if nums[i] == 1
  end

  -1
end

### Driver Code ###
if __FILE__ == $0
  for i in 0...10
    n = 100
    nums = random_numbers(n)
    index = find_one(nums)
    puts "\nShuffled array [ 1, 2, ..., n ] = #{nums}"
    puts "Index of 1 = #{index}"
  end
end
