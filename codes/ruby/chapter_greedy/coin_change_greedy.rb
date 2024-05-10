=begin
File: coin_change_greedy.rb
Created Time: 2024-05-07
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 零钱兑换：贪心 ###
def coin_change_greedy(coins, amt)
  # 假设 coins 列表有序
  i = coins.length - 1
  count = 0
  # 循环进行贪心选择，直到无剩余金额
  while amt > 0
    # 找到小于且最接近剩余金额的硬币
    while i > 0 && coins[i] > amt
      i -= 1
    end
    # 选择 coins[i]
    amt -= coins[i]
    count += 1
  end
  # 若未找到可行方案， 则返回 -1
  amt == 0 ? count : -1
end

### Driver Code ###
if __FILE__ == $0
  # 贪心：能够保证找到全局最优解
  coins = [1, 5, 10, 20, 50, 100]
  amt = 186
  res = coin_change_greedy(coins, amt)
  puts "\ncoins = #{coins}, amt = #{amt}"
  puts "凑到 #{amt} 所需的最少硬币数量为 #{res}"

  # 贪心：无法保证找到全局最优解
  coins = [1, 20, 50]
  amt = 60
  res = coin_change_greedy(coins, amt)
  puts "\ncoins = #{coins}, amt = #{amt}"
  puts "凑到 #{amt} 所需的最少硬币数量为 #{res}"
  puts "实际上需要的最少数量为 3 , 即 20 + 20 + 20"

  # 贪心：无法保证找到全局最优解
  coins = [1, 49, 50]
  amt = 98
  res = coin_change_greedy(coins, amt)
  puts "\ncoins = #{coins}, amt = #{amt}"
  puts "凑到 #{amt} 所需的最少硬币数量为 #{res}"
  puts "实际上需要的最少数量为 2 , 即 49 + 49"
end
