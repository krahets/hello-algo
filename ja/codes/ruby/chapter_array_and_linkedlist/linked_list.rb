=begin
File: linked_list.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'
require_relative '../utils/print_util'

### 連結リストのノード n0 の後にノード _p を挿入 ###
# Ruby の `p` は組み込み関数で、`P` は定数なので、代わりに `_p` を使える
def insert(n0, _p)
  n1 = n0.next
  _p.next = n1
  n0.next = _p
end

### 連結リストのノード n0 の直後のノードを削除 ###
def remove(n0)
  return if n0.next.nil?

  # n0 -> remove_node -> n1
  remove_node = n0.next
  n1 = remove_node.next
  n0.next = n1
end

### 連結リスト内の index 番目のノードにアクセス ###
def access(head, index)
  for i in 0...index
    return nil if head.nil?
    head = head.next
  end

  head
end

### 連結リストで値が target の最初のノードを探す ###
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
  # 連結リストを初期化する
  # 各ノードを初期化する
  n0 = ListNode.new(1)
  n1 = ListNode.new(3)
  n2 = ListNode.new(2)
  n3 = ListNode.new(5)
  n4 = ListNode.new(4)
  # ノード間の参照を構築する
  n0.next = n1
  n1.next = n2
  n2.next = n3
  n3.next = n4
  puts "初期化した連結リストは"
  print_linked_list(n0)

  # ノードを挿入
  insert(n0, ListNode.new(0))
  print_linked_list n0

  # ノードを削除
  remove(n0)
  puts "ノード削除後の連結リストは"
  print_linked_list(n0)

  # ノードにアクセス
  node = access(n0, 3)
  puts "連結リストのインデックス 3 にあるノードの値 = #{node.val}"

  # ノードを探索
  index = find(n0, 2)
  puts "連結リスト内で値が 2 のノードのインデックス = #{index}"
end
