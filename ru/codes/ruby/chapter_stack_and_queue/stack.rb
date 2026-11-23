=begin
File: stack.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver Code ###
if __FILE__ == $0
  # Инициализировать стек
  # В Ruby нет встроенного класса стека, поэтому Array можно использовать как стек
  stack = []

  # Помещение элемента в стек
  stack << 1
  stack << 3
  stack << 2
  stack << 5
  stack << 4
  puts "Стек stack = #{stack}"

  # Доступ к верхнему элементу стека
  peek = stack.last
  puts "Верхний элемент peek = #{peek}"

  # Извлечение элемента из стека
  pop = stack.pop
  puts "Извлеченный элемент pop = #{pop}"
  puts "stack после извлечения = #{stack}"

  # Получение длины стека
  size = stack.length
  puts "Длина стека size = #{size}"

  # Проверка на пустоту
  is_empty = stack.empty?
  puts "Пуст ли стек = #{is_empty}"
end
