=begin
File: print_util.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative "./tree_node"

### 印出矩陣 ###
def print_matrix(mat)
  s = []
  mat.each { |arr| s << " #{arr.to_s}" }
  puts "[\n#{s.join(",\n")}\n]"
end

### 印出鏈結串列 ###
def print_linked_list(head)
  list = []
  while head
    list << head.val
    head = head.next
  end
  puts "#{list.join(" -> ")}"
end

class Trunk
  attr_accessor :prev, :str

  def initialize(prev, str)
    @prev = prev
    @str = str
  end
end

def show_trunk(p)
  return if p.nil?

  show_trunk(p.prev)
  print p.str
end

### 印出二元樹 ###
# 這段印出樹狀結構的程式碼取自 TECHIE DELIGHT
# https://www.techiedelight.com/c-program-print-binary-tree/
def print_tree(root, prev=nil, is_right=false)
  return if root.nil?

  prev_str = "    "
  trunk = Trunk.new(prev, prev_str)
  print_tree(root.right, trunk, true)

  if prev.nil?
    trunk.str = "———"
  elsif is_right
    trunk.str = "/———"
    prev_str = "   |"
  else
    trunk.str = "\\———"
    prev.str = prev_str
  end

  show_trunk(trunk)
  puts " #{root.val}"
  prev.str = prev_str if prev
  trunk.str = "   |"
  print_tree(root.left, trunk, false)
end

### 印出雜湊表 ###
def print_hash_map(hmap)
  hmap.entries.each { |key, value| puts "#{key} -> #{value}" }
end

### 印出堆積 ###
def print_heap(heap)
  puts "堆積的陣列表示法：#{heap}"
  puts "堆積的樹狀表示法："
  root = arr_to_tree(heap)
  print_tree(root)
end
