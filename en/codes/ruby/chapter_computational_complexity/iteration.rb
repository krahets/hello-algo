=begin
File: iteration.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com), Cy (9738314@gmail.com)
=end

### for loop ###
def for_loop(n)
  res = 0

  # Sum 1, 2, ..., n-1, n in a loop
  for i in 1..n
    res += i
  end

  res
end

### while loop ###
def while_loop(n)
  res = 0
  i = 1 # Initialize the loop control variable

  # Sum 1, 2, ..., n-1, n in a loop
  while i <= n
    res += i
    i += 1 # Update the loop control variable
  end

  res
end

### while loop (two updates)###
def while_loop_ii(n)
  res = 0
  i = 1 # Initialize the loop control variable

  # Sum 1, 4, 10, ... in a loop
  while i <= n
    res += i
    # Update the loop control variable
    i += 1
    i *= 2
  end

  res
end

### Nested for loops ###
def nested_for_loop(n)
  res = ""

  # Loop over i = 1, 2, ..., n-1, n
  for i in 1..n
    # Loop over j = 1, 2, ..., n-1, n
    for j in 1..n
      res += "(#{i}, #{j}), "
    end
  end

  res
end

### Driver code ###
if __FILE__ == $0
  n = 5

  res = for_loop(n)
  puts "\nSum from the for loop: res = #{res}"

  res = while_loop(n)
  puts "\nSum from the while loop: res = #{res}"

  res = while_loop_ii(n)
  puts "\nSum from the while loop with two updates: res = #{res}"

  res = nested_for_loop(n)
  puts "\nTraversal result from nested for loops: #{res}"
end
