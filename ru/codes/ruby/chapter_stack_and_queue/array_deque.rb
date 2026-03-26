=begin
File: array_deque.rb
Created Time: 2024-04-05
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Двусторонняя очередь на основе циклического массива ###
class ArrayDeque
  # ## Получить длину двусторонней очереди ###
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

  # ## Проверить, пуста ли двусторонняя очередь ###
  def is_empty?
    size.zero?
  end

  # ## Поместить в голову очереди ###
  def push_first(num)
    if size == capacity
      puts 'двусторонняя очередьзаполнен'
      return
    end

    # Указатель головы очереди сдвигается на одну позицию влево
    # Операция взятия по модулю позволяет front после выхода за начало массива вернуться к его концу
    @front = index(@front - 1)
    # Добавить num в голову очереди
    @nums[@front] = num
    @size += 1
  end

  # ## Поместить в хвост очереди ###
  def push_last(num)
    if size == capacity
      puts 'двусторонняя очередьзаполнен'
      return
    end

    # Вычислить указатель хвоста, указывающий на индекс за последним элементом
    rear = index(@front + size)
    # Добавить num в конец очереди
    @nums[rear] = num
    @size += 1
  end

  # ## Извлечь из головы очереди ###
  def pop_first
    num = peek_first
    # Указатель головы очереди сдвигается на одну позицию вперед
    @front = index(@front + 1)
    @size -= 1
    num
  end

  # ## Извлечь из хвоста очереди ###
  def pop_last
    num = peek_last
    @size -= 1
    num
  end

  # ## Получить элемент в начале очереди ###
  def peek_first
    raise IndexError, 'двусторонняя очередьпуст' if is_empty?

    @nums[@front]
  end

  # ## Обратиться к элементу в хвосте очереди ###
  def peek_last
    raise IndexError, 'двусторонняя очередьпуст' if is_empty?

    # Вычислить индекс хвостового элемента
    last = index(@front + size - 1)
    @nums[last]
  end

  # ## Вернуть массив для печати ###
  def to_array
    # Преобразовать только элементы списка в пределах действительной длины
    res = []
    for i in 0...size
      res << @nums[index(@front + i)]
    end
    res
  end

  private

  # ## Вычислить индекс циклического массива ###
  def index(i)
    # Сделать начало и конец массива циклически связанными с помощью операции взятия по модулю
    # Когда i выходит за конец массива, он возвращается к началу
    # Когда i выходит за начало массива, он возвращается к концу
    (i + capacity) % capacity
  end
end

### Driver Code ###
if __FILE__ == $0
  # Инициализировать двустороннюю очередь
  deque = ArrayDeque.new(10)
  deque.push_last(3)
  deque.push_last(2)
  deque.push_last(5)
  puts "двусторонняя очередь deque = #{deque.to_array}"

  # Получить доступ к элементу
  peek_first = deque.peek_first
  puts "элемент в голове очереди peek_first = #{peek_first}"
  peek_last = deque.peek_last
  puts "элемент в хвосте очереди peek_last = #{peek_last}"

  # Поместить элемент в очередь
  deque.push_last(4)
  puts "После помещения элемента 4 в хвост очереди deque = #{deque.to_array}"
  deque.push_first(1)
  puts "После помещения элемента 1 в хвост очереди deque = #{deque.to_array}"

  # Извлечь элемент из очереди
  pop_last = deque.pop_last
  puts "Элемент, извлеченный из хвоста очереди, = #{pop_last}, deque после извлечения из хвоста = #{deque.to_array}"
  pop_first = deque.pop_first
  puts "Элемент, извлеченный из хвоста очереди, = #{pop_first}, deque после извлечения из хвоста = #{deque.to_array}"

  # Получить длину двусторонней очереди
  size = deque.size
  puts "Длина двусторонней очереди size = #{size}"

  # Проверить, пуста ли двусторонняя очередь
  is_empty = deque.is_empty?
  puts "двусторонняя Очередь пуста: #{is_empty}"
end
