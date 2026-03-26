=begin
File: queue.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver Code ###
if __FILE__ == $0
  # Инициализировать очередь
  # У встроенной очереди Ruby (Thread::Queue) нет методов peek и обхода, поэтому Array можно использовать как очередь
  queue = []

  # Поместить элемент в очередь
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  puts "очередь queue = #{queue}"

  # обратиться кочередьэлемент
  peek = queue.first
  puts "элемент в голове очереди peek = #{peek}"

  # Извлечь элемент из очереди
  # Обратите внимание: поскольку это массив, временная сложность метода Array#shift равна O(n)
  pop = queue.shift
  puts "Элемент, извлеченный из очереди, pop = #{pop}"
  puts "queue после извлечения = #{queue}"

  # Получить длину очереди
  size = queue.length
  puts "Длина очереди size = #{size}"

  # Проверить, пуста ли очередь
  is_empty = queue.empty?
  puts "очередьпуст ли = #{is_empty}"
end
