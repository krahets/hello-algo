=begin
File: my_heap.rb
Created Time: 2024-04-19
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative '../utils/print_util'

# ## max-куча ###
class MaxHeap
  attr_reader :max_heap

  # ## Конструктор, создающий кучу по входному списку ###
  def initialize(nums)
    # Добавить элементы списка в кучу без изменений
    @max_heap = nums
    # Выполнить heapify для всех узлов, кроме листовых
    parent(size - 1).downto(0) do |i|
      sift_down(i)
    end
  end

  # ## Получить индекс левого дочернего узла ###
  def left(i)
    2 * i + 1
  end

  # ## Получить индекс правого дочернего узла ###
  def right(i)
    2 * i + 2
  end

  # ## Получить индекс родительского узла ###
  def parent(i)
    (i - 1) / 2     # Округление вниз при делении
  end

  # ## Поменять элементы местами ###
  def swap(i, j)
    @max_heap[i], @max_heap[j] = @max_heap[j], @max_heap[i]
  end

  # ## Получить размер кучи ###
  def size
    @max_heap.length
  end

  # ## Проверить, пуста ли куча ###
  def is_empty?
    size == 0
  end

  # ## Обратиться к элементу на вершине кучи ###
  def peek
    @max_heap[0]
  end

  # ## Добавить элемент в кучу ###
  def push(val)
    # Добавить узел
    @max_heap << val
    # Выполнить heapify снизу вверх
    sift_up(size - 1)
  end

  # ## Начиная с узла i, выполнить просеивание снизу вверх ###
  def sift_up(i)
    loop do
      # Получить родительский узел для узла i
      p = parent(i)
      # Завершить просеивание, когда произошел выход за корень или узел не нуждается в исправлении
      break if p < 0 || @max_heap[i] <= @max_heap[p]
      # Поменять местами два узла
      swap(i, p)
      # Циклически выполнять просеивание вверх
      i = p
    end
  end

  # ## Извлечение элемента из кучи ###
  def pop
    # Обработка пустого случая
    raise IndexError, "кучапуст" if is_empty?
    # Поменять местами корневой узел и крайний правый лист (первый и последний элементы)
    swap(0, size - 1)
    # Удалить узел
    val = @max_heap.pop
    # Выполнить heapify сверху вниз
    sift_down(0)
    # Вернуть элемент на вершине кучи
    val
  end

  # ## Начиная с узла i, выполнить просеивание сверху вниз ###
  def sift_down(i)
    loop do
      # Определить узел с максимальным значением среди i, l и r и обозначить его как ma
      l, r, ma = left(i), right(i), i
      ma = l if l < size && @max_heap[l] > @max_heap[ma]
      ma = r if r < size && @max_heap[r] > @max_heap[ma]

      # Если узел i уже максимален или индексы l и r выходят за границы, дальнейшая heapify не требуется
      break if ma == i

      # Поменять местами два узла
      swap(i, ma)
      # Циклически выполнять просеивание вниз
      i = ma
    end
  end

  # ## Вывести кучу (в виде двоичного дерева)###
  def __print__
    print_heap(@max_heap)
  end
end

### Driver Code ###
if __FILE__ == $0
  # Инициализировать max-кучу
  max_heap = MaxHeap.new([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
  puts "\nПосле построения кучи по входному списку"
  max_heap.__print__

  # Получить верхний элемент кучи
  peek = max_heap.peek
  puts "\nвершина кучиэлементравно #{peek}"

  # Добавить элемент в кучу
  val = 7
  max_heap.push(val)
  puts "\nЭлемент #{val} после добавления в кучу"
  max_heap.__print__

  # Извлечь верхний элемент из кучи
  peek = max_heap.pop
  puts "\nвершина кучиЭлемент #{peek} после извлечения из кучи"
  max_heap.__print__

  # Получить размер кучи
  size = max_heap.size
  puts "\nКоличество элементов в куче равно #{size}"

  # Проверить, пуста ли куча
  is_empty = max_heap.is_empty?
  puts "\nкучапуст ли #{is_empty}"
end
