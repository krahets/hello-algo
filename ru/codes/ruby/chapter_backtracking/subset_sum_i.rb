=begin
File: subset_sum_i.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Алгоритм бэктрекинга: сумма подмножеств I ###
def backtrack(state, target, choices, start, res)
  # Если сумма подмножества равна target, записать решение
  if target.zero?
    res << state.dup
    return
  end
  # Обойти все варианты выбора
  # Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
  for i in start...choices.length
    # Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
    # Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
    break if target - choices[i] < 0
    # Попытка: сделать выбор и обновить target и start
    state << choices[i]
    # Перейти к следующему выбору
    backtrack(state, target - choices[i], choices, i, res)
    # Откат: отменить выбор и восстановить предыдущее состояние
    state.pop
  end
end

# ## Решить задачу суммы подмножеств I ###
def subset_sum_i(nums, target)
  state = [] # Состояние (подмножество)
  nums.sort! # Отсортировать nums
  start = 0 # Стартовая вершина обхода
  res = [] # Список результатов (список подмножеств)
  backtrack(state, target, nums, start, res)
  res
end

### Driver Code ###
if __FILE__ == $0
  nums = [3, 4, 5]
  target = 9
  res = subset_sum_i(nums, target)

  puts "Входной массив nums = #{nums}, target = #{target}"
  puts "Все подмножества с суммой #{target}: res = #{res}"
end
