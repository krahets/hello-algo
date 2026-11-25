=begin
File: linear_search.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative '../utils/list_node'

### Линейный поиск в массиве ###
def linear_search_array(nums, target)
  # Обходим массив
  for i in 0...nums.length
    return i if nums[i] == target # Элемент найден, возвращаем его индекс
  end

  -1 # Элемент не найден, возвращаем -1
end

### Линейный поиск в связном списке ###
def linear_search_linkedlist(head, target)
  # Обходим связный список
  while head
    return head if head.val == target # Нужный узел найден, возвращаем его

    head = head.next
  end

  nil # Нужный узел не найден, возвращаем None
end

### Пример использования ###
if __FILE__ == $0
  target = 3

  # Выполняем линейный поиск в массиве
  nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
  index = linear_search_array(nums, target)
  puts "Индекс элемента 3 = #{index}"

  # Выполняем линейный поиск в связном списке
  head = arr_to_linked_list(nums)
  node = linear_search_linkedlist(head, target)
  puts "Узел со значением 3: #{node}"
end
