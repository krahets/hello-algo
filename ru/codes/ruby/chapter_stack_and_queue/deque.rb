=begin
File: deque.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver Code ###
if __FILE__ == $0
  # [region]{init_deque}
  # Инициализировать двустороннюю очередь
  # В Ruby нет встроенной двусторонней очереди, поэтому Array можно использовать как двустороннюю очередь
  deque = []
  # [endregion]{init_deque}

  # [region]{push}
  # Элемент помещается в очередь
  deque << 2
  deque << 5
  deque << 4
  # Обратите внимание: поскольку используется массив, временная сложность метода Array#unshift равна O(n)
  deque.unshift(3)
  deque.unshift(1)
  # [endregion]{push}
  puts "Двусторонняя очередь deque = #{deque}"

  # [region]{peek_first}
  # Доступ к элементу
  peek_first = deque.first
  # [endregion]{peek_first}
  puts "Первый элемент peek_first = #{peek_first}"
  # [region]{peek_last}
  peek_last = deque.last
  # [endregion]{peek_last}
  puts "Последний элемент peek_last = #{peek_last}"

  # [region]{pop_first}
  # Элемент извлекается из очереди
  # Обратите внимание: поскольку используется массив, временная сложность метода Array#shift равна O(n)
  pop_front = deque.shift
  # [endregion]{pop_first}
  puts "Извлечен элемент из головы pop_front = #{pop_front}, deque после извлечения из головы = #{deque}"
  # [region]{pop_last}
  pop_back = deque.pop
  # [endregion]{pop_last}
  puts "Извлечен элемент из хвоста pop_back = #{pop_back}, deque после извлечения из хвоста = #{deque}"

  # [region]{size}
  # Получение длины двусторонней очереди
  size = deque.length
  # [endregion]{size}
  puts "Длина двусторонней очереди size = #{size}"

  # [region]{is_empty}
  # Проверка, пуста ли двусторонняя очередь
  is_empty = size.zero?
  # [endregion]{is_empty}
  puts "Пуста ли двусторонняя очередь = #{is_empty}"
end
