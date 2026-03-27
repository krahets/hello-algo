=begin
File: top_k.rb
Created Time: 2024-04-19
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative "./my_heap"

# ## Добавление элемента в кучу ###
def push_min_heap(heap, val)
  # Инвертировать знак элемента
  heap.push(-val)
end

# ## Извлечение элемента из кучи ###
def pop_min_heap(heap)
  # Инвертировать знак элемента
  -heap.pop
end

# ## Доступ к элементу на вершине кучи ###
def peek_min_heap(heap)
  # Инвертировать знак элемента
  -heap.peek
end

# ## Извлечение элементов из кучи ###
def get_min_heap(heap)
  # Инвертировать все элементы кучи
  heap.max_heap.map { |x| -x }
end

# ## Поиск k наибольших элементов массива с помощью кучи ###
def top_k_heap(nums, k)
  # Инициализация минимальной кучи
  # Обратите внимание: мы инвертируем все элементы кучи, чтобы с помощью максимальной кучи имитировать минимальную
  max_heap = MaxHeap.new([])

  # Поместить первые k элементов массива в кучу
  for i in 0...k
    push_min_heap(max_heap, nums[i])
  end

  # Начиная с элемента k+1, поддерживать длину кучи равной k
  for i in k...nums.length
    # Если текущий элемент больше элемента на вершине кучи, извлечь вершину кучи и добавить текущий элемент в кучу
    if nums[i] > peek_min_heap(max_heap)
      pop_min_heap(max_heap)
      push_min_heap(max_heap, nums[i])
    end
  end

  get_min_heap(max_heap)
end

### Driver Code ###
if __FILE__ == $0
  nums = [1, 7, 6, 3, 2]
  k = 3

  res = top_k_heap(nums, k)
  puts "#{k} наибольших элементов:"
  print_heap(res)
end
