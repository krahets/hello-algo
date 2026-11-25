=begin
File: permutations_ii.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require 'set'

### Поиск с возвратом: перестановки II ###
def backtrack(state, choices, selected, res)
  # Когда длина текущей перестановки равна числу элементов, сохраняем решение
  if state.length == choices.length
    res << state.dup
    return
  end

  # Перебираем все варианты
  duplicated = Set.new
  choices.each_with_index do |choice, i|
    # Отсечение: нельзя повторно брать тот же элемент или пробовать на этом уровне то же значение
    if !selected[i] && !duplicated.include?(choice)
      # Пробуем вариант и обновляем состояние
      duplicated.add(choice)
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

### Перестановки II ###
def permutations_ii(nums)
  res = []
  backtrack([], nums, Array.new(nums.length, false), res)
  res
end

### Основная программа ###
if __FILE__ == $0
  nums = [1, 2, 2]

  res = permutations_ii(nums)

  puts "Исходный массив nums = #{nums}"
  puts "Все перестановки res = #{res}"
end
