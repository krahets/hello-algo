=begin
File: coin_change_ii.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Coin change II: dynamic programming ###
def coin_change_ii_dp(coins, amt)
  n = coins.length
  # Initialize dp table
  dp = Array.new(n + 1) { Array.new(amt + 1, 0) }
  # Initialize first column
  (0...(n + 1)).each { |i| dp[i][0] = 1 }
  # State transition
  for i in 1...(n + 1)
    for a in 1...(amt + 1)
      if coins[i - 1] > a
        # If exceeds target amount, don't select coin i
        dp[i][a] = dp[i - 1][a]
      else
        # Sum of the two options: not selecting and selecting coin i
        dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
      end
    end
  end
  dp[n][amt]
end

### Coin change II: space-optimized DP ###
def coin_change_ii_dp_comp(coins, amt)
  n = coins.length
  # Initialize dp table
  dp = Array.new(amt + 1, 0)
  dp[0] = 1
  # State transition
  for i in 1...(n + 1)
    # Traverse in forward order
    for a in 1...(amt + 1)
      if coins[i - 1] > a
        # If exceeds target amount, don't select coin i
        dp[a] = dp[a]
      else
        # Sum of the two options: not selecting and selecting coin i
        dp[a] = dp[a] + dp[a - coins[i - 1]]
      end
    end
  end
  dp[amt]
end

### Driver Code ###
if __FILE__ == $0
  coins = [1, 2, 5]
  amt = 5

  # Dynamic programming
  res = coin_change_ii_dp(coins, amt)
  puts "Number of coin combinations to make target amount is #{res}"

  # Space-optimized dynamic programming
  res = coin_change_ii_dp_comp(coins, amt)
  puts "Number of coin combinations to make target amount is #{res}"
end
