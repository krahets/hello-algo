=begin
File: subset_sum_i.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Алгоритм бэктрекинга: сумма подмножества I ###
def backtrack(state, target, choices, start, res)
  # Если сумма подмножества равна target, записать решение
  if target.zero?
    res << state.dup
    return
  end
  # Обойти все варианты выбора
  # Отсечение 2: начинать обход с start, чтобы избежать генерации дублирующихся подмножеств
  for i in start...choices.length
    # Отсечение 1: если сумма подмножества превышает target, сразу завершить цикл
    # Это связано с тем, что массив уже отсортирован, последующие элементы больше, поэтому сумма подмножества обязательно превысит target
    break if target - choices[i] < 0
    # Попытка: сделать выбор и обновить target, start
    state << choices[i]
    # Перейти к следующему варианту выбора
    backtrack(state, target - choices[i], choices, i, res)
    # Откат: отменить выбор и восстановить предыдущее состояние
    state.pop
  end
end

# ## Решить задачу суммы подмножества I ###
def subset_sum_i(nums, target)
  state = [] # Состояние (подмножество)
  nums.sort! # Отсортировать nums
  start = 0 # Обход начальной вершины
  res = [] # Список результатов (список подмножеств)
  backtrack(state, target, nums, start, res)
  res
end

### Driver Code ###
if __FILE__ == $0
  nums = [3, 4, 5]
  target = 9
  res = subset_sum_i(nums, target)

  puts "Входмассив = #{nums}, target = #{target}"
  puts "Все подмножества с суммой #{target}: #{res}"
end
