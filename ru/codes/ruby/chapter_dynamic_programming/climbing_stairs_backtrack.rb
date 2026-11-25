=begin
File: climbing_stairs_backtrack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Поиск с возвратом ###
def backtrack(choices, state, n, res)
  # На ступени n увеличить число способов на 1
  res[0] += 1 if state == n
  # Перебрать все варианты
  for choice in choices
    # Отсечь шаги за ступень n
    next if state + choice > n

    # Сделать выбор и обновить состояние
    backtrack(choices, state + choice, n, res)
  end
  # Отменить выбор
end

### Подъём по лестнице: поиск с возвратом ###
def climbing_stairs_backtrack(n)
  choices = [1, 2] # Можно подняться на 1 или 2 ступени
  state = 0 # Начать со ступени 0
  res = [0] # Хранить число способов в res[0]
  backtrack(choices, state, n, res)
  res.first
end

### Основная программа ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_backtrack(n)
  puts "Число способов подняться на лестницу из #{n} ступеней: #{res}."
end
