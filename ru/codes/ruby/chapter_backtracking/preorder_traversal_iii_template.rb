=begin
File: preorder_traversal_iii_template.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### Проверяем, является ли текущее состояние решением ###
def is_solution?(state)
  !state.empty? && state.last.val == 7
end

### Сохраняем решение ###
def record_solution(state, res)
  res << state.dup
end

### Проверяем, допустим ли выбор в текущем состоянии ###
def is_valid?(state, choice)
  choice && choice.val != 3
end

### Обновляем состояние ###
def make_choice(state, choice)
  state << choice
end

### Восстанавливаем состояние ###
def undo_choice(state, choice)
  state.pop
end

### Поиск с возвратом: пример 3 ###
def backtrack(state, choices, res)
  # Проверяем, найдено ли решение
  record_solution(state, res) if is_solution?(state)

  # Перебираем все варианты
  for choice in choices
    # Отсечение: проверяем допустимость выбора
    if is_valid?(state, choice)
      # Пробуем вариант и обновляем состояние
      make_choice(state, choice)
      # Переходим к следующему выбору
      backtrack(state, [choice.left, choice.right], res)
      # Возврат: отменяем выбор и восстанавливаем прежнее состояние
      undo_choice(state, choice)
    end
  end
end

### Основная программа ###
if __FILE__ == $0
  root = arr_to_tree([1, 7, 3, 4, 5, 6, 7])
  puts "\nСоздаём двоичное дерево"
  print_tree(root)

  # Поиск с возвратом
  res = []
  backtrack([], [root], res)

  puts "\nВыводим все пути от корня до узлов со значением 7 без узлов со значением 3"
  for path in res
    p path.map { |node| node.val }
  end
end
