=begin
File: coin_change_greedy.rb
Created Time: 2024-05-07
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 零錢兌換：貪婪法 ###
def coin_change_greedy(coins, amt)
  # 假設硬幣清單 coins 已依面額遞增排序
  i = coins.length - 1
  count = 0
  # 反覆依貪婪策略選取硬幣，直到剩餘金額為零
  while amt > 0
    # 找出不超過剩餘金額的最大面額
    while i > 0 && coins[i] > amt
      i -= 1
    end
    # 選取 coins[i]
    amt -= coins[i]
    count += 1
  end
  # 若找不到可行解，則回傳 -1
  amt == 0 ? count : -1
end

### 主程式 ###
if __FILE__ == $0
  # 貪婪法：保證能找到全域最佳解
  coins = [1, 5, 10, 20, 50, 100]
  amt = 186
  res = coin_change_greedy(coins, amt)
  puts "\ncoins = #{coins}, amt = #{amt}"
  puts "湊出 #{amt} 所需的最少硬幣數為 #{res}"

  # 貪婪法：無法保證找到全域最佳解
  coins = [1, 20, 50]
  amt = 60
  res = coin_change_greedy(coins, amt)
  puts "\ncoins = #{coins}, amt = #{amt}"
  puts "湊出 #{amt} 所需的最少硬幣數為 #{res}"
  puts "實際上最少只需 3 枚，即 20 + 20 + 20"

  # 貪婪法：無法保證找到全域最佳解
  coins = [1, 49, 50]
  amt = 98
  res = coin_change_greedy(coins, amt)
  puts "\ncoins = #{coins}, amt = #{amt}"
  puts "湊出 #{amt} 所需的最少硬幣數為 #{res}"
  puts "實際上最少只需 2 枚，即 49 + 49"
end
