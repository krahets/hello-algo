=begin
File: coin_change_greedy.rb
Created Time: 2024-05-07
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### コイン両替：貪欲法 ###
def coin_change_greedy(coins, amt)
  # coins リストはソート済みと仮定する
  i = coins.length - 1
  count = 0
  # 残額がなくなるまで貪欲選択を繰り返す
  while amt > 0
    # 残額以下で最も近い硬貨を見つける
    while i > 0 && coins[i] > amt
      i -= 1
    end
    # coins[i] を選択する
    amt -= coins[i]
    count += 1
  end
  # 実行可能な解が見つからなければ `-1` を返す
  amt == 0 ? count : -1
end

### Driver Code ###
if __FILE__ == $0
  # 貪欲法：大域最適解を保証できる
  coins = [1, 5, 10, 20, 50, 100]
  amt = 186
  res = coin_change_greedy(coins, amt)
  puts "\ncoins = #{coins}, amt = #{amt}"
  puts "#{amt} にするために必要な最小硬貨枚数は #{res}"

  # 貪欲法：大域最適解を保証できない
  coins = [1, 20, 50]
  amt = 60
  res = coin_change_greedy(coins, amt)
  puts "\ncoins = #{coins}, amt = #{amt}"
  puts "#{amt} にするために必要な最小硬貨枚数は #{res}"
  puts "実際に必要な最小個数は 3 、つまり 20 + 20 + 20"

  # 貪欲法：大域最適解を保証できない
  coins = [1, 49, 50]
  amt = 98
  res = coin_change_greedy(coins, amt)
  puts "\ncoins = #{coins}, amt = #{amt}"
  puts "#{amt} にするために必要な最小硬貨枚数は #{res}"
  puts "実際に必要な最小個数は 2 、つまり 49 + 49"
end
