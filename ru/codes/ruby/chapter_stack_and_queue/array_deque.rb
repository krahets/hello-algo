=begin
File: array_deque.rb
Created Time: 2024-04-05
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Двусторонняя очередь на основе кольцевого массива ###
class ArrayDeque
  # ## Получение длины двусторонней очереди ###
  attr_reader :size

  # ## Конструктор ###
  def initialize(capacity)
    @nums = Array.new(capacity, 0)
    @front = 0
    @size = 0
  end

  # ## Получить вместимость двусторонней очереди ###
  def capacity
    @nums.length
  end

  # ## Проверка, пуста ли двусторонняя очередь ###
  def is_empty?
    size.zero?
  end

  # ## Добавление в голову очереди ###
  def push_first(num)
    if size == capacity
      puts 'Двусторонняя очередь заполнена'
      return
    end

    # Указатель головы сдвигается на одну позицию влево
    # С помощью операции взятия по модулю front после выхода за начало массива возвращается в хвост
    @front = index(@front - 1)
    # Добавить num в голову очереди
    @nums[@front] = num
    @size += 1
  end

  # ## Добавление в хвост очереди ###
  def push_last(num)
    if size == capacity
      puts 'Двусторонняя очередь заполнена'
      return
    end

    # Вычислить указатель хвоста, указывающий на индекс хвоста + 1
    rear = index(@front + size)
    # Добавить num в хвост очереди
    @nums[rear] = num
    @size += 1
  end

  # ## Извлечение из головы очереди ###
  def pop_first
    num = peek_first
    # Указатель головы сдвигается на одну позицию назад
    @front = index(@front + 1)
    @size -= 1
    num
  end

  # ## Извлечение из хвоста очереди ###
  def pop_last
    num = peek_last
    @size -= 1
    num
  end

  # ## Доступ к элементу в начале очереди ###
  def peek_first
    raise IndexError, 'двусторонняя очередь пуста' if is_empty?

    @nums[@front]
  end

  # ## Доступ к элементу в хвосте очереди ###
  def peek_last
    raise IndexError, 'двусторонняя очередь пуста' if is_empty?

    # Вычислить индекс хвостового элемента
    last = index(@front + size - 1)
    @nums[last]
  end

  # ## Вернуть массив для вывода ###
  def to_array
    # Преобразовывать только элементы списка в пределах фактической длины
    res = []
    for i in 0...size
      res << @nums[index(@front + i)]
    end
    res
  end

  private

  # ## Вычислить индекс в кольцевом массиве ###
  def index(i)
    # С помощью операции взятия по модулю соединить начало и конец массива
    # Когда i выходит за конец массива, он возвращается в начало
    # Когда i выходит за начало массива, он возвращается в конец
    (i + capacity) % capacity
  end
end

### Driver Code ###
if __FILE__ == $0
  # Инициализация двусторонней очереди
  deque = ArrayDeque.new(10)
  deque.push_last(3)
  deque.push_last(2)
  deque.push_last(5)
  puts "Двусторонняя очередь deque = #{deque.to_array}"

  # Доступ к элементу
  peek_first = deque.peek_first
  puts "Первый элемент peek_first = #{peek_first}"
  peek_last = deque.peek_last
  puts "Последний элемент peek_last = #{peek_last}"

  # Добавление элемента в очередь
  deque.push_last(4)
  puts "После добавления элемента 4 в хвост deque = #{deque.to_array}"
  deque.push_first(1)
  puts "После добавления элемента 1 в хвост deque = #{deque.to_array}"

  # Извлечение элемента из очереди
  pop_last = deque.pop_last
  puts "Извлечен элемент из хвоста = #{pop_last}, deque после извлечения из хвоста = #{deque.to_array}"
  pop_first = deque.pop_first
  puts "Извлечен элемент из головы = #{pop_first}, deque после извлечения из головы = #{deque.to_array}"

  # Получение длины двусторонней очереди
  size = deque.size
  puts "Длина двусторонней очереди size = #{size}"

  # Проверка, пуста ли двусторонняя очередь
  is_empty = deque.is_empty?
  puts "Пуста ли двусторонняя очередь = #{is_empty}"
end
