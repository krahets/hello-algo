=begin
File: coin_change_ii.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Размен монет II: динамическое программирование ###
def coin_change_ii_dp(coins, amt)
  n = coins.length
  # Инициализация таблицы dp
  dp = Array.new(n + 1) { Array.new(amt + 1, 0) }
  # Инициализация первого столбца
  (0...(n + 1)).each { |i| dp[i][0] = 1 }
  # Переход состояний
  for i in 1...(n + 1)
    for a in 1...(amt + 1)
      if coins[i - 1] > a
        # Если целевая сумма превышена, монету i не выбирать
        dp[i][a] = dp[i - 1][a]
      else
        # Сумма двух решений: не брать или взять монету i
        dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
      end
    end
  end
  dp[n][amt]
end

# ## Размен монет II: динамическое программирование с оптимизацией памяти ###
def coin_change_ii_dp_comp(coins, amt)
  n = coins.length
  # Инициализация таблицы dp
  dp = Array.new(amt + 1, 0)
  dp[0] = 1
  # Переход состояний
  for i in 1...(n + 1)
    # Прямой обход
    for a in 1...(amt + 1)
      if coins[i - 1] > a
        # Если целевая сумма превышена, монету i не выбирать
        dp[a] = dp[a]
      else
        # Сумма двух решений: не брать или взять монету i
        dp[a] = dp[a] + dp[a - coins[i - 1]]
      end
    end
  end
  dp[amt]
end

### Driver Code ###
if __FILE__ == $0
  coins = [1, 2, 5]
  amt = 5

  # Динамическое программирование
  res = coin_change_ii_dp(coins, amt)
  puts "Количество комбинаций монет для набора целевой суммы = #{res}"

  # Динамическое программирование с оптимизацией памяти
  res = coin_change_ii_dp_comp(coins, amt)
  puts "Количество комбинаций монет для набора целевой суммы = #{res}"
end
