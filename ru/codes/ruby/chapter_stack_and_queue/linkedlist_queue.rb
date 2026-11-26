=begin
File: linkedlist_queue.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'

### Очередь на основе связного списка ###
class LinkedListQueue
  ### Получить длину очереди ###
  attr_reader :size

  ### Конструктор ###
  def initialize
    @front = nil  # Первый узел front
    @rear = nil   # Последний узел rear
    @size = 0
  end

  ### Проверить, пуста ли очередь ###
  def is_empty?
    @front.nil?
  end

  ### Добавить элемент в очередь ###
  def push(num)
    # Добавить узел со значением num после последнего узла
    node = ListNode.new(num)

    # Если очередь пуста, установить ссылки на первый и последний узлы так, чтобы обе указывали на новый узел
    if @front.nil?
      @front = node
      @rear = node
    # Если очередь непуста, добавить новый узел после последнего
    else
      @rear.next = node
      @rear = node
    end

    @size += 1
  end

  ### Извлечь элемент из очереди ###
  def pop
    num = peek
    # Удалить первый узел
    @front = @front.next
    @size -= 1
    num
  end

  ### Посмотреть первый элемент очереди ###
  def peek
    raise IndexError, 'Очередь пуста' if is_empty?

    @front.val
  end

  ### Преобразовать связный список в массив и вернуть его ###
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

### Пример использования ###
if __FILE__ == $0
  # Инициализировать очередь
  queue = LinkedListQueue.new

  # Добавить элементы в очередь
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  puts "Очередь queue = #{queue.to_array}"

  # Посмотреть первый элемент очереди
  peek = queue.peek
  puts "Первый элемент очереди front = #{peek}"

  # Извлечь элемент из очереди
  pop_front = queue.pop
  puts "Извлечённый элемент pop = #{pop_front}"
  puts "После извлечения queue = #{queue.to_array}"

  # Получить длину очереди
  size = queue.size
  puts "Длина очереди size = #{size}"

  # Проверить, пуста ли очередь
  is_empty = queue.is_empty?
  puts "Очередь пуста = #{is_empty}"
end
