=begin
File: min_path_sum.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Минимальная сумма пути: полный перебор ###
def min_path_sum_dfs(grid, i, j)
  # Если это верхняя левая ячейка, завершить поиск
  return grid[i][j] if i == 0 && j == 0
  # Если индексы строки или столбца выходят за границы, вернуть стоимость +∞
  return Float::INFINITY if i < 0 || j < 0
  # Вычислить минимальную стоимость пути из левого верхнего угла до (i-1, j) и (i, j-1)
  up = min_path_sum_dfs(grid, i - 1, j)
  left = min_path_sum_dfs(grid, i, j - 1)
  # Вернуть минимальную стоимость пути из левого верхнего угла до (i, j)
  [left, up].min + grid[i][j]
end

# ## Минимальная сумма пути: поиск с мемоизацией ###
def min_path_sum_dfs_mem(grid, mem, i, j)
  # Если это верхняя левая ячейка, завершить поиск
  return grid[0][0] if i == 0 && j == 0
  # Если индексы строки или столбца выходят за границы, вернуть стоимость +∞
  return Float::INFINITY if i < 0 || j < 0
  # Если запись уже есть, вернуть сразу
  return mem[i][j] if mem[i][j] != -1
  # Минимальная стоимость пути для левой и верхней ячеек
  up = min_path_sum_dfs_mem(grid, mem, i - 1, j)
  left = min_path_sum_dfs_mem(grid, mem, i, j - 1)
  # Сохранить и вернуть минимальную стоимость пути из левого верхнего угла до (i, j)
  mem[i][j] = [left, up].min + grid[i][j]
end

# ## Минимальная сумма пути: динамическое программирование ###
def min_path_sum_dp(grid)
  n, m = grid.length, grid.first.length
  # Инициализация таблицы dp
  dp = Array.new(n) { Array.new(m, 0) }
  dp[0][0] = grid[0][0]
  # Переход состояний: первая строка
  (1...m).each { |j| dp[0][j] = dp[0][j - 1] + grid[0][j] }
  # Переход состояний: первый столбец
  (1...n).each { |i| dp[i][0] = dp[i - 1][0] + grid[i][0] }
  # Переход состояний: остальные строки и столбцы
  for i in 1...n
    for j in 1...m
      dp[i][j] = [dp[i][j - 1], dp[i - 1][j]].min + grid[i][j]
    end
  end
  dp[n -1][m -1]
end

# ## Минимальная сумма пути: динамическое программирование с оптимизацией памяти ###
def min_path_sum_dp_comp(grid)
  n, m = grid.length, grid.first.length
  # Инициализация таблицы dp
  dp = Array.new(m, 0)
  # Переход состояний: первая строка
  dp[0] = grid[0][0]
  (1...m).each { |j| dp[j] = dp[j - 1] + grid[0][j] }
  # Переход состояний: остальные строки
  for i in 1...n
    # Переход состояний: первый столбец
    dp[0] = dp[0] + grid[i][0]
    # Переход состояний: остальные столбцы
    (1...m).each { |j| dp[j] = [dp[j - 1], dp[j]].min + grid[i][j] }
  end
  dp[m - 1]
end

### Driver Code ###
if __FILE__ == $0
  grid = [[1, 3, 1, 5], [2, 2, 4, 2], [5, 3, 2, 1], [4, 3, 5, 2]]
  n, m = grid.length, grid.first.length

  # Полный перебор
  res = min_path_sum_dfs(grid, n - 1, m - 1)
  puts "Минимальная сумма пути из левого верхнего угла в правый нижний = #{res}"

  # Поиск с мемоизацией
  mem = Array.new(n) { Array.new(m, - 1) }
  res = min_path_sum_dfs_mem(grid, mem, n - 1, m -1)
  puts "Минимальная сумма пути из левого верхнего угла в правый нижний = #{res}"

  # Динамическое программирование
  res = min_path_sum_dp(grid)
  puts "Минимальная сумма пути из левого верхнего угла в правый нижний = #{res}"

  # Динамическое программирование с оптимизацией памяти
  res = min_path_sum_dp_comp(grid)
  puts "Минимальная сумма пути из левого верхнего угла в правый нижний = #{res}"
end
