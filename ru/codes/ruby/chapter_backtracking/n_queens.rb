=begin
File: n_queens.rb
Created Time: 2024-05-21
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Поиск с возвратом: задача о n ферзях ###
def backtrack(row, n, state, res, cols, diags1, diags2)
  # Когда ферзи расставлены во всех строках, сохраняем решение
  if row == n
    res << state.map { |row| row.dup }
    return
  end

  # Перебираем все столбцы
  for col in 0...n
    # Вычисляем индексы прямой и обратной диагоналей клетки
    diag1 = row - col + n - 1
    diag2 = row + col
    # Отсечение: в столбце и на обеих диагоналях клетки не должно быть ферзей
    if !cols[col] && !diags1[diag1] && !diags2[diag2]
      # Пробуем поставить ферзя на эту клетку
      state[row][col] = "Q"
      cols[col] = diags1[diag1] = diags2[diag2] = true
      # Переходим к следующей строке
      backtrack(row + 1, n, state, res, cols, diags1, diags2)
      # Возврат: освобождаем клетку
      state[row][col] = "#"
      cols[col] = diags1[diag1] = diags2[diag2] = false
    end
  end
end

### Решение задачи о n ферзях ###
def n_queens(n)
  # Создаём доску n*n, где 'Q' обозначает ферзя, а '#' — пустую клетку
  state = Array.new(n) { Array.new(n, "#") }
  cols = Array.new(n, false) # Отмечаем столбцы, занятые ферзями
  diags1 = Array.new(2 * n - 1, false) # Отмечаем прямые диагонали, занятые ферзями
  diags2 = Array.new(2 * n - 1, false) # Отмечаем обратные диагонали, занятые ферзями
  res = []
  backtrack(0, n, state, res, cols, diags1, diags2)

  res
end

### Основная программа ###
if __FILE__ == $0
  n = 4
  res = n_queens(n)

  puts "Длина стороны доски: #{n}"
  puts "Число расстановок ферзей: #{res.length}."

  for state in res
    puts "--------------------"
    for row in state
      p row
    end
  end
end
