=begin
File: stack.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Пример использования ###
if __FILE__ == $0
  # Инициализировать стек
  # В Ruby нет встроенного класса стека, поэтому в качестве стека можно использовать Array
  stack = []

  # Поместить элементы в стек
  stack << 1
  stack << 3
  stack << 2
  stack << 5
  stack << 4
  puts "Стек stack = #{stack}"

  # Посмотреть элемент на вершине стека
  peek = stack.last
  puts "Элемент на вершине стека peek = #{peek}"

  # Снять элемент со стека
  pop = stack.pop
  puts "Снятый элемент pop = #{pop}"
  puts "После снятия элемента stack = #{stack}"

  # Получить размер стека
  size = stack.length
  puts "Размер стека size = #{size}"

  # Проверить, пуст ли стек
  is_empty = stack.empty?
  puts "Стек пуст = #{is_empty}"
end
