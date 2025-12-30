=begin
File: coin_change_greedy.rb
Created Time: 2024-05-07
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Coin change: greedy ###
def coin_change_greedy(coins, amt)
  # Assume coins list is sorted
  i = coins.length - 1
  count = 0
  # Loop to make greedy choices until no remaining amount
  while amt > 0
    # Find the coin that is less than and closest to the remaining amount
    while i > 0 && coins[i] > amt
      i -= 1
    end
    # Choose coins[i]
    amt -= coins[i]
    count += 1
  end
  # Return -1 if no solution found
  amt == 0 ? count : -1
end

### Driver Code ###
if __FILE__ == $0
  # Greedy algorithm: Can guarantee finding the global optimal solution
  coins = [1, 5, 10, 20, 50, 100]
  amt = 186
  res = coin_change_greedy(coins, amt)
  puts "\ncoins = #{coins}, amt = #{amt}"
  puts "Minimum coins needed to make #{amt} is #{res}"

  # Greedy algorithm: Cannot guarantee finding the global optimal solution
  coins = [1, 20, 50]
  amt = 60
  res = coin_change_greedy(coins, amt)
  puts "\ncoins = #{coins}, amt = #{amt}"
  puts "Minimum coins needed to make #{amt} is #{res}"
  puts "Actually minimum needed is 3, i.e., 20 + 20 + 20"

  # Greedy algorithm: Cannot guarantee finding the global optimal solution
  coins = [1, 49, 50]
  amt = 98
  res = coin_change_greedy(coins, amt)
  puts "\ncoins = #{coins}, amt = #{amt}"
  puts "Minimum coins needed to make #{amt} is #{res}"
  puts "Actually minimum needed is 2, i.e., 49 + 49"
end
