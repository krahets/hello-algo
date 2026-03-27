=begin
File: climbing_stairs_backtrack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Бэктрекинг ###
def backtrack(choices, state, n, res)
  # Когда подъем достигает n-й ступени, число вариантов увеличивается на 1
  res[0] += 1 if state == n
  # Перебор всех вариантов выбора
  for choice in choices
    # Отсечение: нельзя выходить за n-ю ступень
    next if state + choice > n

    # Попытка: сделать выбор и обновить состояние
    backtrack(choices, state + choice, n, res)
  end
  # Откат
end

# ## Подъем по лестнице: бэктрекинг ###
def climbing_stairs_backtrack(n)
  choices = [1, 2] # Можно подняться на 1 или 2 ступени
  state = 0 # Начать подъем с 0-й ступени
  res = [0] # Использовать res[0] для хранения числа решений
  backtrack(choices, state, n, res)
  res.first
end

### Driver Code ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_backtrack(n)
  puts "Количество способов подняться по лестнице из #{n} ступеней: #{res}"
end
