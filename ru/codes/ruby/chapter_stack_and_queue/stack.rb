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

  # Поместить элемент в стек
  stack << 1
  stack << 3
  stack << 2
  stack << 5
  stack << 4
  puts "стек stack = #{stack}"

  # Получить верхний элемент стека
  peek = stack.last
  puts "вершина стекаэлемент peek = #{peek}"

  # Извлечь элемент из стека
  pop = stack.pop
  puts "извлечение из стекаэлемент pop = #{pop}"
  puts "извлечение из стекапосле stack = #{stack}"

  # Получить длину стека
  size = stack.length
  puts "Длина стека size = #{size}"

  # Проверить, пуста ли структура
  is_empty = stack.empty?
  puts "стекпуст ли = #{is_empty}"
end
