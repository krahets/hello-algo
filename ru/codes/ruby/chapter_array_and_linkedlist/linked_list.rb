=begin
File: linked_list.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'
require_relative '../utils/print_util'

### Вставить узел _p после узла n0 ###
# В Ruby `p` — встроенная функция, а `P` — константа, поэтому можно использовать имя `_p`
def insert(n0, _p)
  n1 = n0.next
  _p.next = n1
  n0.next = _p
end

### Удалить первый узел, следующий за n0 ###
def remove(n0)
  return if n0.next.nil?

  # n0 -> remove_node -> n1
  remove_node = n0.next
  n1 = remove_node.next
  n0.next = n1
end

### Получить узел списка по индексу index ###
def access(head, index)
  for i in 0...index
    return nil if head.nil?
    head = head.next
  end

  head
end

### Найти первый узел списка со значением target ###
def find(head, target)
  index = 0
  while head
    return index if head.val == target
    head = head.next
    index += 1
  end

  -1
end

### Демонстрационный код ###
if __FILE__ == $0
  # Инициализация связного списка
  # Инициализировать узлы
  n0 = ListNode.new(1)
  n1 = ListNode.new(3)
  n2 = ListNode.new(2)
  n3 = ListNode.new(5)
  n4 = ListNode.new(4)
  # Связать узлы ссылками
  n0.next = n1
  n1.next = n2
  n2.next = n3
  n3.next = n4
  puts "Исходный связный список:"
  print_linked_list(n0)

  # Вставка узла
  insert(n0, ListNode.new(0))
  print_linked_list n0

  # Удаление узла
  remove(n0)
  puts "Связный список после удаления:"
  print_linked_list(n0)

  # Доступ к узлу
  node = access(n0, 3)
  puts "Значение узла по индексу 3 = #{node.val}"

  # Поиск узла
  index = find(n0, 2)
  puts "Индекс узла со значением 2 = #{index}"
end
