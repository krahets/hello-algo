=begin
File: max_capacity.rb
Created Time: 2024-05-07
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Maximum container capacity: greedy algorithm ###
def max_capacity(ht)
  # Initialize i and j at opposite ends of the array
  i, j = 0, ht.length - 1
  # The initial maximum capacity is 0
  res = 0

  # Repeatedly make greedy choices until the two sides meet
  while i < j
    # Update the maximum capacity
    cap = [ht[i], ht[j]].min * (j - i)
    res = [res, cap].max
    # Move the shorter side inward
    if ht[i] < ht[j]
      i += 1
    else
      j -= 1
    end
  end

  res
end

### Driver code ###
if __FILE__ == $0
  ht = [3, 8, 5, 2, 7, 7, 3, 4]

  # Greedy algorithm
  res = max_capacity(ht)
  puts "Maximum capacity: #{res}"
end
