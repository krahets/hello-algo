=begin
File: permutations_i.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Поиск с возвратом: перестановки I ###
def backtrack(state, choices, selected, res)
  # Когда длина текущей перестановки равна числу элементов, сохраняем решение
  if state.length == choices.length
    res << state.dup
    return
  end

  # Перебираем все варианты
  choices.each_with_index do |choice, i|
    # Отсечение: нельзя выбирать один элемент дважды
    unless selected[i]
      # Пробуем вариант и обновляем состояние
      selected[i] = true
      state << choice
      # Переходим к следующему выбору
      backtrack(state, choices, selected, res)
      # Возврат: отменяем выбор и восстанавливаем прежнее состояние
      selected[i] = false
      state.pop
    end
  end
end

### Перестановки I ###
def permutations_i(nums)
  res = []
  backtrack([], nums, Array.new(nums.length, false), res)
  res
end

### Основная программа ###
if __FILE__ == $0
  nums = [1, 2, 3]

  res = permutations_i(nums)

  puts "Исходный массив nums = #{nums}"
  puts "Все перестановки res = #{res}"
end
