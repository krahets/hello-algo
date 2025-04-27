=begin
File: coin_change.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 零錢兌換：動態規劃 ###
def coin_change_dp(coins, amt)
  n = coins.length
  _MAX = amt + 1
  # 初始化 dp 表
  dp = Array.new(n + 1) { Array.new(amt + 1, 0) }
  # 狀態轉移：首行首列
  (1...(amt + 1)).each { |a| dp[0][a] = _MAX }
  # 狀態轉移：其餘行和列
  for i in 1...(n + 1)
    for a in 1...(amt + 1)
      if coins[i - 1] > a
        # 若超過目標金額，則不選硬幣 i
        dp[i][a] = dp[i - 1][a]
      else
        # 不選和選硬幣 i 這兩種方案的較小值
        dp[i][a] = [dp[i - 1][a], dp[i][a - coins[i - 1]] + 1].min
      end
    end
  end
  dp[n][amt] != _MAX ? dp[n][amt] : -1
end

### 零錢兌換：空間最佳化後的動態規劃 ###
def coin_change_dp_comp(coins, amt)
  n = coins.length
  _MAX = amt + 1
  # 初始化 dp 表
  dp = Array.new(amt + 1, _MAX)
  dp[0] = 0
  # 狀態轉移
  for i in 1...(n + 1)
    # 正序走訪
    for a in 1...(amt + 1)
      if coins[i - 1] > a
        # 若超過目標金額，則不選硬幣 i
        dp[a] = dp[a]
      else
        # 不選和選硬幣 i 這兩種方案的較小值
        dp[a] = [dp[a], dp[a - coins[i - 1]] + 1].min
      end
    end
  end
  dp[amt] != _MAX ? dp[amt] : -1
end

### Driver Code ###
if __FILE__ == $0
  coins = [1, 2, 5]
  amt = 4

  # 動態規劃
  res = coin_change_dp(coins, amt)
  puts "湊到目標金額所需的最少硬幣數量為 #{res}"

  # 空間最佳化後的動態規劃
  res = coin_change_dp_comp(coins, amt)
  puts "湊到目標金額所需的最少硬幣數量為 #{res}"
end
