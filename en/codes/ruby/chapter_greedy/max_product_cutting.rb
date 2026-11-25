=begin
File: max_product_cutting.rb
Created Time: 2024-05-07
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Greedy maximum product algorithm ###
def max_product_cutting(n)
  # When n <= 3, one piece must be 1
  return 1 * (n - 1) if n <= 3
  # Greedily cut off pieces of size 3. Let a be their count and b the remainder
  a, b = n / 3, n % 3
  # If the remainder is 1, replace one pair 1 * 3 with 2 * 2
  return (3.pow(a - 1) * 2 * 2).to_i if b == 1
  # If the remainder is 2, leave it as is
  return (3.pow(a) * 2).to_i if b == 2
  # If the remainder is 0, no adjustment is needed
  3.pow(a).to_i
end

### Driver code ###
if __FILE__ == $0
  n = 58

  # Greedy algorithm
  res = max_product_cutting(n)
  puts "The maximum product after cutting is #{res}"
end
