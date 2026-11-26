=begin
File: coin_change_greedy.rb
Created Time: 2024-05-07
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 硬貨の両替（貪欲法） ###
def coin_change_greedy(coins, amt)
  # リスト coins はソート済みとする
  i = coins.length - 1
  count = 0
  # 残額がなくなるまで貪欲選択を繰り返す
  while amt > 0
    # 残額以下で額面が最大の硬貨を探す
    while i > 0 && coins[i] > amt
      i -= 1
    end
    # coins[i] を選ぶ
    amt -= coins[i]
    count += 1
  end
  # 解が見つからなければ -1 を返す
  amt == 0 ? count : -1
end

### 実行例 ###
if __FILE__ == $0
  # 貪欲法で大域的最適解が必ず求まる例
  coins = [1, 5, 10, 20, 50, 100]
  amt = 186
  res = coin_change_greedy(coins, amt)
  puts "\ncoins = #{coins}, amt = #{amt}"
  puts "金額 #{amt} を作るのに必要な硬貨の最少枚数は #{res}"

  # 貪欲法では大域的最適解を保証できない例
  coins = [1, 20, 50]
  amt = 60
  res = coin_change_greedy(coins, amt)
  puts "\ncoins = #{coins}, amt = #{amt}"
  puts "金額 #{amt} を作るのに必要な硬貨の最少枚数は #{res}"
  puts "実際の最少枚数は 3 枚（20 + 20 + 20）"

  # 貪欲法では大域的最適解を保証できない例
  coins = [1, 49, 50]
  amt = 98
  res = coin_change_greedy(coins, amt)
  puts "\ncoins = #{coins}, amt = #{amt}"
  puts "金額 #{amt} を作るのに必要な硬貨の最少枚数は #{res}"
  puts "実際の最少枚数は 2 枚（49 + 49）"
end
