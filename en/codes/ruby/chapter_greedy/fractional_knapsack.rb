=begin
File: fractional_knapsack.rb
Created Time: 2024-05-07
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Item ###
class Item
  attr_accessor :w # Item weight
  attr_accessor :v # Item value

  def initialize(w, v)
    @w = w
    @v = v
  end
end

### Fractional knapsack: greedy ###
def fractional_knapsack(wgt, val, cap)
  # Create item list with two attributes: weight, value
  items = wgt.each_with_index.map { |w, i| Item.new(w, val[i]) }
  # Sort by unit value item.v / item.w from high to low
  items.sort! { |a, b| (b.v.to_f / b.w) <=> (a.v.to_f / a.w) }
  # Loop for greedy selection
  res = 0
  for item in items
    if item.w <= cap
      # If remaining capacity is sufficient, put the entire current item into the knapsack
      res += item.v
      cap -= item.w
    else
      # If remaining capacity is insufficient, put part of the current item into the knapsack
      res += (item.v.to_f / item.w) * cap
      # No remaining capacity, so break out of the loop
      break
    end
  end
  res
end

### Driver Code ###
if __FILE__ == $0
  wgt = [10, 20, 30, 40, 50]
  val = [50, 120, 150, 210, 240]
  cap = 50
  n = wgt.length

  # Greedy algorithm
  res = fractional_knapsack(wgt, val, cap)
  puts "Maximum item value not exceeding knapsack capacity is #{res}"
end
