=begin
File: my_heap.rb
Created Time: 2024-04-19
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative '../utils/print_util'

# ## Максимальная куча ###
class MaxHeap
  attr_reader :max_heap

  # ## Конструктор, строящий кучу по входному списку ###
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

  # ## Обмен элементов ###
  def swap(i, j)
    @max_heap[i], @max_heap[j] = @max_heap[j], @max_heap[i]
  end

  # ## Получить размер кучи ###
  def size
    @max_heap.length
  end

  # ## Проверка, пуста ли куча ###
  def is_empty?
    size == 0
  end

  # ## Доступ к элементу на вершине кучи ###
  def peek
    @max_heap[0]
  end

  # ## Добавление элемента в кучу ###
  def push(val)
    # Добавление узла
    @max_heap << val
    # Просеивание снизу вверх
    sift_up(size - 1)
  end

  # ## Начиная с узла i, выполнить просеивание снизу вверх ###
  def sift_up(i)
    loop do
      # Получение родительского узла для узла i
      p = parent(i)
      # Завершить heapify, когда «корневой узел уже пройден» или «узел не требует исправления»
      break if p < 0 || @max_heap[i] <= @max_heap[p]
      # Поменять два узла местами
      swap(i, p)
      # Циклическое просеивание вверх
      i = p
    end
  end

  # ## Извлечение элемента из кучи ###
  def pop
    # Обработка пустого случая
    raise IndexError, "куча пуста" if is_empty?
    # Поменять корневой узел с самым правым листом местами (поменять первый и последний элементы)
    swap(0, size - 1)
    # Удаление узла
    val = @max_heap.pop
    # Просеивание сверху вниз
    sift_down(0)
    # Вернуть элемент с вершины кучи
    val
  end

  # ## Начиная с узла i, выполнить просеивание сверху вниз ###
  def sift_down(i)
    loop do
      # Определить узел с максимальным значением среди i, l и r и обозначить его как ma
      l, r, ma = left(i), right(i), i
      ma = l if l < size && @max_heap[l] > @max_heap[ma]
      ma = r if r < size && @max_heap[r] > @max_heap[ma]

      # Если узел i уже максимален или индексы l и r вне границ, дальнейшее просеивание не требуется, выйти
      break if ma == i

      # Поменять два узла местами
      swap(i, ma)
      # Циклическое просеивание вниз
      i = ma
    end
  end

  # ## Вывести кучу (двоичное дерево) ###
  def __print__
    print_heap(@max_heap)
  end
end

### Driver Code ###
if __FILE__ == $0
  # Инициализация максимальной кучи
  max_heap = MaxHeap.new([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
  puts "\nПосле построения кучи из входного списка"
  max_heap.__print__

  # Получение элемента с вершины кучи
  peek = max_heap.peek
  puts "\nЭлемент на вершине кучи = #{peek}"

  # Добавление элемента в кучу
  val = 7
  max_heap.push(val)
  puts "\nПосле добавления элемента #{val} в кучу"
  max_heap.__print__

  # Извлечение элемента с вершины кучи
  peek = max_heap.pop
  puts "\nПосле извлечения вершины кучи #{peek}"
  max_heap.__print__

  # Получение размера кучи
  size = max_heap.size
  puts "\nКоличество элементов в куче = #{size}"

  # Проверка, пуста ли куча
  is_empty = max_heap.is_empty?
  puts "\nПуста ли куча: #{is_empty}"
end
