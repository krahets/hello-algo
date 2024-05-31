=begin
File: climbing_stairs_dp.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 爬樓梯：動態規劃 ###
def climbing_stairs_dp(n)
  return n  if n == 1 || n == 2

  # 初始化 dp 表，用於儲存子問題的解
  dp = Array.new(n + 1, 0)
  # 初始狀態：預設最小子問題的解
  dp[1], dp[2] = 1, 2
  # 狀態轉移：從較小子問題逐步求解較大子問題
  (3...(n + 1)).each { |i| dp[i] = dp[i - 1] + dp[i - 2] }

  dp[n]
end

### 爬樓梯：空間最佳化後的動態規劃 ###
def climbing_stairs_dp_comp(n)
  return n if n == 1 || n == 2

  a, b = 1, 2
  (3...(n + 1)).each { a, b = b, a + b }

  b
end

### Driver Code ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_dp(n)
  puts "爬 #{n} 階樓梯共有 #{res} 種方案"

  res = climbing_stairs_dp_comp(n)
  puts "爬 #{n} 階樓梯共有 #{res} 種方案"
end
