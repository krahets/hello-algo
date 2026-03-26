=begin
File: array_queue.rb
Created Time: 2024-04-05
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Очередь на основе циклического массива ###
class ArrayQueue
  # ## Получить длину очереди ###
  attr_reader :size

  # ## Конструктор ###
  def initialize(size)
    @nums = Array.new(size, 0) # Массив для хранения элементов очереди
    @front = 0 # Указатель front, указывающий на первый элемент очереди
    @size = 0 # Длина очереди
  end

  # ## Получить вместимость очереди ###
  def capacity
    @nums.length
  end

  # ## Проверить, пуста ли очередь ###
  def is_empty?
    size.zero?
  end

  # ## помещение в очередь ###
  def push(num)
    raise IndexError, 'очередьзаполнен' if size == capacity

    # Вычислить указатель хвоста очереди, указывающий на индекс хвоста + 1
    # Операция взятия по модулю позволяет rear после выхода за конец массива вернуться к его началу
    rear = (@front + size) % capacity
    # Добавить num в конец очереди
    @nums[rear] = num
    @size += 1
  end

  # ## извлечение из очереди ###
  def pop
    num = peek
    # Указатель головы очереди сдвигается на одну позицию вперед; если он выходит за конец, то возвращается в начало массива
    @front = (@front + 1) % capacity
    @size -= 1
    num
  end

  # ## Получить элемент в начале очереди ###
  def peek
    raise IndexError, 'очередьпуст' if is_empty?

    @nums[@front]
  end

  # ## Вернуть список для вывода ###
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

### Driver Code ###
if __FILE__ == $0
  # Инициализировать очередь
  queue = ArrayQueue.new(10)

  # Поместить элемент в очередь
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  puts "очередь queue = #{queue.to_array}"

  # Получить элемент в начале очереди
  peek = queue.peek
  puts "элемент в голове очереди peek = #{peek}"

  # Извлечь элемент из очереди
  pop = queue.pop
  puts "Элемент, извлеченный из очереди, pop = #{pop}"
  puts "queue после извлечения = #{queue.to_array}"

  # Получить длину очереди
  size = queue.size
  puts "Длина очереди size = #{size}"

  # Проверить, пуста ли очередь
  is_empty = queue.is_empty?
  puts "очередьпуст ли = #{is_empty}"

  # Проверить кольцевой массив
  for i in 0...10
    queue.push(i)
    queue.pop
    puts "После #{i}-й итерации enqueue + dequeue queue = #{queue.to_array}"
  end
end
