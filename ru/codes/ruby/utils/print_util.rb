=begin
File: print_util.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative "./tree_node"

# ## Вывести матрицу ###
def print_matrix(mat)
  s = []
  mat.each { |arr| s << " #{arr.to_s}" }
  puts "[\n#{s.join(",\n")}\n]"
end

# ## Вывести связный список ###
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

# ## Вывести двоичное дерево ###
# Этот вывод дерева заимствован из TECHIE DELIGHT
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

# ## Вывести хеш-таблицу ###
def print_hash_map(hmap)
  hmap.entries.each { |key, value| puts "#{key} -> #{value}" }
end

# ## Вывести кучу ###
def print_heap(heap)
  puts "Массивное представление кучи:#{heap}"
  puts "Древовидное представление кучи:"
  root = arr_to_tree(heap)
  print_tree(root)
end
