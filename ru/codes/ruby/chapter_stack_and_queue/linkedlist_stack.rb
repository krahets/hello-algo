=begin
File: linkedlist_stack.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'

### Стек на основе связного списка ###
class LinkedListStack
  attr_reader :size

  ### Конструктор ###
  def initialize
    @size = 0
  end

  ### Проверить, пуст ли стек ###
  def is_empty?
    @peek.nil?
  end

  ### Поместить элемент в стек ###
  def push(val)
    node = ListNode.new(val)
    node.next = @peek
    @peek = node
    @size += 1
  end

  ### Снять элемент со стека ###
  def pop
    num = peek
    @peek = @peek.next
    @size -= 1
    num
  end

  ### Посмотреть элемент на вершине стека ###
  def peek
    raise IndexError, 'Стек пуст' if is_empty?

    @peek.val
  end

  ### Преобразовать связный список в массив и вернуть его ###
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

### Пример использования ###
if __FILE__ == $0
  # Инициализировать стек
  stack = LinkedListStack.new

  # Поместить элементы в стек
  stack.push(1)
  stack.push(3)
  stack.push(2)
  stack.push(5)
  stack.push(4)
  puts "Стек stack = #{stack.to_array}"

  # Посмотреть элемент на вершине стека
  peek = stack.peek
  puts "Элемент на вершине стека peek = #{peek}"

  # Снять элемент со стека
  pop = stack.pop
  puts "Снятый элемент pop = #{pop}"
  puts "После снятия элемента stack = #{stack.to_array}"

  # Получить размер стека
  size = stack.size
  puts "Размер стека size = #{size}"

  # Проверить, пуст ли стек
  is_empty = stack.is_empty?
  puts "Стек пуст = #{is_empty}"
end
