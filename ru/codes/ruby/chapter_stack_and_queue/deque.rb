=begin
File: deque.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver Code ###
if __FILE__ == $0
  # Инициализировать двустороннюю очередь
  # В Ruby нет встроенной двусторонней очереди, поэтому Array можно использовать как двустороннюю очередь
  deque = []

  # Элемент помещается в очередь
  deque << 2
  deque << 5
  deque << 4
  # Обратите внимание: поскольку используется массив, временная сложность метода Array#unshift равна O(n)
  deque.unshift(3)
  deque.unshift(1)
  puts "Двусторонняя очередь deque = #{deque}"

  # Доступ к элементу
  peek_first = deque.first
  puts "Первый элемент peek_first = #{peek_first}"
  peek_last = deque.last
  puts "Последний элемент peek_last = #{peek_last}"

  # Элемент извлекается из очереди
  # Обратите внимание: поскольку используется массив, временная сложность метода Array#shift равна O(n)
  pop_front = deque.shift
  puts "Извлечен элемент из головы pop_front = #{pop_front}, deque после извлечения из головы = #{deque}"
  pop_back = deque.pop
  puts "Извлечен элемент из хвоста pop_back = #{pop_back}, deque после извлечения из хвоста = #{deque}"

  # Получение длины двусторонней очереди
  size = deque.length
  puts "Длина двусторонней очереди size = #{size}"

  # Проверка, пуста ли двусторонняя очередь
  is_empty = size.zero?
  puts "Пуста ли двусторонняя очередь = #{is_empty}"
end
