=begin
File: linkedlist_stack.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'

# ## Стек на основе связного списка ###
class LinkedListStack
  attr_reader :size

  # ## Конструктор ###
  def initialize
    @size = 0
  end

  # ## Проверка, пуст ли стек ###
  def is_empty?
    @peek.nil?
  end

  # ## Помещение в стек ###
  def push(val)
    node = ListNode.new(val)
    node.next = @peek
    @peek = node
    @size += 1
  end

  # ## Извлечение из стека ###
  def pop
    num = peek
    @peek = @peek.next
    @size -= 1
    num
  end

  # ## Доступ к верхнему элементу стека ###
  def peek
    raise IndexError, 'стек пуст' if is_empty?

    @peek.val
  end

  # ## Преобразовать связный список в Array и вернуть ###
  def to_array
    arr = []
    node = @peek
    while node
      arr << node.val
      node = node.next
    end
    arr.reverse
  end
end

### Driver Code ###
if __FILE__ == $0
  # Инициализация стека
  stack = LinkedListStack.new

  # Помещение элемента в стек
  stack.push(1)
  stack.push(3)
  stack.push(2)
  stack.push(5)
  stack.push(4)
  puts "Стек stack = #{stack.to_array}"

  # Доступ к верхнему элементу стека
  peek = stack.peek
  puts "Верхний элемент peek = #{peek}"

  # Извлечение элемента из стека
  pop = stack.pop
  puts "Извлеченный элемент pop = #{pop}"
  puts "stack после извлечения = #{stack.to_array}"

  # Получение длины стека
  size = stack.size
  puts "Длина стека size = #{size}"

  # Проверка на пустоту
  is_empty = stack.is_empty?
  puts "Пуст ли стек = #{is_empty}"
end
