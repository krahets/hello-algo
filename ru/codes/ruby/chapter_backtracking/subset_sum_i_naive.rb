=begin
File: subset_sum_i_naive.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Алгоритм бэктрекинга: сумма подмножества I ###
def backtrack(state, target, total, choices, res)
  # Если сумма подмножества равна target, записать решение
  if total == target
    res << state.dup
    return
  end

  # Перебрать все варианты выбора
  for i in 0...choices.length
    # Отсечение: если сумма подмножества превышает target, пропустить этот выбор
    next if total + choices[i] > target
    # Попытка: сделать выбор и обновить сумму элементов total
    state << choices[i]
    # Перейти к следующему варианту выбора
    backtrack(state, target, total + choices[i], choices, res)
    # Откат: отменить выбор и восстановить предыдущее состояние
    state.pop
  end
end

# ## Решить задачу суммы подмножества I (включая повторяющиеся подмножества)###
def subset_sum_i_naive(nums, target)
  state = [] # Состояние (подмножество)
  total = 0 # подмножествосумма
  res = [] # Список результатов (список подмножеств)
  backtrack(state, target, total, nums, res)
  res
end

### Driver Code ###
if __FILE__ == $0
  nums = [3, 4, 5]
  target = 9
  res = subset_sum_i_naive(nums, target)

  puts "Входмассив nums = #{nums}, target = #{target}"
  puts "Все подмножества с суммой #{target}: #{res}"
  puts "Обратите внимание: результат этого метода содержит повторяющиеся множества"
end
