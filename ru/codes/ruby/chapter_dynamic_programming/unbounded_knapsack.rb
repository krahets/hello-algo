=begin
File: unbounded_knapsack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Неограниченный рюкзак: динамическое программирование ###
def unbounded_knapsack_dp(wgt, val, cap)
  n = wgt.length
  # Инициализировать таблицу dp
  dp = Array.new(n + 1) { Array.new(cap + 1, 0) }
  # Переход между состояниями
  for i in 1...(n + 1)
    for c in 1...(cap + 1)
      if wgt[i - 1] > c
        # Если предмет i тяжелее допустимого, пропустить его
        dp[i][c] = dp[i - 1][c]
      else
        # Взять максимум из двух вариантов: без предмета i и с ним
        dp[i][c] = [dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]].max
      end
    end
  end
  dp[n][cap]
end

### Неограниченный рюкзак: динамическое программирование с экономией памяти ###
def unbounded_knapsack_dp_comp(wgt, val, cap)
  n = wgt.length
  # Инициализировать таблицу dp
  dp = Array.new(cap + 1, 0)
  # Переход между состояниями
  for i in 1...(n + 1)
    # Обход в прямом порядке
    for c in 1...(cap + 1)
      if wgt[i -1] > c
        # Если предмет i тяжелее допустимого, пропустить его
        dp[c] = dp[c]
      else
        # Взять максимум из двух вариантов: без предмета i и с ним
        dp[c] = [dp[c], dp[c - wgt[i - 1]] + val[i - 1]].max
      end
    end
  end
  dp[cap]
end

### Основная программа ###
if __FILE__ == $0
  wgt = [1, 2, 3]
  val = [5, 11, 15]
  cap = 4

  # Динамическое программирование
  res = unbounded_knapsack_dp(wgt, val, cap)
  puts "Максимальная стоимость предметов, помещающихся в рюкзак: #{res}"

  # Динамическое программирование с экономией памяти
  res = unbounded_knapsack_dp_comp(wgt, val, cap)
  puts "Максимальная стоимость предметов, помещающихся в рюкзак: #{res}"
end
