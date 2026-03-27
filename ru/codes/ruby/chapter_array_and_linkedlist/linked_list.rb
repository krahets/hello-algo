=begin
File: linked_list.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'
require_relative '../utils/print_util'

# ## Вставить узел _p после узла n0 в связном списке ###
# В Ruby `p` является встроенной функцией, а `P` является константой, поэтому здесь используется `_p`
def insert(n0, _p)
  n1 = n0.next
  _p.next = n1
  n0.next = _p
end

# ## Удалить первый узел после узла n0 в связном списке ###
def remove(n0)
  return if n0.next.nil?

  # n0 -> remove_node -> n1
  remove_node = n0.next
  n1 = remove_node.next
  n0.next = n1
end

# ## Обратиться к узлу связного списка с индексом index ###
def access(head, index)
  for i in 0...index
    return nil if head.nil?
    head = head.next
  end

  head
end

# ## Найти первый узел со значением target в связном списке ###
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
  # Инициализироватьсвязный список
  # Инициализироватькаждый узел
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
  puts "Инициализированный связный список:"
  print_linked_list(n0)

  # Вставить узел
  insert(n0, ListNode.new(0))
  print_linked_list n0

  # Удалить узел
  remove(n0)
  puts "Связный список после удаления узла:"
  print_linked_list(n0)

  # Получить доступ к узлу
  node = access(n0, 3)
  puts "Значение узла по индексу 3 в связном списке = #{node.val}"

  # Найти узел
  index = find(n0, 2)
  puts "Индекс узла со значением 2 в связном списке = #{index}"
end
