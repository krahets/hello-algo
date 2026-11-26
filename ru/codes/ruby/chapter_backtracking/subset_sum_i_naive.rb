=begin
File: subset_sum_i_naive.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Поиск с возвратом: сумма подмножества I ###
def backtrack(state, target, total, choices, res)
  # Если сумма подмножества равна target, сохраняем решение
  if total == target
    res << state.dup
    return
  end

  # Перебираем все варианты
  for i in 0...choices.length
    # Отсечение: если сумма подмножества превысит target, пропускаем этот вариант
    next if total + choices[i] > target
    # Пробуем вариант и обновляем сумму элементов total
    state << choices[i]
    # Переходим к следующему выбору
    backtrack(state, target, total + choices[i], choices, res)
    # Возврат: отменяем выбор и восстанавливаем прежнее состояние
    state.pop
  end
end

### Задача о сумме подмножества I (с повторяющимися подмножествами)###
def subset_sum_i_naive(nums, target)
  state = [] # Состояние (подмножество)
  total = 0 # Сумма подмножества
  res = [] # Список результатов (список подмножеств)
  backtrack(state, target, total, nums, res)
  res
end

### Основная программа ###
if __FILE__ == $0
  nums = [3, 4, 5]
  target = 9
  res = subset_sum_i_naive(nums, target)

  puts "Исходный массив nums = #{nums}, target = #{target}"
  puts "Все подмножества с суммой #{target}: res = #{res}"
  puts "Обратите внимание: результат этого метода содержит повторяющиеся множества"
end
