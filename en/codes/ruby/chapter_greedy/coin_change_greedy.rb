=begin
File: coin_change_greedy.rb
Created Time: 2024-05-07
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Coin change: greedy algorithm ###
def coin_change_greedy(coins, amt)
  # Assume the coins list is sorted in ascending order
  i = coins.length - 1
  count = 0
  # Repeatedly make greedy choices until no amount remains
  while amt > 0
    # Find the largest coin no greater than the remaining amount
    while i > 0 && coins[i] > amt
      i -= 1
    end
    # Choose coins[i]
    amt -= coins[i]
    count += 1
  end
  # Return -1 if no feasible solution was found
  amt == 0 ? count : -1
end

### Driver code ###
if __FILE__ == $0
  # Greedy algorithm: guaranteed to find a globally optimal solution
  coins = [1, 5, 10, 20, 50, 100]
  amt = 186
  res = coin_change_greedy(coins, amt)
  puts "\ncoins = #{coins}, amt = #{amt}"
  puts "Greedy coin count for amount #{amt}: #{res}"

  # Greedy algorithm: not guaranteed to find a globally optimal solution
  coins = [1, 20, 50]
  amt = 60
  res = coin_change_greedy(coins, amt)
  puts "\ncoins = #{coins}, amt = #{amt}"
  puts "Greedy coin count for amount #{amt}: #{res}"
  puts "The actual minimum is 3 coins: 20 + 20 + 20"

  # Greedy algorithm: not guaranteed to find a globally optimal solution
  coins = [1, 49, 50]
  amt = 98
  res = coin_change_greedy(coins, amt)
  puts "\ncoins = #{coins}, amt = #{amt}"
  puts "Greedy coin count for amount #{amt}: #{res}"
  puts "The actual minimum is 2 coins: 49 + 49"
end
