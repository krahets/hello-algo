=begin
File: linkedlist_deque.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Узел двусвязного списка
class ListNode
  attr_accessor :val
  attr_accessor :next # Ссылка на следующий узел
  attr_accessor :prev # Ссылка на предыдущий узел

  # ## Конструктор ###
  def initialize(val)
    @val = val
  end
end

# ## Двусторонняя очередь на основе двусвязного списка ###
class LinkedListDeque
  # ## Получить длину двусторонней очереди ###
  attr_reader :size

  # ## Конструктор ###
  def initialize
    @front = nil  # Головной узел front
    @rear = nil   # Хвостовой узел rear
    @size = 0     # Длина двусторонней очереди
  end

  # ## Проверить, пуста ли двусторонняя очередь ###
  def is_empty?
    size.zero?
  end

  # ## Операция помещения в очередь ###
  def push(num, is_front)
    node = ListNode.new(num)
    # Если связный список пуст, сделать так, чтобы и front, и rear указывали на node
    if is_empty?
      @front = @rear = node
    # Операция помещения в голову очереди
    elsif is_front
      # Добавить node в голову связного списка
      @front.prev = node
      node.next = @front
      @front = node # Обновить головной узел
    # Операция помещения в хвост очереди
    else
      # Добавить node в хвост связного списка
      @rear.next = node
      node.prev = @rear
      @rear = node # Обновить хвостовой узел
    end
    @size += 1 # Обновить длину очереди
  end

  # ## Поместить в голову очереди ###
  def push_first(num)
    push(num, true)
  end

  # ## Поместить в хвост очереди ###
  def push_last(num)
    push(num, false)
  end

  # ## Операция извлечения из очереди ###
  def pop(is_front)
    raise IndexError, 'двусторонняя очередьпуст' if is_empty?

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

  # ## Извлечь из головы очереди ###
  def pop_first
    pop(true)
  end

  # ## Извлечь из головы очереди ###
  def pop_last
    pop(false)
  end

  # ## Получить элемент в начале очереди ###
  def peek_first
    raise IndexError, 'двусторонняя очередьпуст' if is_empty?

    @front.val
  end

  # ## Обратиться к элементу в хвосте очереди ###
  def peek_last
    raise IndexError, 'двусторонняя очередьпуст' if is_empty?

    @rear.val
  end

  # ## Вернуть массив для печати ###
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
  # Инициализировать двустороннюю очередь
  deque = LinkedListDeque.new
  deque.push_last(3)
  deque.push_last(2)
  deque.push_last(5)
  puts "двусторонняя очередь deque = #{deque.to_array}"

  # Получить доступ к элементу
  peek_first = deque.peek_first
  puts "элемент в голове очереди peek_first = #{peek_first}"
  peek_last = deque.peek_last
  puts "элемент в голове очереди peek_last = #{peek_last}"

  # Поместить элемент в очередь
  deque.push_last(4)
  puts "После помещения элемента 4 в хвост очереди deque = #{deque.to_array}"
  deque.push_first(1)
  puts "После помещения элемента 1 в голову очереди deque = #{deque.to_array}"

  # Извлечь элемент из очереди
  pop_last = deque.pop_last
  puts "Элемент, извлеченный из хвоста очереди, = #{pop_last}, deque после извлечения из хвоста = #{deque.to_array}"
  pop_first = deque.pop_first
  puts "Элемент, извлеченный из головы очереди, = #{pop_first}, deque после извлечения из головы = #{deque.to_array}"

  # Получить длину двусторонней очереди
  size = deque.size
  puts "Длина двусторонней очереди size = #{size}"

  # Проверить, пуста ли двусторонняя очередь
  is_empty = deque.is_empty?
  puts "двусторонняя очередьпуст ли = #{is_empty}"
end
