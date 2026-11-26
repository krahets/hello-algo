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

### Greedy fractional knapsack ###
def fractional_knapsack(wgt, val, cap)
  # Create a list of items, each with a weight and a value
  items = wgt.each_with_index.map { |w, i| Item.new(w, val[i]) }
  # Sort by value per unit of weight, item.v / item.w, in descending order
  items.sort! { |a, b| (b.v.to_f / b.w) <=> (a.v.to_f / a.w) }
  # Make greedy choices in a loop
  res = 0
  for item in items
    if item.w <= cap
      # If the whole item fits, put it in the knapsack
      res += item.v
      cap -= item.w
    else
      # If the whole item does not fit, take a fraction of it
      res += (item.v.to_f / item.w) * cap
      # The knapsack is full, so exit the loop
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
  puts "The maximum total value within the weight limit is #{res}"
end
