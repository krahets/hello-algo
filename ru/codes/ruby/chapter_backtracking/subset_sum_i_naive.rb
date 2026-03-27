=begin
File: subset_sum_i_naive.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Алгоритм бэктрекинга: сумма подмножеств I ###
def backtrack(state, target, total, choices, res)
  # Если сумма подмножества равна target, записать решение
  if total == target
    res << state.dup
    return
  end

  # Перебор всех вариантов выбора
  for i in 0...choices.length
    # Отсечение: если сумма подмножества превышает target, пропустить этот выбор
    next if total + choices[i] > target
    # Попытка: сделать выбор и обновить элемент и total
    state << choices[i]
    # Перейти к следующему выбору
    backtrack(state, target, total + choices[i], choices, res)
    # Откат: отменить выбор и восстановить предыдущее состояние
    state.pop
  end
end

# ## Решить задачу суммы подмножеств I (с повторяющимися подмножествами) ###
def subset_sum_i_naive(nums, target)
  state = [] # Состояние (подмножество)
  total = 0 # Сумма подмножеств
  res = [] # Список результатов (список подмножеств)
  backtrack(state, target, total, nums, res)
  res
end

### Driver Code ###
if __FILE__ == $0
  nums = [3, 4, 5]
  target = 9
  res = subset_sum_i_naive(nums, target)

  puts "Входной массив nums = #{nums}, target = #{target}"
  puts "Все подмножества с суммой #{target}: res = #{res}"
  puts "Обратите внимание: результат этого метода содержит повторяющиеся множества"
end
