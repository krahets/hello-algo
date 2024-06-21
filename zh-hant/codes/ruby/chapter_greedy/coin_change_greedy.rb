=begin
File: coin_change_greedy.rb
Created Time: 2024-05-07
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 零錢兌換：貪婪 ###
def coin_change_greedy(coins, amt)
  # 假設 coins 串列有序
  i = coins.length - 1
  count = 0
  # 迴圈進行貪婪選擇，直到無剩餘金額
  while amt > 0
    # 找到小於且最接近剩餘金額的硬幣
    while i > 0 && coins[i] > amt
      i -= 1
    end
    # 選擇 coins[i]
    amt -= coins[i]
    count += 1
  end
  # 若未找到可行方案， 則返回 -1
  amt == 0 ? count : -1
end

### Driver Code ###
if __FILE__ == $0
  # 貪婪：能夠保證找到全域性最優解
  coins = [1, 5, 10, 20, 50, 100]
  amt = 186
  res = coin_change_greedy(coins, amt)
  puts "\ncoins = #{coins}, amt = #{amt}"
  puts "湊到 #{amt} 所需的最少硬幣數量為 #{res}"

  # 貪婪：無法保證找到全域性最優解
  coins = [1, 20, 50]
  amt = 60
  res = coin_change_greedy(coins, amt)
  puts "\ncoins = #{coins}, amt = #{amt}"
  puts "湊到 #{amt} 所需的最少硬幣數量為 #{res}"
  puts "實際上需要的最少數量為 3 , 即 20 + 20 + 20"

  # 貪婪：無法保證找到全域性最優解
  coins = [1, 49, 50]
  amt = 98
  res = coin_change_greedy(coins, amt)
  puts "\ncoins = #{coins}, amt = #{amt}"
  puts "湊到 #{amt} 所需的最少硬幣數量為 #{res}"
  puts "實際上需要的最少數量為 2 , 即 49 + 49"
end
