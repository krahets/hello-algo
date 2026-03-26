=begin
File: deque.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver Code ###
if __FILE__ == $0
  # Инициализировать двустороннюю очередь
  # В Ruby нет встроенной двусторонней очереди, поэтому приходится использовать Array как двустороннюю очередь
  deque = []

  # Элемент помещается в очередь
  deque << 2
  deque << 5
  deque << 4
  # Обратите внимание: поскольку это массив, временная сложность метода Array#unshift равна O(n)
  deque.unshift(3)
  deque.unshift(1)
  puts "двусторонняя очередь deque = #{deque}"

  # Получить доступ к элементу
  peek_first = deque.first
  puts "элемент в голове очереди peek_first = #{peek_first}"
  peek_last = deque.last
  puts "элемент в хвосте очереди peek_last = #{peek_last}"

  # Извлечь элемент из очереди
  # Обратите внимание: поскольку это массив, временная сложность метода Array#shift равна O(n)
  pop_front = deque.shift
  puts "Элемент, извлеченный из головы очереди, pop_front = #{pop_front}, deque после извлечения из головы = #{deque}"
  pop_back = deque.pop
  puts "Элемент, извлеченный из хвоста очереди, pop_back = #{pop_back}, deque после извлечения из хвоста = #{deque}"

  # Получить длину двусторонней очереди
  size = deque.length
  puts "Длина двусторонней очереди size = #{size}"

  # Проверить, пуста ли двусторонняя очередь
  is_empty = size.zero?
  puts "двусторонняя очередьпуст ли = #{is_empty}"
end
