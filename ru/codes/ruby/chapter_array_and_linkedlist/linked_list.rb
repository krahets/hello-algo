=begin
File: linked_list.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'
require_relative '../utils/print_util'

# ## Вставка узла _p после узла n0 в связном списке ###
# В Ruby `p` — встроенная функция, а `P` — константа, поэтому вместо этого можно использовать `_p`
def insert(n0, _p)
  n1 = n0.next
  _p.next = n1
  n0.next = _p
end

# ## Удаление первого узла после узла n0 в связном списке ###
def remove(n0)
  return if n0.next.nil?

  # n0 -> remove_node -> n1
  remove_node = n0.next
  n1 = remove_node.next
  n0.next = n1
end

# ## Доступ к узлу связного списка по индексу index ###
def access(head, index)
  for i in 0...index
    return nil if head.nil?
    head = head.next
  end

  head
end

# ## Поиск первого узла со значением target в связном списке ###
def find(head, target)
  index = 0
  while head
    return index if head.val == target
    head = head.next
    index += 1
  end

  -1
end

### Driver Code ###
if __FILE__ == $0
  # Инициализация связного списка
  # Инициализация всех узлов
  n0 = ListNode.new(1)
  n1 = ListNode.new(3)
  n2 = ListNode.new(2)
  n3 = ListNode.new(5)
  n4 = ListNode.new(4)
  # Построить ссылки между узлами
  n0.next = n1
  n1.next = n2
  n2.next = n3
  n3.next = n4
  puts "Исходный связный список"
  print_linked_list(n0)

  # Вставка узла
  insert(n0, ListNode.new(0))
  print_linked_list n0

  # Удаление узла
  remove(n0)
  puts "Связный список после удаления узла"
  print_linked_list(n0)

  # Доступ к узлу
  node = access(n0, 3)
  puts "Значение узла по индексу 3 в связном списке = #{node.val}"

  # Поиск узла
  index = find(n0, 2)
  puts "Индекс узла со значением 2 в связном списке = #{index}"
end
