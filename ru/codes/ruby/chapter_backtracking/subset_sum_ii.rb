=begin
File: subset_sum_ii.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Поиск с возвратом: сумма подмножества II ###
def backtrack(state, target, choices, start, res)
  # Если сумма подмножества равна target, сохраняем решение
  if target.zero?
    res << state.dup
    return
  end

  # Перебираем все варианты
  # Отсечение 2: начинаем перебор с start, чтобы не получать одинаковые подмножества
  # Отсечение 3: начинаем перебор с start, чтобы не брать один и тот же элемент дважды
  for i in start...choices.length
    # Отсечение 1: если сумма подмножества превышает target, выходим из цикла
    # Массив отсортирован: следующие элементы не меньше текущего, поэтому сумма тоже превысит target
    break if target - choices[i] < 0
    # Отсечение 4: если значение совпало с уже проверенным на этом шаге соседом слева, пропускаем повторную ветвь
    next if i > start && choices[i] == choices[i - 1]
    # Пробуем вариант и обновляем target и start
    state << choices[i]
    # Переходим к следующему выбору
    backtrack(state, target - choices[i], choices, i + 1, res)
    # Возврат: отменяем выбор и восстанавливаем прежнее состояние
    state.pop
  end
end

### Задача о сумме подмножества II ###
def subset_sum_ii(nums, target)
  state = [] # Состояние (подмножество)
  nums.sort! # Сортируем nums
  start = 0 # Начальная позиция перебора
  res = [] # Список результатов (список подмножеств)
  backtrack(state, target, nums, start, res)
  res
end

### Основная программа ###
if __FILE__ == $0
  nums = [4, 4, 5]
  target = 9
  res = subset_sum_ii(nums, target)

  puts "Исходный массив nums = #{nums}, target = #{target}"
  puts "Все подмножества с суммой #{target}: res = #{res}"
end
