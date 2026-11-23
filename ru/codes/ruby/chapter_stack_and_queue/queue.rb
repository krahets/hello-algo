=begin
File: queue.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver Code ###
if __FILE__ == $0
  # Инициализировать очередь
  # Во встроенной очереди Ruby (Thread::Queue) нет методов peek и обхода, поэтому Array можно использовать как очередь
  queue = []

  # Добавление элемента в очередь
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  puts "Очередь queue = #{queue}"

  # Обратиться к элементу очереди
  peek = queue.first
  puts "Первый элемент peek = #{peek}"

  # Элемент извлекается из очереди
  # Обратите внимание: поскольку используется массив, временная сложность метода Array#shift равна O(n)
  pop = queue.shift
  puts "Извлеченный элемент pop = #{pop}"
  puts "queue после извлечения = #{queue}"

  # Получение длины очереди
  size = queue.length
  puts "Длина очереди size = #{size}"

  # Проверка, пуста ли очередь
  is_empty = queue.empty?
  puts "Пуста ли очередь = #{is_empty}"
end
