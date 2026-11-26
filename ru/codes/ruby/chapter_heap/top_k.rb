=begin
File: top_k.rb
Created Time: 2024-04-19
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative "./my_heap"

### Вставить элемент в кучу ###
def push_min_heap(heap, val)
  # Сменить знак элемента
  heap.push(-val)
end

### Извлечь элемент из кучи ###
def pop_min_heap(heap)
  # Сменить знак элемента
  -heap.pop
end

### Посмотреть элемент в корне ###
def peek_min_heap(heap)
  # Сменить знак элемента
  -heap.peek
end

### Извлечь элементы кучи ###
def get_min_heap(heap)
  # Сменить знак всех элементов кучи
  heap.max_heap.map { |x| -x }
end

### Найти k наибольших элементов массива с помощью кучи ###
def top_k_heap(nums, k)
  # Инициализировать мин-кучу
  # Меняем знак всех элементов, чтобы использовать макс-кучу как мин-кучу
  max_heap = MaxHeap.new([])

  # Добавить в кучу первые k элементов массива
  for i in 0...k
    push_min_heap(max_heap, nums[i])
  end

  # Начиная с (k+1)-го элемента, поддерживать размер кучи равным k
  for i in k...nums.length
    # Если текущий элемент больше корня, извлечь корень и вставить текущий элемент
    if nums[i] > peek_min_heap(max_heap)
      pop_min_heap(max_heap)
      push_min_heap(max_heap, nums[i])
    end
  end

  get_min_heap(max_heap)
end

### Пример использования ###
if __FILE__ == $0
  nums = [1, 7, 6, 3, 2]
  k = 3

  res = top_k_heap(nums, k)
  puts "Наибольшие элементы (всего #{k}):"
  print_heap(res)
end
