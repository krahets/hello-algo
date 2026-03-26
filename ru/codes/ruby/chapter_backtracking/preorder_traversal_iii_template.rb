=begin
File: preorder_traversal_iii_template.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

# ## Проверить, является ли текущее состояние решением ###
def is_solution?(state)
  !state.empty? && state.last.val == 7
end

# ## Записать решение ###
def record_solution(state, res)
  res << state.dup
end

# ## Проверить, допустим ли этот выбор в текущем состоянии ###
def is_valid?(state, choice)
  choice && choice.val != 3
end

# ## Обновить состояние ###
def make_choice(state, choice)
  state << choice
end

# ## Восстановить состояние ###
def undo_choice(state, choice)
  state.pop
end

# ## Алгоритм бэктрекинга: пример 3 ###
def backtrack(state, choices, res)
  # Проверить, является ли текущее состояние решением
  record_solution(state, res) if is_solution?(state)

  # Перебрать все варианты выбора
  for choice in choices
    # Отсечение: проверить, допустим ли текущий выбор
    if is_valid?(state, choice)
      # Попытка: сделать выбор и обновить состояние
      make_choice(state, choice)
      # Перейти к следующему варианту выбора
      backtrack(state, [choice.left, choice.right], res)
      # Откат: отменить выбор и восстановить предыдущее состояние
      undo_choice(state, choice)
    end
  end
end

### Driver Code ###
if __FILE__ == $0
  root = arr_to_tree([1, 7, 3, 4, 5, 6, 7])
  puts "\nИнициализировать двоичное дерево"
  print_tree(root)

  # Алгоритм бэктрекинга
  res = []
  backtrack([], [root], res)

  puts "\nВывести все пути от корня до узла 7, при этом путь не должен содержать узлы со значением 3"
  for path in res
    p path.map { |node| node.val }
  end
end
