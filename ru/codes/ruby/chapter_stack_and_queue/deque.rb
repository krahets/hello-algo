=begin
File: deque.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Пример использования ###
if __FILE__ == $0
  # Инициализировать дек
  # В Ruby нет встроенного дека, поэтому его приходится реализовывать с помощью Array
  deque = []

  # Добавить элементы в дек
  deque << 2
  deque << 5
  deque << 4
  # Поскольку Array — массив, временная сложность метода Array#unshift составляет O(n)
  deque.unshift(3)
  deque.unshift(1)
  puts "Дек deque = #{deque}"

  # Посмотреть первый и последний элементы
  peek_first = deque.first
  puts "Первый элемент дека peek_first = #{peek_first}"
  peek_last = deque.last
  puts "Последний элемент дека peek_last = #{peek_last}"

  # Извлечь элементы из дека
  # Поскольку Array — массив, временная сложность метода Array#shift составляет O(n)
  pop_front = deque.shift
  puts "Извлечённый первый элемент pop_front = #{pop_front}, после извлечения deque = #{deque}"
  pop_back = deque.pop
  puts "Извлечённый последний элемент pop_back = #{pop_back}, после извлечения deque = #{deque}"

  # Получить длину дека
  size = deque.length
  puts "Длина дека size = #{size}"

  # Проверить, пуст ли дек
  is_empty = size.zero?
  puts "Дек пуст = #{is_empty}"
end
