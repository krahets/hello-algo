=begin
File: queue.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Пример использования ###
if __FILE__ == $0
  # Инициализировать очередь
  # У встроенной очереди Ruby (Thread::Queue) нет методов для просмотра первого элемента и обхода очереди, поэтому в качестве очереди можно использовать Array
  queue = []

  # Добавить элементы в очередь
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  puts "Очередь queue = #{queue}"

  # Посмотреть первый элемент очереди
  peek = queue.first
  puts "Первый элемент очереди peek = #{peek}"

  # Извлечь элемент из очереди
  # Поскольку Array — массив, временная сложность метода Array#shift составляет O(n)
  pop = queue.shift
  puts "Извлечённый элемент pop = #{pop}"
  puts "После извлечения queue = #{queue}"

  # Получить длину очереди
  size = queue.length
  puts "Длина очереди size = #{size}"

  # Проверить, пуста ли очередь
  is_empty = queue.empty?
  puts "Очередь пуста = #{is_empty}"
end
