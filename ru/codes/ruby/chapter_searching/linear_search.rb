=begin
File: linear_search.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative '../utils/list_node'

# ## Линейный поиск (массив) ###
def linear_search_array(nums, target)
  # Обход массива
  for i in 0...nums.length
    return i if nums[i] == target # Целевой элемент найден, вернуть его индекс
  end

  -1 # Целевой элемент не найден, вернуть -1
end

# ## Линейный поиск (связный список) ###
def linear_search_linkedlist(head, target)
  # Обойти связный список
  while head
    return head if head.val == target # Найти целевой узел и вернуть его

    head = head.next
  end

  nil # Целевой узел не найден, вернуть None
end

### Driver Code ###
if __FILE__ == $0
  target = 3

  # Выполнить линейный поиск в массиве
  nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
  index = linear_search_array(nums, target)
  puts "Индекс целевого элемента 3 = #{index}"

  # Выполнить линейный поиск в связном списке
  head = arr_to_linked_list(nums)
  node = linear_search_linkedlist(head, target)
  puts "Объект узла со значением 3 = #{node}"
end
