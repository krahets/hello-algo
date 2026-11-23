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

### Fractional knapsack: greedy algorithm ###
def fractional_knapsack(wgt, val, cap)
  # Create a list of items, each with two attributes: weight and value
  items = wgt.each_with_index.map { |w, i| Item.new(w, val[i]) }
  # Sort by value per unit weight, item.v / item.w, in descending order
  items.sort! { |a, b| (b.v.to_f / b.w) <=> (a.v.to_f / a.w) }
  # Repeatedly make greedy choices
  res = 0
  for item in items
    if item.w <= cap
      # If enough capacity remains, put the entire current item in the knapsack
      res += item.v
      cap -= item.w
    else
      # If the remaining capacity is insufficient, put part of the current item in the knapsack
      res += (item.v.to_f / item.w) * cap
      # No capacity remains, so exit the loop
      break
    end
  end
  res
end

### Driver code ###
if __FILE__ == $0
  wgt = [10, 20, 30, 40, 50]
  val = [50, 120, 150, 210, 240]
  cap = 50
  n = wgt.length

  # Greedy algorithm
  res = fractional_knapsack(wgt, val, cap)
  puts "Maximum total item value within the knapsack capacity: #{res}"
end
