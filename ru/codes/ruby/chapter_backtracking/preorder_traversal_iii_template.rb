=begin
File: preorder_traversal_iii_template.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

# ## Проверка, является ли текущее состояние решением ###
def is_solution?(state)
  !state.empty? && state.last.val == 7
end

# ## Записать решение ###
def record_solution(state, res)
  res << state.dup
end

# ## Проверка допустимости этого выбора в текущем состоянии ###
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

  # Перебор всех вариантов выбора
  for choice in choices
    # Отсечение: проверить допустимость выбора
    if is_valid?(state, choice)
      # Попытка: сделать выбор и обновить состояние
      make_choice(state, choice)
      # Перейти к следующему выбору
      backtrack(state, [choice.left, choice.right], res)
      # Откат: отменить выбор и восстановить предыдущее состояние
      undo_choice(state, choice)
    end
  end
end

### Driver Code ###
if __FILE__ == $0
  root = arr_to_tree([1, 7, 3, 4, 5, 6, 7])
  puts "\nИнициализация двоичного дерева"
  print_tree(root)

  # Алгоритм бэктрекинга
  res = []
  backtrack([], [root], res)

  puts "\nВсе пути от корня к узлу 7, в которых путь не содержит узлов со значением 3"
  for path in res
    p path.map { |node| node.val }
  end
end
