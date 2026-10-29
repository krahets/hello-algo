=begin
File: coin_change_greedy.rb
Created Time: 2024-05-07
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 硬貨の両替：貪欲法 ###
def coin_change_greedy(coins, amt)
  # coins リストはソート済みと仮定する
  i = coins.length - 1
  count = 0
  # 残額がなくなるまで貪欲な選択を繰り返す
  while amt > 0
    # 残額より小さく、残額に最も近い硬貨を探す
    while i > 0 && coins[i] > amt
      i -= 1
    end
    # coins[i] を選ぶ
    amt -= coins[i]
    count += 1
  end
  # 実行可能な方法が見つからなかった場合、-1 を返す
  amt == 0 ? count : -1
end

### 実行用コード ###
if __FILE__ == $0
  # 貪欲法：大域的最適解が得られることを保証できる
  coins = [1, 5, 10, 20, 50, 100]
  amt = 186
  res = coin_change_greedy(coins, amt)
  puts "\ncoins = #{coins}, amt = #{amt}"
  puts "#{amt} にするために必要な硬貨の最小枚数は #{res}"

  # 貪欲法：大域的最適解が得られることを保証できない
  coins = [1, 20, 50]
  amt = 60
  res = coin_change_greedy(coins, amt)
  puts "\ncoins = #{coins}, amt = #{amt}"
  puts "#{amt} にするために必要な硬貨の最小枚数は #{res}"
  puts "実際に必要な最小枚数は 3 、すなわち 20 + 20 + 20"

  # 貪欲法：大域的最適解が得られることを保証できない
  coins = [1, 49, 50]
  amt = 98
  res = coin_change_greedy(coins, amt)
  puts "\ncoins = #{coins}, amt = #{amt}"
  puts "#{amt} にするために必要な硬貨の最小枚数は #{res}"
  puts "実際に必要な最小枚数は 2 、すなわち 49 + 49"
end
