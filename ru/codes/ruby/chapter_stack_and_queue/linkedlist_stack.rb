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

  # ## Проверить, пуст ли стек ###
  def is_empty?
    @peek.nil?
  end

  # ## помещение в стек ###
  def push(val)
    node = ListNode.new(val)
    node.next = @peek
    @peek = node
    @size += 1
  end

  # ## извлечение из стека ###
  def pop
    num = peek
    @peek = @peek.next
    @size -= 1
    num
  end

  # ## Получить верхний элемент стека ###
  def peek
    raise IndexError, 'Стек пуст' if is_empty?

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
  # Инициализировать стек
  stack = LinkedListStack.new

  # Поместить элемент в стек
  stack.push(1)
  stack.push(3)
  stack.push(2)
  stack.push(5)
  stack.push(4)
  puts "стек stack = #{stack.to_array}"

  # Получить верхний элемент стека
  peek = stack.peek
  puts "вершина стекаэлемент peek = #{peek}"

  # Извлечь элемент из стека
  pop = stack.pop
  puts "Элемент, извлеченный из стека, pop = #{pop}"
  puts "stack после извлечения = #{stack.to_array}"

  # Получить длину стека
  size = stack.size
  puts "Длина стека size = #{size}"

  # Проверить, пуста ли структура
  is_empty = stack.is_empty?
  puts "стекпуст ли = #{is_empty}"
end
