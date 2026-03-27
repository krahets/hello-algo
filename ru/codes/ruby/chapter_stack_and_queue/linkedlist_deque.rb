=begin
File: linkedlist_deque.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Узел двусвязного списка
class ListNode
  attr_accessor :val
  attr_accessor :next # Ссылка на узел-преемник
  attr_accessor :prev # Ссылка на узел-предшественник

  # ## Конструктор ###
  def initialize(val)
    @val = val
  end
end

# ## Двусторонняя очередь на основе двусвязного списка ###
class LinkedListDeque
  # ## Получение длины двусторонней очереди ###
  attr_reader :size

  # ## Конструктор ###
  def initialize
    @front = nil  # Головной узел front
    @rear = nil   # Хвостовой узел rear
    @size = 0     # Длина двусторонней очереди
  end

  # ## Проверка, пуста ли двусторонняя очередь ###
  def is_empty?
    size.zero?
  end

  # ## Операция добавления в очередь ###
  def push(num, is_front)
    node = ListNode.new(num)
    # Если связный список пуст, пусть front и rear оба указывают на node
    if is_empty?
      @front = @rear = node
    # Операция добавления в голову очереди
    elsif is_front
      # Добавить node в голову списка
      @front.prev = node
      node.next = @front
      @front = node # Обновить головной узел
    # Операция добавления в хвост очереди
    else
      # Добавить node в хвост списка
      @rear.next = node
      node.prev = @rear
      @rear = node # Обновить хвостовой узел
    end
    @size += 1 # Обновить длину очереди
  end

  # ## Добавление в голову очереди ###
  def push_first(num)
    push(num, true)
  end

  # ## Добавление в хвост очереди ###
  def push_last(num)
    push(num, false)
  end

  # ## Операция извлечения из очереди ###
  def pop(is_front)
    raise IndexError, 'двусторонняя очередь пуста' if is_empty?

    # Операция извлечения из головы очереди
    if is_front
      val = @front.val # Временно сохранить значение головного узла
      # Удалить головной узел
      fnext = @front.next
      unless fnext.nil?
        fnext.prev = nil
        @front.next = nil
      end
      @front = fnext # Обновить головной узел
    # Операция извлечения из хвоста очереди
    else
      val = @rear.val # Временно сохранить значение хвостового узла
      # Удалить хвостовой узел
      rprev = @rear.prev
      unless rprev.nil?
        rprev.next = nil
        @rear.prev = nil
      end
      @rear = rprev # Обновить хвостовой узел
    end
    @size -= 1 # Обновить длину очереди

    val
  end

  # ## Извлечение из головы очереди ###
  def pop_first
    pop(true)
  end

  # ## Извлечение из головы очереди ###
  def pop_last
    pop(false)
  end

  # ## Доступ к элементу в начале очереди ###
  def peek_first
    raise IndexError, 'двусторонняя очередь пуста' if is_empty?

    @front.val
  end

  # ## Доступ к элементу в хвосте очереди ###
  def peek_last
    raise IndexError, 'двусторонняя очередь пуста' if is_empty?

    @rear.val
  end

  # ## Вернуть массив для вывода ###
  def to_array
    node = @front
    res = Array.new(size, 0)
    for i in 0...size
      res[i] = node.val
      node = node.next
    end
    res
  end
end

### Driver Code ###
if __FILE__ == $0
  # Инициализация двусторонней очереди
  deque = LinkedListDeque.new
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
  puts "После добавления элемента 1 в голову deque = #{deque.to_array}"

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
