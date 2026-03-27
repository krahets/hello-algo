=begin
File: permutations_ii.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Алгоритм бэктрекинга: все перестановки II ###
def backtrack(state, choices, selected, res)
  # Когда длина состояния равна числу элементов, записать решение
  if state.length == choices.length
    res << state.dup
    return
  end

  # Перебор всех вариантов выбора
  duplicated = Set.new
  choices.each_with_index do |choice, i|
    # Отсечение: нельзя выбирать один и тот же элемент повторно и нельзя повторно выбирать равные элементы
    if !selected[i] && !duplicated.include?(choice)
      # Попытка: сделать выбор и обновить состояние
      duplicated.add(choice)
      selected[i] = true
      state << choice
      # Перейти к следующему выбору
      backtrack(state, choices, selected, res)
      # Откат: отменить выбор и восстановить предыдущее состояние
      selected[i] = false
      state.pop
    end
  end
end

# ## Все перестановки II ###
def permutations_ii(nums)
  res = []
  backtrack([], nums, Array.new(nums.length, false), res)
  res
end

### Driver Code ###
if __FILE__ == $0
  nums = [1, 2, 2]

  res = permutations_ii(nums)

  puts "Входной массив nums = #{nums}"
  puts "Все перестановки res = #{res}"
end
