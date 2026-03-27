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

  # ## Проверка, пуст ли стек ###
  def is_empty?
    @stack.empty?
  end

  # ## Помещение в стек ###
  def push(item)
    @stack << item
  end

  # ## Извлечение из стека ###
  def pop
    raise IndexError, 'стек пуст' if is_empty?

    @stack.pop
  end

  # ## Доступ к верхнему элементу стека ###
  def peek
    raise IndexError, 'стек пуст' if is_empty?

    @stack.last
  end

  # ## Вернуть список для вывода ###
  def to_array
    @stack
  end
end

### Driver Code ###
if __FILE__ == $0
  # Инициализация стека
  stack = ArrayStack.new

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
