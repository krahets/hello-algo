=begin
File: coin_change.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Coin change: dynamic programming ###
def coin_change_dp(coins, amt)
  n = coins.length
  _MAX = amt + 1
  # Initialize the dp table
  dp = Array.new(n + 1) { Array.new(amt + 1, 0) }
  # State transitions: first row and first column
  (1...(amt + 1)).each { |a| dp[0][a] = _MAX }
  # State transitions: remaining rows and columns
  for i in 1...(n + 1)
    for a in 1...(amt + 1)
      if coins[i - 1] > a
        # If the coin exceeds the current amount a, do not choose coin i
        dp[i][a] = dp[i - 1][a]
      else
        # Take the smaller result of not choosing and choosing coin i
        dp[i][a] = [dp[i - 1][a], dp[i][a - coins[i - 1]] + 1].min
      end
    end
  end
  dp[n][amt] != _MAX ? dp[n][amt] : -1
end

### Coin change: space-optimized dynamic programming ###
def coin_change_dp_comp(coins, amt)
  n = coins.length
  _MAX = amt + 1
  # Initialize the dp table
  dp = Array.new(amt + 1, _MAX)
  dp[0] = 0
  # State transitions
  for i in 1...(n + 1)
    # Traverse in increasing order
    for a in 1...(amt + 1)
      if coins[i - 1] > a
        # If the coin exceeds the current amount a, do not choose coin i
        dp[a] = dp[a]
      else
        # Take the smaller result of not choosing and choosing coin i
        dp[a] = [dp[a], dp[a - coins[i - 1]] + 1].min
      end
    end
  end
  dp[amt] != _MAX ? dp[amt] : -1
end

### Driver code ###
if __FILE__ == $0
  coins = [1, 2, 5]
  amt = 4

  # Dynamic programming
  res = coin_change_dp(coins, amt)
  puts "Minimum number of coins needed to make the target amount: #{res}"

  # Space-optimized dynamic programming
  res = coin_change_dp_comp(coins, amt)
  puts "Minimum number of coins needed to make the target amount: #{res}"
end
