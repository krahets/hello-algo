=begin
File: array_stack.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Стек на основе массива ###
class ArrayStack
  ### Конструктор ###
  def initialize
    @stack = []
  end

  ### Получить размер стека ###
  def size
    @stack.length
  end

  ### Проверить, пуст ли стек ###
  def is_empty?
    @stack.empty?
  end

  ### Поместить элемент в стек ###
  def push(item)
    @stack << item
  end

  ### Снять элемент со стека ###
  def pop
    raise IndexError, 'Стек пуст' if is_empty?

    @stack.pop
  end

  ### Посмотреть элемент на вершине стека ###
  def peek
    raise IndexError, 'Стек пуст' if is_empty?

    @stack.last
  end

  ### Вернуть массив для вывода ###
  def to_array
    @stack
  end
end

### Пример использования ###
if __FILE__ == $0
  # Инициализировать стек
  stack = ArrayStack.new

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
