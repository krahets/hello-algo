=begin
File: linkedlist_queue.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'

# ## Очередь на основе связного списка ###
class LinkedListQueue
  # ## Получение длины очереди ###
  attr_reader :size

  # ## Конструктор ###
  def initialize
    @front = nil  # Головной узел front
    @rear = nil   # Хвостовой узел rear
    @size = 0
  end

  # ## Проверка, пуста ли очередь ###
  def is_empty?
    @front.nil?
  end

  # ## Добавление в очередь ###
  def push(num)
    # Добавить num после хвостового узла
    node = ListNode.new(num)

    # Если очередь пуста, сделать так, чтобы и head, и tail указывали на этот узел
    if @front.nil?
      @front = node
      @rear = node
    # Если очередь не пуста, добавить этот узел после хвостового узла
    else
      @rear.next = node
      @rear = node
    end

    @size += 1
  end

  # ## Извлечение из очереди ###
  def pop
    num = peek
    # Удалить головной узел
    @front = @front.next
    @size -= 1
    num
  end

  # ## Доступ к элементу в начале очереди ###
  def peek
    raise IndexError, 'очередь пуста' if is_empty?

    @front.val
  end

  # ## Преобразовать связный список в Array и вернуть ###
  def to_array
    queue = []
    temp = @front
    while temp
      queue << temp.val
      temp = temp.next
    end
    queue
  end
end

### Driver Code ###
if __FILE__ == $0
  # Инициализация очереди
  queue = LinkedListQueue.new

  # Элемент помещается в очередь
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  puts "Очередь queue = #{queue.to_array}"

  # Доступ к элементу в начале очереди
  peek = queue.peek
  puts "Первый элемент front = #{peek}"

  # Извлечение элемента из очереди
  pop_front = queue.pop
  puts "Извлеченный элемент pop = #{pop_front}"
  puts "queue после извлечения = #{queue.to_array}"

  # Получение длины очереди
  size = queue.size
  puts "Длина очереди size = #{size}"

  # Проверка, пуста ли очередь
  is_empty = queue.is_empty?
  puts "Пуста ли очередь = #{is_empty}"
end
