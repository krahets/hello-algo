=begin
File: array_stack.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Стек на основе массива ###
class ArrayStack
  # ## Конструктор ###
  def initialize
    @stack = []
  end

  # ## Получить длину стека ###
  def size
    @stack.length
  end

  # ## Проверить, пуст ли стек ###
  def is_empty?
    @stack.empty?
  end

  # ## помещение в стек ###
  def push(item)
    @stack << item
  end

  # ## извлечение из стека ###
  def pop
    raise IndexError, 'Стек пуст' if is_empty?

    @stack.pop
  end

  # ## Получить верхний элемент стека ###
  def peek
    raise IndexError, 'Стек пуст' if is_empty?

    @stack.last
  end

  # ## Вернуть список для вывода ###
  def to_array
    @stack
  end
end

### Driver Code ###
if __FILE__ == $0
  # Инициализировать стек
  stack = ArrayStack.new

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
