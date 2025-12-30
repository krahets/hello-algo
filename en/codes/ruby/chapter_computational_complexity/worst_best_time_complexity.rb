=begin
File: worst_best_time_complexity.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Generate array with elements: 1, 2, ..., n, shuffled ###
def random_numbers(n)
  # Generate array nums =: 1, 2, 3, ..., n
  nums = Array.new(n) { |i| i + 1 }
  # Randomly shuffle array elements
  nums.shuffle!
end

### Find index of number 1 in array nums ###
def find_one(nums)
  for i in 0...nums.length
    # When element 1 is at the head of the array, best time complexity O(1) is achieved
    # When element 1 is at the tail of the array, worst time complexity O(n) is achieved
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
    puts "\nArray [ 1, 2, ..., n ] after shuffling = #{nums}"
    puts "Index of number 1 is #{index}"
  end
end
