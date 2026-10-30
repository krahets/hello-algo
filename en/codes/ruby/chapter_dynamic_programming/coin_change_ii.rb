=begin
File: coin_change_ii.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Coin change II: dynamic programming ###
def coin_change_ii_dp(coins, amt)
  n = coins.length
  # Initialize the dp table
  dp = Array.new(n + 1) { Array.new(amt + 1, 0) }
  # Initialize the first column
  (0...(n + 1)).each { |i| dp[i][0] = 1 }
  # State transitions
  for i in 1...(n + 1)
    for a in 1...(amt + 1)
      if coins[i - 1] > a
        # If the coin exceeds the current amount a, do not choose coin i
        dp[i][a] = dp[i - 1][a]
      else
        # Add the numbers of ways without and with coin i
        dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
      end
    end
  end
  dp[n][amt]
end

### Coin change II: space-optimized dynamic programming ###
def coin_change_ii_dp_comp(coins, amt)
  n = coins.length
  # Initialize the dp table
  dp = Array.new(amt + 1, 0)
  dp[0] = 1
  # State transitions
  for i in 1...(n + 1)
    # Traverse in increasing order
    for a in 1...(amt + 1)
      if coins[i - 1] > a
        # If the coin exceeds the current amount a, do not choose coin i
        dp[a] = dp[a]
      else
        # Add the numbers of ways without and with coin i
        dp[a] = dp[a] + dp[a - coins[i - 1]]
      end
    end
  end
  dp[amt]
end

### Driver code ###
if __FILE__ == $0
  coins = [1, 2, 5]
  amt = 5

  # Dynamic programming
  res = coin_change_ii_dp(coins, amt)
  puts "Number of coin combinations that make the target amount: #{res}"

  # Space-optimized dynamic programming
  res = coin_change_ii_dp_comp(coins, amt)
  puts "Number of coin combinations that make the target amount: #{res}"
end
