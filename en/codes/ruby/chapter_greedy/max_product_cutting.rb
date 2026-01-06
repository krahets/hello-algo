=begin
File: max_product_cutting.rb
Created Time: 2024-05-07
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Maximum cutting product: greedy ###
def max_product_cutting(n)
  # When n <= 3, must cut out a 1
  return 1 * (n - 1) if n <= 3
  # Greedily cut out 3, a is the number of 3s, b is the remainder
  a, b = n / 3, n % 3
  # When the remainder is 1, convert a pair of 1 * 3 to 2 * 2
  return (3.pow(a - 1) * 2 * 2).to_i if b == 1
  # When the remainder is 2, do nothing
  return (3.pow(a) * 2).to_i if b == 2
  # When the remainder is 0, do nothing
  3.pow(a).to_i
end

### Driver Code ###
if __FILE__ == $0
  n = 58

  # Greedy algorithm
  res = max_product_cutting(n)
  puts "Maximum cutting product is #{res}"
end
