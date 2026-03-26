=begin
File: unbounded_knapsack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Неограниченный рюкзак: динамическое программирование ###
def unbounded_knapsack_dp(wgt, val, cap)
  n = wgt.length
  # Инициализировать таблицу dp
  dp = Array.new(n + 1) { Array.new(cap + 1, 0) }
  # Переход состояния
  for i in 1...(n + 1)
    for c in 1...(cap + 1)
      if wgt[i - 1] > c
        # Если вместимость рюкзака превышена, не брать предмет i
        dp[i][c] = dp[i - 1][c]
      else
        # Выбрать большее из двух вариантов: не брать или взять предмет i
        dp[i][c] = [dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]].max
      end
    end
  end
  dp[n][cap]
end

# ## Неограниченный рюкзак: динамическое программирование с оптимизацией памяти ##3
def unbounded_knapsack_dp_comp(wgt, val, cap)
  n = wgt.length
  # Инициализировать таблицу dp
  dp = Array.new(cap + 1, 0)
  # Переход состояния
  for i in 1...(n + 1)
    # Прямой обход по порядку
    for c in 1...(cap + 1)
      if wgt[i -1] > c
        # Если вместимость рюкзака превышена, не брать предмет i
        dp[c] = dp[c]
      else
        # Выбрать большее из двух вариантов: не брать или взять предмет i
        dp[c] = [dp[c], dp[c - wgt[i - 1]] + val[i - 1]].max
      end
    end
  end
  dp[cap]
end

### Driver Code ###
if __FILE__ == $0
  wgt = [1, 2, 3]
  val = [5, 11, 15]
  cap = 4

  # Динамическое программирование
  res = unbounded_knapsack_dp(wgt, val, cap)
  puts "Максимальная стоимость предметов, не превышающая вместимость рюкзака, равна #{res}"

  # Динамическое программирование с оптимизацией по памяти
  res = unbounded_knapsack_dp_comp(wgt, val, cap)
  puts "Максимальная стоимость предметов, не превышающая вместимость рюкзака, равна #{res}"
end
