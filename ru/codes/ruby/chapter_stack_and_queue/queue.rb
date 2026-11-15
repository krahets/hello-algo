=begin
File: queue.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver Code ###
if __FILE__ == $0
  # [region]{init_queue}
  # Инициализировать очередь
  # Во встроенной очереди Ruby (Thread::Queue) нет методов peek и обхода, поэтому Array можно использовать как очередь
  queue = []
  # [endregion]{init_queue}

  # [region]{push}
  # Добавление элемента в очередь
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  # [endregion]{push}
  puts "Очередь queue = #{queue}"

  # [region]{peek}
  # Обратиться к элементу очереди
  peek = queue.first
  # [endregion]{peek}
  puts "Первый элемент peek = #{peek}"

  # [region]{pop}
  # Элемент извлекается из очереди
  # Обратите внимание: поскольку используется массив, временная сложность метода Array#shift равна O(n)
  pop = queue.shift
  # [endregion]{pop}
  puts "Извлеченный элемент pop = #{pop}"
  puts "queue после извлечения = #{queue}"

  # [region]{size}
  # Получение длины очереди
  size = queue.length
  # [endregion]{size}
  puts "Длина очереди size = #{size}"

  # [region]{is_empty}
  # Проверка, пуста ли очередь
  is_empty = queue.empty?
  # [endregion]{is_empty}
  puts "Пуста ли очередь = #{is_empty}"
end
