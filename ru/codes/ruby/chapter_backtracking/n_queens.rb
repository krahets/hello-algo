=begin
File: n_queens.rb
Created Time: 2024-05-21
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Алгоритм бэктрекинга: n ферзей ###
def backtrack(row, n, state, res, cols, diags1, diags2)
  # Когда все строки уже обработаны, записать решение
  if row == n
    res << state.map { |row| row.dup }
    return
  end

  # Обойти все столбцы
  for col in 0...n
    # Вычислить главную и побочную диагонали, соответствующие этой клетке
    diag1 = row - col + n - 1
    diag2 = row + col
    # Отсечение: в столбце, главной диагонали и побочной диагонали этой клетки не должно быть ферзей
    if !cols[col] && !diags1[diag1] && !diags2[diag2]
      # Попытка: поставить ферзя в эту клетку
      state[row][col] = "Q"
      cols[col] = diags1[diag1] = diags2[diag2] = true
      # Перейти к размещению следующей строки
      backtrack(row + 1, n, state, res, cols, diags1, diags2)
      # Откат: восстановить эту клетку как пустую
      state[row][col] = "#"
      cols[col] = diags1[diag1] = diags2[diag2] = false
    end
  end
end

# ## Решить задачу о n ферзях ###
def n_queens(n)
  # Инициализировать доску размера n*n, где 'Q' обозначает ферзя, а '#' — пустую клетку
  state = Array.new(n) { Array.new(n, "#") }
  cols = Array.new(n, false) # Отмечать, есть ли ферзь в столбце
  diags1 = Array.new(2 * n - 1, false) # Отмечать наличие ферзя на главной диагонали
  diags2 = Array.new(2 * n - 1, false) # Отмечать наличие ферзя на побочной диагонали
  res = []
  backtrack(0, n, state, res, cols, diags1, diags2)

  res
end

### Driver Code ###
if __FILE__ == $0
  n = 4
  res = n_queens(n)

  puts "Размер входной доски = #{n}"
  puts "Количество способов расстановки ферзей: #{res.length}"

  for state in res
    puts "--------------------"
    for row in state
      p row
    end
  end
end
