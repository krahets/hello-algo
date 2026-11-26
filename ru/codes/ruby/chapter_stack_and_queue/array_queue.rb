=begin
File: array_queue.rb
Created Time: 2024-04-05
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Очередь на основе кольцевого массива ###
class ArrayQueue
  ### Получить длину очереди ###
  attr_reader :size

  ### Конструктор ###
  def initialize(size)
    @nums = Array.new(size, 0) # Массив для хранения элементов очереди
    @front = 0 # Индекс первого элемента очереди
    @size = 0 # Длина очереди
  end

  ### Получить ёмкость очереди ###
  def capacity
    @nums.length
  end

  ### Проверить, пуста ли очередь ###
  def is_empty?
    size.zero?
  end

  ### Добавить элемент в очередь ###
  def push(num)
    raise IndexError, 'Очередь заполнена' if size == capacity

    # Вычислить индекс вставки в конец очереди: прибавить 1 к индексу последнего элемента с учётом перехода по кругу
    # При выходе за конец массива операция взятия остатка возвращает rear в начало
    rear = (@front + size) % capacity
    # Добавить num в конец очереди
    @nums[rear] = num
    @size += 1
  end

  ### Извлечь элемент из очереди ###
  def pop
    num = peek
    # Сдвинуть индекс начала очереди на одну позицию вперёд. При выходе за конец массива перейти к его началу
    @front = (@front + 1) % capacity
    @size -= 1
    num
  end

  ### Посмотреть первый элемент очереди ###
  def peek
    raise IndexError, 'Очередь пуста' if is_empty?

    @nums[@front]
  end

  ### Вернуть массив для вывода ###
  def to_array
    res = Array.new(size, 0)
    j = @front

    for i in 0...size
      res[i] = @nums[j % capacity]
      j += 1
    end

    res
  end
end

### Пример использования ###
if __FILE__ == $0
  # Инициализировать очередь
  queue = ArrayQueue.new(10)

  # Добавить элементы в очередь
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  puts "Очередь queue = #{queue.to_array}"

  # Посмотреть первый элемент очереди
  peek = queue.peek
  puts "Первый элемент очереди peek = #{peek}"

  # Извлечь элемент из очереди
  pop = queue.pop
  puts "Извлечённый элемент pop = #{pop}"
  puts "После извлечения queue = #{queue.to_array}"

  # Получить длину очереди
  size = queue.size
  puts "Длина очереди size = #{size}"

  # Проверить, пуста ли очередь
  is_empty = queue.is_empty?
  puts "Очередь пуста = #{is_empty}"

  # Проверить работу кольцевого массива
  for i in 0...10
    queue.push(i)
    queue.pop
    puts "В цикле #{i} после добавления и извлечения элемента queue = #{queue.to_array}"
  end
end
