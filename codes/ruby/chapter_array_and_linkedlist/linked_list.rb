=begin
File: linked_list.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'
require_relative '../utils/print_util'

### 在链表的节点 n0 之后插入节点 _p ###
# Ruby 的 `p` 是一个内置函数， `P` 是一个常量，所以可以使用 `_p` 代替
def insert(n0, _p)
  n1 = n0.next
  _p.next = n1
  n0.next = _p
end

### 删除链表的节点 n0 之后的首个节点 ###
def remove(n0)
  return if n0.next.nil?

  # n0 -> remove_node -> n1
  remove_node = n0.next
  n1 = remove_node.next
  n0.next = n1
end

### 访问链表中索引为 index 的节点 ###
def access(head, index)
  for i in 0...index
    return nil if head.nil?
    head = head.next
  end

  head
end

### 在链表中查找值为 target 的首个节点 ###
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
  # 初始化链表
  # 初始化各个节点
  n0 = ListNode.new(1)
  n1 = ListNode.new(3)
  n2 = ListNode.new(2)
  n3 = ListNode.new(5)
  n4 = ListNode.new(4)
  # 构建节点之间的引用
  n0.next = n1
  n1.next = n2
  n2.next = n3
  n3.next = n4
  puts "初始化的链表为"
  print_linked_list(n0)

  # 插入节点
  insert(n0, ListNode.new(0))
  print_linked_list n0

  # 删除节点
  remove(n0)
  puts "删除节点后的链表为"
  print_linked_list(n0)

  # 访问节点
  node = access(n0, 3)
  puts "链表中索引 3 处的节点的值 = #{node.val}"

  # 查找节点
  index = find(n0, 2)
  puts "链表中值为 2 的节点的索引 = #{index}"
end
