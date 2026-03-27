=begin
File: coin_change.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Размен монет: динамическое программирование ###
def coin_change_dp(coins, amt)
  n = coins.length
  _MAX = amt + 1
  # Инициализация таблицы dp
  dp = Array.new(n + 1) { Array.new(amt + 1, 0) }
  # Переход состояний: первая строка и первый столбец
  (1...(amt + 1)).each { |a| dp[0][a] = _MAX }
  # Переход состояний: остальные строки и столбцы
  for i in 1...(n + 1)
    for a in 1...(amt + 1)
      if coins[i - 1] > a
        # Если целевая сумма превышена, монету i не выбирать
        dp[i][a] = dp[i - 1][a]
      else
        # Меньшее из двух решений: не брать или взять монету i
        dp[i][a] = [dp[i - 1][a], dp[i][a - coins[i - 1]] + 1].min
      end
    end
  end
  dp[n][amt] != _MAX ? dp[n][amt] : -1
end

# ## Размен монет: динамическое программирование с оптимизацией памяти ###
def coin_change_dp_comp(coins, amt)
  n = coins.length
  _MAX = amt + 1
  # Инициализация таблицы dp
  dp = Array.new(amt + 1, _MAX)
  dp[0] = 0
  # Переход состояний
  for i in 1...(n + 1)
    # Прямой обход
    for a in 1...(amt + 1)
      if coins[i - 1] > a
        # Если целевая сумма превышена, монету i не выбирать
        dp[a] = dp[a]
      else
        # Меньшее из двух решений: не брать или взять монету i
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

  # Динамическое программирование
  res = coin_change_dp(coins, amt)
  puts "Минимальное число монет для набора целевой суммы = #{res}"

  # Динамическое программирование с оптимизацией памяти
  res = coin_change_dp_comp(coins, amt)
  puts "Минимальное число монет для набора целевой суммы = #{res}"
end
