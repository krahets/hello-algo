=begin
File: linkedlist_deque.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Узел двусвязного списка ###
class ListNode
  attr_accessor :val
  attr_accessor :next # Ссылка на следующий узел
  attr_accessor :prev # Ссылка на предыдущий узел

  ### Конструктор ###
  def initialize(val)
    @val = val
  end
end

### Двусторонняя очередь (дек) на основе двусвязного списка ###
class LinkedListDeque
  ### Получить длину дека ###
  attr_reader :size

  ### Конструктор ###
  def initialize
    @front = nil  # Первый узел front
    @rear = nil   # Последний узел rear
    @size = 0     # Длина дека
  end

  ### Проверить, пуст ли дек ###
  def is_empty?
    size.zero?
  end

  ### Добавить элемент в дек ###
  def push(num, is_front)
    node = ListNode.new(num)
    # Если связный список пуст, установить front и rear так, чтобы они указывали на node
    if is_empty?
      @front = @rear = node
    # Добавить элемент в начало дека
    elsif is_front
      # Добавить node в начало связного списка
      @front.prev = node
      node.next = @front
      @front = node # Обновить ссылку на первый узел
    # Добавить элемент в конец дека
    else
      # Добавить node в конец связного списка
      @rear.next = node
      node.prev = @rear
      @rear = node # Обновить ссылку на последний узел
    end
    @size += 1 # Обновить длину дека
  end

  ### Добавить элемент в начало дека ###
  def push_first(num)
    push(num, true)
  end

  ### Добавить элемент в конец дека ###
  def push_last(num)
    push(num, false)
  end

  ### Извлечь элемент из дека ###
  def pop(is_front)
    raise IndexError, 'Дек пуст' if is_empty?

    # Если длина дека равна 1, ссылки на первый и последний узлы указывают на один и тот же узел
    if @size == 1
      val = @front.val
      @front = nil
      @rear = nil
    # Извлечь элемент из начала дека
    elsif is_front
      val = @front.val # Временно сохранить значение первого узла
      # Удалить первый узел
      fnext = @front.next
      fnext.prev = nil
      @front.next = nil
      @front = fnext # Обновить ссылку на первый узел
    # Извлечь элемент из конца дека
    else
      val = @rear.val # Временно сохранить значение последнего узла
      # Удалить последний узел
      rprev = @rear.prev
      rprev.next = nil
      @rear.prev = nil
      @rear = rprev # Обновить ссылку на последний узел
    end
    @size -= 1 # Обновить длину дека

    val
  end

  ### Извлечь элемент из начала дека ###
  def pop_first
    pop(true)
  end

  ### Извлечь элемент из конца дека ###
  def pop_last
    pop(false)
  end

  ### Посмотреть первый элемент дека ###
  def peek_first
    raise IndexError, 'Дек пуст' if is_empty?

    @front.val
  end

  ### Посмотреть последний элемент дека ###
  def peek_last
    raise IndexError, 'Дек пуст' if is_empty?

    @rear.val
  end

  ### Вернуть массив для вывода ###
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

### Пример использования ###
if __FILE__ == $0
  # Инициализировать дек
  deque = LinkedListDeque.new
  deque.push_last(3)
  deque.push_last(2)
  deque.push_last(5)
  puts "Дек deque = #{deque.to_array}"

  # Посмотреть первый и последний элементы
  peek_first = deque.peek_first
  puts "Первый элемент дека peek_first = #{peek_first}"
  peek_last = deque.peek_last
  puts "Последний элемент дека peek_last = #{peek_last}"

  # Добавить элементы в дек
  deque.push_last(4)
  puts "После добавления 4 в конец дека deque = #{deque.to_array}"
  deque.push_first(1)
  puts "После добавления 1 в начало дека deque = #{deque.to_array}"

  # Извлечь элементы из дека
  pop_last = deque.pop_last
  puts "Извлечённый последний элемент = #{pop_last}, после извлечения deque = #{deque.to_array}"
  pop_first = deque.pop_first
  puts "Извлечённый первый элемент = #{pop_first}, после извлечения deque = #{deque.to_array}"

  # Получить длину дека
  size = deque.size
  puts "Длина дека size = #{size}"

  # Проверить, пуст ли дек
  is_empty = deque.is_empty?
  puts "Дек пуст = #{is_empty}"
end
