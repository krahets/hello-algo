=begin
File: permutations_i.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Алгоритм бэктрекинга: все перестановки I ###
def backtrack(state, choices, selected, res)
  # Когда длина состояния равна числу элементов, записать решение
  if state.length == choices.length
    res << state.dup
    return
  end

  # Перебор всех вариантов выбора
  choices.each_with_index do |choice, i|
    # Отсечение: нельзя выбирать один и тот же элемент повторно
    unless selected[i]
      # Попытка: сделать выбор и обновить состояние
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

# ## Все перестановки I ###
def permutations_i(nums)
  res = []
  backtrack([], nums, Array.new(nums.length, false), res)
  res
end

### Driver Code ###
if __FILE__ == $0
  nums = [1, 2, 3]

  res = permutations_i(nums)

  puts "Входной массив nums = #{nums}"
  puts "Все перестановки res = #{res}"
end
