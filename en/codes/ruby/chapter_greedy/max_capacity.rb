=begin
File: max_capacity.rb
Created Time: 2024-05-07
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Maximum capacity: greedy ###
def max_capacity(ht)
  # Initialize i, j to be at both ends of the array
  i, j = 0, ht.length - 1
  # Initial max capacity is 0
  res = 0

  # Loop for greedy selection until the two boards meet
  while i < j
    # Update max capacity
    cap = [ht[i], ht[j]].min * (j - i)
    res = [res, cap].max
    # Move the shorter board inward
    if ht[i] < ht[j]
      i += 1
    else
      j -= 1
    end
  end

  res
end

### Driver Code ###
if __FILE__ == $0
  ht = [3, 8, 5, 2, 7, 7, 3, 4]

  # Greedy algorithm
  res = max_capacity(ht)
  puts "Maximum capacity is #{res}"
end
