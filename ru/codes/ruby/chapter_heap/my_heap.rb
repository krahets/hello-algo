=begin
File: my_heap.rb
Created Time: 2024-04-19
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative '../utils/print_util'

### Макс-куча ###
class MaxHeap
  attr_reader :max_heap

  ### Конструктор кучи по входному списку ###
  def initialize(nums)
    # Поместить элементы списка в кучу в прежнем порядке
    @max_heap = nums
    # Выполнить просеивание для всех узлов, кроме листьев
    parent(size - 1).downto(0) do |i|
      sift_down(i)
    end
  end

  ### Индекс левого ребёнка ###
  def left(i)
    2 * i + 1
  end

  ### Индекс правого ребёнка ###
  def right(i)
    2 * i + 2
  end

  ### Индекс родителя ###
  def parent(i)
    (i - 1) / 2     # Целочисленное деление с округлением вниз
  end

  ### Поменять элементы местами ###
  def swap(i, j)
    @max_heap[i], @max_heap[j] = @max_heap[j], @max_heap[i]
  end

  ### Размер кучи ###
  def size
    @max_heap.length
  end

  ### Проверить, пуста ли куча ###
  def is_empty?
    size == 0
  end

  ### Посмотреть элемент в корне ###
  def peek
    @max_heap[0]
  end

  ### Вставить элемент в кучу ###
  def push(val)
    # Добавить узел
    @max_heap << val
    # Просеивание вверх
    sift_up(size - 1)
  end

  ### Просеивать вверх от узла i ###
  def sift_up(i)
    loop do
      # Найти родителя узла i
      p = parent(i)
      # Если вышли за корень или узел уже на своём месте, завершить просеивание
      break if p < 0 || @max_heap[i] <= @max_heap[p]
      # Поменять два узла местами
      swap(i, p)
      # Продолжить просеивание вверх
      i = p
    end
  end

  ### Извлечь элемент из кучи ###
  def pop
    # Проверить, пуста ли куча
    raise IndexError, "Куча пуста" if is_empty?
    # Поменять местами корень и крайний правый лист (первый и последний элементы)
    swap(0, size - 1)
    # Удалить узел
    val = @max_heap.pop
    # Просеивание вниз
    sift_down(0)
    # Вернуть элемент из корня
    val
  end

  ### Просеивать вниз от узла i ###
  def sift_down(i)
    loop do
      # Сохранить в ma индекс наибольшего из узлов i, l и r
      l, r, ma = left(i), right(i), i
      ma = l if l < size && @max_heap[l] > @max_heap[ma]
      ma = r if r < size && @max_heap[r] > @max_heap[ma]

      # Если i уже наибольший или оба индекса l и r вне диапазона, завершить просеивание
      break if ma == i

      # Поменять два узла местами
      swap(i, ma)
      # Продолжить просеивание вниз
      i = ma
    end
  end

  ### Вывести кучу в виде бинарного дерева###
  def __print__
    print_heap(@max_heap)
  end
end

### Пример использования ###
if __FILE__ == $0
  # Инициализировать макс-кучу
  max_heap = MaxHeap.new([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
  puts "\nКуча, построенная по входному списку:"
  max_heap.__print__

  # Получить элемент в корне
  peek = max_heap.peek
  puts "\nЭлемент в корне: #{peek}"

  # Вставить элемент в кучу
  val = 7
  max_heap.push(val)
  puts "\nПосле вставки элемента #{val}:"
  max_heap.__print__

  # Извлечь элемент из корня
  peek = max_heap.pop
  puts "\nПосле извлечения элемента #{peek} из корня:"
  max_heap.__print__

  # Размер кучи
  size = max_heap.size
  puts "\nЧисло элементов в куче: #{size}"

  # Проверить, пуста ли куча
  is_empty = max_heap.is_empty?
  puts "\nПуста ли куча: #{is_empty}"
end
