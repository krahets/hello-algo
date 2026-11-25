=begin
File: coin_change_ii.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 零錢兌換 II：動態規劃 ###
def coin_change_ii_dp(coins, amt)
  n = coins.length
  # 初始化 dp 表
  dp = Array.new(n + 1) { Array.new(amt + 1, 0) }
  # 初始化第一欄
  (0...(n + 1)).each { |i| dp[i][0] = 1 }
  # 狀態轉移
  for i in 1...(n + 1)
    for a in 1...(amt + 1)
      if coins[i - 1] > a
        # 若面額超過目標金額，就不選硬幣 i
        dp[i][a] = dp[i - 1][a]
      else
        # 將不選與選取硬幣 i 兩種情況的組合數相加
        dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
      end
    end
  end
  dp[n][amt]
end

### 零錢兌換 II：空間最佳化後的動態規劃 ###
def coin_change_ii_dp_comp(coins, amt)
  n = coins.length
  # 初始化 dp 表
  dp = Array.new(amt + 1, 0)
  dp[0] = 1
  # 狀態轉移
  for i in 1...(n + 1)
    # 正向走訪
    for a in 1...(amt + 1)
      if coins[i - 1] > a
        # 若面額超過目標金額，就不選硬幣 i
        dp[a] = dp[a]
      else
        # 將不選與選取硬幣 i 兩種情況的組合數相加
        dp[a] = dp[a] + dp[a - coins[i - 1]]
      end
    end
  end
  dp[amt]
end

### 主程式 ###
if __FILE__ == $0
  coins = [1, 2, 5]
  amt = 5

  # 動態規劃
  res = coin_change_ii_dp(coins, amt)
  puts "湊出目標金額的硬幣組合數為 #{res}"

  # 空間最佳化後的動態規劃
  res = coin_change_ii_dp_comp(coins, amt)
  puts "湊出目標金額的硬幣組合數為 #{res}"
end
