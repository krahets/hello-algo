=begin
File: n_queens.rb
Created Time: 2024-05-21
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Алгоритм бэктрекинга: n ферзей ###
def backtrack(row, n, state, res, cols, diags1, diags2)
  # Когда все строки заполнены, записать решение
  if row == n
    res << state.map { |row| row.dup }
    return
  end

  # Обойти все столбцы
  for col in 0...n
    # Вычислить главную и побочную диагонали, соответствующие этой клетке
    diag1 = row - col + n - 1
    diag2 = row + col
    # Отсечение: не допускается наличие ферзя в этом столбце, на главной диагонали или на побочной диагонали
    if !cols[col] && !diags1[diag1] && !diags2[diag2]
      # Попытка: разместить ферзя в этой клетке
      state[row][col] = "Q"
      cols[col] = diags1[diag1] = diags2[diag2] = true
      # Перейти к размещению следующей строки
      backtrack(row + 1, n, state, res, cols, diags1, diags2)
      # Откат: восстановить эту клетку в пустое состояние
      state[row][col] = "#"
      cols[col] = diags1[diag1] = diags2[diag2] = false
    end
  end
end

# ## Решить задачу n ферзей ###
def n_queens(n)
  # Инициализировать доску размера n*n, где 'Q' обозначает ферзя, а '#' обозначает пустую клетку
  state = Array.new(n) { Array.new(n, "#") }
  cols = Array.new(n, false) # Записать, есть ли ферзь в столбце
  diags1 = Array.new(2 * n - 1, false) # Записать, есть ли ферзь на главной диагонали
  diags2 = Array.new(2 * n - 1, false) # Записать, есть ли ферзь на побочной диагонали
  res = []
  backtrack(0, n, state, res, cols, diags1, diags2)

  res
end

### Driver Code ###
if __FILE__ == $0
  n = 4
  res = n_queens(n)

  puts "Входдоскаразмерравно #{n}"
  puts "Количество схем размещения ферзей равно #{res.length}"

  for state in res
    puts "--------------------"
    for row in state
      p row
    end
  end
end
