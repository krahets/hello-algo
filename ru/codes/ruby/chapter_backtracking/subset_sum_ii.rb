=begin
File: subset_sum_ii.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Алгоритм бэктрекинга: сумма подмножеств II ###
def backtrack(state, target, choices, start, res)
  # Если сумма подмножества равна target, записать решение
  if target.zero?
    res << state.dup
    return
  end

  # Обойти все варианты выбора
  # Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
  # Отсечение 3: начинать обход с start, чтобы избежать повторного выбора одного и того же элемента
  for i in start...choices.length
    # Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
    # Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
    break if target - choices[i] < 0
    # Отсечение 4: если этот элемент равен элементу слева, значит ветвь поиска повторяется, ее нужно сразу пропустить
    next if i > start && choices[i] == choices[i - 1]
    # Попытка: сделать выбор и обновить target и start
    state << choices[i]
    # Перейти к следующему выбору
    backtrack(state, target - choices[i], choices, i + 1, res)
    # Откат: отменить выбор и восстановить предыдущее состояние
    state.pop
  end
end

# ## Решить задачу суммы подмножеств II ###
def subset_sum_ii(nums, target)
  state = [] # Состояние (подмножество)
  nums.sort! # Отсортировать nums
  start = 0 # Стартовая вершина обхода
  res = [] # Список результатов (список подмножеств)
  backtrack(state, target, nums, start, res)
  res
end

### Driver Code ###
if __FILE__ == $0
  nums = [4, 4, 5]
  target = 9
  res = subset_sum_ii(nums, target)

  puts "Входной массив nums = #{nums}, target = #{target}"
  puts "Все подмножества с суммой #{target}: res = #{res}"
end
