=begin
File: linked_list.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'
require_relative '../utils/print_util'

### 連結リストのノード n0 の直後にノード _p を挿入する ###
# Ruby では `p` は組み込み関数、`P` は定数なので、代わりに `_p` を使える
def insert(n0, _p)
  n1 = n0.next
  _p.next = n1
  n0.next = _p
end

### 連結リストのノード n0 の直後のノードを削除する ###
def remove(n0)
  return if n0.next.nil?

  # n0 -> remove_node -> n1
  remove_node = n0.next
  n1 = remove_node.next
  n0.next = n1
end

### 連結リストのインデックス index にあるノードにアクセスする ###
def access(head, index)
  for i in 0...index
    return nil if head.nil?
    head = head.next
  end

  head
end

### 連結リストから値が target である最初のノードを探索する ###
def find(head, target)
  index = 0
  while head
    return index if head.val == target
    head = head.next
    index += 1
  end

  -1
end

### 実行用コード ###
if __FILE__ == $0
  # 連結リストを初期化する
  # 各ノードを初期化する
  n0 = ListNode.new(1)
  n1 = ListNode.new(3)
  n2 = ListNode.new(2)
  n3 = ListNode.new(5)
  n4 = ListNode.new(4)
  # ノード間の参照を設定する
  n0.next = n1
  n1.next = n2
  n2.next = n3
  n3.next = n4
  puts "初期化した連結リスト"
  print_linked_list(n0)

  # ノードを挿入する
  insert(n0, ListNode.new(0))
  print_linked_list n0

  # ノードを削除する
  remove(n0)
  puts "ノードを削除した後の連結リスト"
  print_linked_list(n0)

  # ノードにアクセスする
  node = access(n0, 3)
  puts "連結リストのインデックス 3 にあるノードの値 = #{node.val}"

  # ノードを探索する
  index = find(n0, 2)
  puts "連結リスト内で値が 2 であるノードのインデックス = #{index}"
end
