=begin
File: knapsack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Рюкзак 0–1: полный перебор ###
def knapsack_dfs(wgt, val, i, c)
  # Если предметы закончились или места не осталось, вернуть стоимость 0
  return 0 if i == 0 || c == 0
  # Если предмет тяжелее допустимого, остаётся только пропустить его
  return knapsack_dfs(wgt, val, i - 1, c) if wgt[i - 1] > c
  # Вычислить максимальную стоимость без предмета i и с ним
  no = knapsack_dfs(wgt, val, i - 1, c)
  yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1]
  # Вернуть большую из двух стоимостей
  [no, yes].max
end

### Рюкзак 0–1: поиск с мемоизацией ###
def knapsack_dfs_mem(wgt, val, mem, i, c)
  # Если предметы закончились или места не осталось, вернуть стоимость 0
  return 0 if i == 0 || c == 0
  # Если результат сохранён, сразу вернуть его
  return mem[i][c] if mem[i][c] != -1
  # Если предмет тяжелее допустимого, остаётся только пропустить его
  return knapsack_dfs_mem(wgt, val, mem, i - 1, c) if wgt[i - 1] > c
  # Вычислить максимальную стоимость без предмета i и с ним
  no = knapsack_dfs_mem(wgt, val, mem, i - 1, c)
  yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1]
  # Сохранить и вернуть большую из двух стоимостей
  mem[i][c] = [no, yes].max
end

### Рюкзак 0–1: динамическое программирование ###
def knapsack_dp(wgt, val, cap)
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
        dp[i][c] = [dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]].max
      end
    end
  end
  dp[n][cap]
end

### Рюкзак 0–1: динамическое программирование с экономией памяти ###
def knapsack_dp_comp(wgt, val, cap)
  n = wgt.length
  # Инициализировать таблицу dp
  dp = Array.new(cap + 1, 0)
  # Переход между состояниями
  for i in 1...(n + 1)
    # Обход в обратном порядке
    for c in cap.downto(1)
      if wgt[i - 1] > c
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
  wgt = [10, 20, 30, 40, 50]
  val = [50, 120, 150, 210, 240]
  cap = 50
  n = wgt.length

  # Полный перебор
  res = knapsack_dfs(wgt, val, n, cap)
  puts "Максимальная стоимость предметов, помещающихся в рюкзак: #{res}"

  # Поиск с мемоизацией
  mem = Array.new(n + 1) { Array.new(cap + 1, -1) }
  res = knapsack_dfs_mem(wgt, val, mem, n, cap)
  puts "Максимальная стоимость предметов, помещающихся в рюкзак: #{res}"

  # Динамическое программирование
  res = knapsack_dp(wgt, val, cap)
  puts "Максимальная стоимость предметов, помещающихся в рюкзак: #{res}"

  # Динамическое программирование с экономией памяти
  res = knapsack_dp_comp(wgt, val, cap)
  puts "Максимальная стоимость предметов, помещающихся в рюкзак: #{res}"
end
