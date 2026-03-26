=begin
File: climbing_stairs_backtrack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## бэктрекинг ###
def backtrack(choices, state, n, res)
  # Когда подъем достигает n-й ступени, число решений увеличивается на 1
  res[0] += 1 if state == n
  # Перебрать все варианты выбора
  for choice in choices
    # Отсечение: не позволять выходить за пределы n-й ступени
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
  puts "Для подъема по лестнице из #{n} ступеней существует #{res} способов"
end
