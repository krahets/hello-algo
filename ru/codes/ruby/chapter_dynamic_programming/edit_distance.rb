=begin
File: edit_distance.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Редакционное расстояние: полный перебор ###
def edit_distance_dfs(s, t, i, j)
  # Если s и t пусты, вернуть 0
  return 0 if i == 0 && j == 0
  # Если s пусто, вернуть длину t
  return j if i == 0
  # Если t пусто, вернуть длину s
  return i if j == 0
  # Если два символа равны, сразу пропустить их
  return edit_distance_dfs(s, t, i - 1, j - 1) if s[i - 1] == t[j - 1]
  # Минимальное число шагов редактирования = минимальное число шагов для вставки, удаления и замены + 1
  insert = edit_distance_dfs(s, t, i, j - 1)
  delete = edit_distance_dfs(s, t, i - 1, j)
  replace = edit_distance_dfs(s, t, i - 1, j - 1)
  # Вернуть минимальное число шагов редактирования
  [insert, delete, replace].min + 1
end

def edit_distance_dfs_mem(s, t, mem, i, j)
  # Если s и t пусты, вернуть 0
  return 0 if i == 0 && j == 0
  # Если s пусто, вернуть длину t
  return j if i == 0
  # Если t пусто, вернуть длину s
  return i if j == 0
  # Если запись уже есть, сразу вернуть ее
  return mem[i][j] if mem[i][j] != -1
  # Если два символа равны, сразу пропустить их
  return edit_distance_dfs_mem(s, t, mem, i - 1, j - 1) if s[i - 1] == t[j - 1]
  # Минимальное число шагов редактирования = минимальное число шагов для вставки, удаления и замены + 1
  insert = edit_distance_dfs_mem(s, t, mem, i, j - 1)
  delete = edit_distance_dfs_mem(s, t, mem, i - 1, j)
  replace = edit_distance_dfs_mem(s, t, mem, i - 1, j - 1)
  # Сохранить и вернуть минимальное число шагов редактирования
  mem[i][j] = [insert, delete, replace].min + 1
end

# ## Редакционное расстояние: динамическое программирование ###
def edit_distance_dp(s, t)
  n, m = s.length, t.length
  dp = Array.new(n + 1) { Array.new(m + 1, 0) }
  # Переход состояний: первая строка и первый столбец
  (1...(n + 1)).each { |i| dp[i][0] = i }
  (1...(m + 1)).each { |j| dp[0][j] = j }
  # Переход состояний: остальные строки и столбцы
  for i in 1...(n + 1)
    for j in 1...(m +1)
      if s[i - 1] == t[j - 1]
        # Если два символа равны, сразу пропустить их
        dp[i][j] = dp[i - 1][j - 1]
      else
        # Минимальное число шагов редактирования = минимальное число шагов для вставки, удаления и замены + 1
        dp[i][j] = [dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]].min + 1
      end
    end
  end
  dp[n][m]
end

# ## Редакционное расстояние: динамическое программирование с оптимизацией памяти ###
def edit_distance_dp_comp(s, t)
  n, m = s.length, t.length
  dp = Array.new(m + 1, 0)
  # Переход состояний: первая строка
  (1...(m + 1)).each { |j| dp[j] = j }
  # Переход состояний: остальные строки
  for i in 1...(n + 1)
    # Переход состояний: первый столбец
    leftup = dp.first # Временно сохранить dp[i-1, j-1]
    dp[0] += 1
    # Переход состояний: остальные столбцы
    for j in 1...(m + 1)
      temp = dp[j]
      if s[i - 1] == t[j - 1]
        # Если два символа равны, сразу пропустить их
        dp[j] = leftup
      else
        # Минимальное число шагов редактирования = минимальное число шагов для вставки, удаления и замены + 1
        dp[j] = [dp[j - 1], dp[j], leftup].min + 1
      end
      leftup = temp # Обновить до значения dp[i-1, j-1] для следующей итерации
    end
  end
  dp[m]
end

### Driver Code ###
if __FILE__ == $0
  s = 'bag'
  t = 'pack'
  n, m = s.length, t.length

  # Полный перебор
  res = edit_distance_dfs(s, t, n, m)
  puts "Чтобы преобразовать #{s} в #{t}, требуется минимум #{res} правок"

  # Поиск с мемоизацией
  mem = Array.new(n + 1) { Array.new(m + 1, -1) }
  res = edit_distance_dfs_mem(s, t, mem, n, m)
  puts "Чтобы преобразовать #{s} в #{t}, требуется минимум #{res} правок"

  # Динамическое программирование
  res = edit_distance_dp(s, t)
  puts "Чтобы преобразовать #{s} в #{t}, требуется минимум #{res} правок"

  # Динамическое программирование с оптимизацией памяти
  res = edit_distance_dp_comp(s, t)
  puts "Чтобы преобразовать #{s} в #{t}, требуется минимум #{res} правок"
end
