=begin
File: climbing_stairs_constraint_dp.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 帶約束爬樓梯：動態規劃 ###
def climbing_stairs_constraint_dp(n)
  return 1 if n == 1 || n == 2

  # 初始化 dp 表，用於儲存子問題的解
  dp = Array.new(n + 1) { Array.new(3, 0) }
  # 初始狀態：預設最小子問題的解
  dp[1][1], dp[1][2] = 1, 0
  dp[2][1], dp[2][2] = 0, 1
  # 狀態轉移：從較小子問題逐步求解較大子問題
  for i in 3...(n + 1)
    dp[i][1] = dp[i - 1][2]
    dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
  end

  dp[n][1] + dp[n][2]
end

### Driver Code ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_constraint_dp(n)
  puts "爬 #{n} 階樓梯共有 #{res} 種方案"
end
