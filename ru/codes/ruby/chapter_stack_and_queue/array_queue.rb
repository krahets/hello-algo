=begin
File: array_queue.rb
Created Time: 2024-04-05
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Очередь на основе кольцевого массива ###
class ArrayQueue
  # ## Получение длины очереди ###
  attr_reader :size

  # ## Конструктор ###
  def initialize(size)
    @nums = Array.new(size, 0) # Массив для хранения элементов очереди
    @front = 0 # Указатель head, указывающий на первый элемент очереди
    @size = 0 # Длина очереди
  end

  # ## Получить вместимость очереди ###
  def capacity
    @nums.length
  end

  # ## Проверка, пуста ли очередь ###
  def is_empty?
    size.zero?
  end

  # ## Добавление в очередь ###
  def push(num)
    raise IndexError, 'очередь заполнена' if size == capacity

    # Вычислить указатель хвоста, указывающий на индекс хвоста + 1
    # С помощью операции взятия по модулю вернуть rear к началу после выхода за конец массива
    rear = (@front + size) % capacity
    # Добавить num в хвост очереди
    @nums[rear] = num
    @size += 1
  end

  # ## Извлечение из очереди ###
  def pop
    num = peek
    # Указатель head сдвигается на одну позицию назад; если он выходит за конец, то возвращается в начало массива
    @front = (@front + 1) % capacity
    @size -= 1
    num
  end

  # ## Доступ к элементу в начале очереди ###
  def peek
    raise IndexError, 'очередь пуста' if is_empty?

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
  # Инициализация очереди
  queue = ArrayQueue.new(10)

  # Добавление элемента в очередь
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  puts "Очередь queue = #{queue.to_array}"

  # Доступ к элементу в начале очереди
  peek = queue.peek
  puts "Первый элемент peek = #{peek}"

  # Извлечение элемента из очереди
  pop = queue.pop
  puts "Извлеченный элемент pop = #{pop}"
  puts "queue после извлечения = #{queue.to_array}"

  # Получение длины очереди
  size = queue.size
  puts "Длина очереди size = #{size}"

  # Проверка, пуста ли очередь
  is_empty = queue.is_empty?
  puts "Пуста ли очередь = #{is_empty}"

  # Проверка кольцевого массива
  for i in 0...10
    queue.push(i)
    queue.pop
    puts "После #{i}-го цикла enqueue + dequeue queue = #{queue.to_array}"
  end
end
