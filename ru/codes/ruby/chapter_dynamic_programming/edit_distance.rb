=begin
File: edit_distance.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Редакционное расстояние: полный перебор ###
def edit_distance_dfs(s, t, i, j)
  # Если s и t пусты, вернуть 0
  return 0 if i == 0 && j == 0
  # Если s пуста, вернуть длину t
  return j if i == 0
  # Если t пуста, вернуть длину s
  return i if j == 0
  # Если символы совпадают, пропустить оба
  return edit_distance_dfs(s, t, i - 1, j - 1) if s[i - 1] == t[j - 1]
  # Минимум правок равен 1 плюс минимум по трём вариантам: вставка, удаление и замена
  insert = edit_distance_dfs(s, t, i, j - 1)
  delete = edit_distance_dfs(s, t, i - 1, j)
  replace = edit_distance_dfs(s, t, i - 1, j - 1)
  # Вернуть минимальное число правок
  [insert, delete, replace].min + 1
end

def edit_distance_dfs_mem(s, t, mem, i, j)
  # Если s и t пусты, вернуть 0
  return 0 if i == 0 && j == 0
  # Если s пуста, вернуть длину t
  return j if i == 0
  # Если t пуста, вернуть длину s
  return i if j == 0
  # Если результат сохранён, сразу вернуть его
  return mem[i][j] if mem[i][j] != -1
  # Если символы совпадают, пропустить оба
  return edit_distance_dfs_mem(s, t, mem, i - 1, j - 1) if s[i - 1] == t[j - 1]
  # Минимум правок равен 1 плюс минимум по трём вариантам: вставка, удаление и замена
  insert = edit_distance_dfs_mem(s, t, mem, i, j - 1)
  delete = edit_distance_dfs_mem(s, t, mem, i - 1, j)
  replace = edit_distance_dfs_mem(s, t, mem, i - 1, j - 1)
  # Сохранить и вернуть минимальное число правок
  mem[i][j] = [insert, delete, replace].min + 1
end

### Редакционное расстояние: динамическое программирование ###
def edit_distance_dp(s, t)
  n, m = s.length, t.length
  dp = Array.new(n + 1) { Array.new(m + 1, 0) }
  # Переход: первая строка и первый столбец
  (1...(n + 1)).each { |i| dp[i][0] = i }
  (1...(m + 1)).each { |j| dp[0][j] = j }
  # Переход: остальные строки и столбцы
  for i in 1...(n + 1)
    for j in 1...(m +1)
      if s[i - 1] == t[j - 1]
        # Если символы совпадают, пропустить оба
        dp[i][j] = dp[i - 1][j - 1]
      else
        # Минимум правок равен 1 плюс минимум по трём вариантам: вставка, удаление и замена
        dp[i][j] = [dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]].min + 1
      end
    end
  end
  dp[n][m]
end

### Редакционное расстояние: динамическое программирование с экономией памяти ###
def edit_distance_dp_comp(s, t)
  n, m = s.length, t.length
  dp = Array.new(m + 1, 0)
  # Переход: первая строка
  (1...(m + 1)).each { |j| dp[j] = j }
  # Переход: остальные строки
  for i in 1...(n + 1)
    # Переход: первый столбец
    leftup = dp.first # Временно сохранить dp[i-1, j-1]
    dp[0] += 1
    # Переход: остальные столбцы
    for j in 1...(m + 1)
      temp = dp[j]
      if s[i - 1] == t[j - 1]
        # Если символы совпадают, пропустить оба
        dp[j] = leftup
      else
        # Минимум правок равен 1 плюс минимум по трём вариантам: вставка, удаление и замена
        dp[j] = [dp[j - 1], dp[j], leftup].min + 1
      end
      leftup = temp # Обновить значение dp[i-1, j-1] для следующей итерации
    end
  end
  dp[m]
end

### Основная программа ###
if __FILE__ == $0
  s = 'bag'
  t = 'pack'
  n, m = s.length, t.length

  # Полный перебор
  res = edit_distance_dfs(s, t, n, m)
  puts "Для преобразования #{s} в #{t} требуется минимум правок: #{res}."

  # Поиск с мемоизацией
  mem = Array.new(n + 1) { Array.new(m + 1, -1) }
  res = edit_distance_dfs_mem(s, t, mem, n, m)
  puts "Для преобразования #{s} в #{t} требуется минимум правок: #{res}."

  # Динамическое программирование
  res = edit_distance_dp(s, t)
  puts "Для преобразования #{s} в #{t} требуется минимум правок: #{res}."

  # Динамическое программирование с экономией памяти
  res = edit_distance_dp_comp(s, t)
  puts "Для преобразования #{s} в #{t} требуется минимум правок: #{res}."
end
