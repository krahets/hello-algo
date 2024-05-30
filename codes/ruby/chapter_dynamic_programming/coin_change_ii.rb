=begin
File: coin_change_ii.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 零钱兑换 II：动态规划 ###
def coin_change_ii_dp(coins, amt)
  n = coins.length
  # 初始化 dp 表
  dp = Array.new(n + 1) { Array.new(amt + 1, 0) }
  # 初始化首列
  (0...(n + 1)).each { |i| dp[i][0] = 1 }
  # 状态转移
  for i in 1...(n + 1)
    for a in 1...(amt + 1)
      if coins[i - 1] > a
        # 若超过目标金额，则不选硬币 i
        dp[i][a] = dp[i - 1][a]
      else
        # 不选和选硬币 i 这两种方案之和
        dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
      end
    end
  end
  dp[n][amt]
end

### 零钱兑换 II：空间优化后的动态规划 ###
def coin_change_ii_dp_comp(coins, amt)
  n = coins.length
  # 初始化 dp 表
  dp = Array.new(amt + 1, 0)
  dp[0] = 1
  # 状态转移
  for i in 1...(n + 1)
    # 正序遍历
    for a in 1...(amt + 1)
      if coins[i - 1] > a
        # 若超过目标金额，则不选硬币 i
        dp[a] = dp[a]
      else
        # 不选和选硬币 i 这两种方案之和
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

  # 动态规划
  res = coin_change_ii_dp(coins, amt)
  puts "凑出目标金额的硬币组合数量为 #{res}"

  # 空间优化后的动态规划
  res = coin_change_ii_dp_comp(coins, amt)
  puts "凑出目标金额的硬币组合数量为 #{res}"
end
