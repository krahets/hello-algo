=begin
File: knapsack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Рюкзак 0-1: полный перебор ###
def knapsack_dfs(wgt, val, i, c)
  # Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
  return 0 if i == 0 || c == 0
  # Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
  return knapsack_dfs(wgt, val, i - 1, c) if wgt[i - 1] > c
  # Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
  no = knapsack_dfs(wgt, val, i - 1, c)
  yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1]
  # Вернуть вариант с большей стоимостью из двух возможных
  [no, yes].max
end

# ## Рюкзак 0-1: поиск с мемоизацией ###
def knapsack_dfs_mem(wgt, val, mem, i, c)
  # Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
  return 0 if i == 0 || c == 0
  # Если запись уже есть, вернуть сразу
  return mem[i][c] if mem[i][c] != -1
  # Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
  return knapsack_dfs_mem(wgt, val, mem, i - 1, c) if wgt[i - 1] > c
  # Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
  no = knapsack_dfs_mem(wgt, val, mem, i - 1, c)
  yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1]
  # Сохранить и вернуть вариант с большей стоимостью из двух решений
  mem[i][c] = [no, yes].max
end

# ## Рюкзак 0-1: динамическое программирование ###
def knapsack_dp(wgt, val, cap)
  n = wgt.length
  # Инициализация таблицы dp
  dp = Array.new(n + 1) { Array.new(cap + 1, 0) }
  # Переход состояний
  for i in 1...(n + 1)
    for c in 1...(cap + 1)
      if wgt[i - 1] > c
        # Если вместимость рюкзака превышена, предмет i не выбирать
        dp[i][c] = dp[i - 1][c]
      else
        # Большее из двух решений: не брать или взять предмет i
        dp[i][c] = [dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]].max
      end
    end
  end
  dp[n][cap]
end

# ## Рюкзак 0-1: динамическое программирование с оптимизацией памяти ###
def knapsack_dp_comp(wgt, val, cap)
  n = wgt.length
  # Инициализация таблицы dp
  dp = Array.new(cap + 1, 0)
  # Переход состояний
  for i in 1...(n + 1)
    # Обход в обратном порядке
    for c in cap.downto(1)
      if wgt[i - 1] > c
        # Если вместимость рюкзака превышена, предмет i не выбирать
        dp[c] = dp[c]
      else
        # Большее из двух решений: не брать или взять предмет i
        dp[c] = [dp[c], dp[c - wgt[i - 1]] + val[i - 1]].max
      end
    end
  end
  dp[cap]
end

### Driver Code ###
if __FILE__ == $0
  wgt = [10, 20, 30, 40, 50]
  val = [50, 120, 150, 210, 240]
  cap = 50
  n = wgt.length

  # Полный перебор
  res = knapsack_dfs(wgt, val, n, cap)
  puts "Максимальная стоимость предметов без превышения вместимости рюкзака = #{res}"

  # Поиск с мемоизацией
  mem = Array.new(n + 1) { Array.new(cap + 1, -1) }
  res = knapsack_dfs_mem(wgt, val, mem, n, cap)
  puts "Максимальная стоимость предметов без превышения вместимости рюкзака = #{res}"

  # Динамическое программирование
  res = knapsack_dp(wgt, val, cap)
  puts "Максимальная стоимость предметов без превышения вместимости рюкзака = #{res}"

  # Динамическое программирование с оптимизацией памяти
  res = knapsack_dp_comp(wgt, val, cap)
  puts "Максимальная стоимость предметов без превышения вместимости рюкзака = #{res}"
end
