=begin
File: array_binary_tree.rb
Created Time: 2024-04-17
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### Binary tree class using an array representation ###
class ArrayBinaryTree
  ### Constructor ###
  def initialize(arr)
    @tree = arr.to_a
  end

  ### Length of the array representation ###
  def size
    @tree.length
  end

  ### Get the value of the node at index i ###
  def val(i)
    # If the index is out of bounds, return nil to indicate an empty position
    return if i < 0 || i >= size

    @tree[i]
  end

  ### Get the left child index of the node at index i ###
  def left(i)
    2 * i + 1
  end

  ### Get the right child index of the node at index i ###
  def right(i)
    2 * i + 2
  end

  ### Get the parent index of the node at index i ###
  def parent(i)
    (i - 1) / 2
  end

  ### Level-order traversal ###
  def level_order
    @res = []

    # Traverse the array directly
    for i in 0...size
      @res << val(i) unless val(i).nil?
    end

    @res
  end

  ### Depth-first traversal ###
  def dfs(i, order)
    return if val(i).nil?
    # Preorder traversal
    @res << val(i) if order == :pre
    dfs(left(i), order)
    # Inorder traversal
    @res << val(i) if order == :in
    dfs(right(i), order)
    # Postorder traversal
    @res << val(i) if order == :post
  end

  ### Preorder traversal ###
  def pre_order
    @res = []
    dfs(0, :pre)
    @res
  end

  ### Inorder traversal ###
  def in_order
    @res = []
    dfs(0, :in)
    @res
  end

  ### Postorder traversal ###
  def post_order
    @res = []
    dfs(0, :post)
    @res
  end
end

### Driver code ###
if __FILE__ == $0
  # Initialize the binary tree
  # Use a helper function that builds a binary tree directly from an array
  arr = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
  root = arr_to_tree(arr)
  puts "\nInitialize the binary tree\n\n"
  puts 'Array representation of the binary tree:'
  pp arr
  puts 'Linked representation of the binary tree:'
  print_tree(root)

  # Binary tree class using an array representation
  abt = ArrayBinaryTree.new(arr)

  # Access a node
  i = 1
  l, r, _p = abt.left(i), abt.right(i), abt.parent(i)
  puts "\nCurrent node: index = #{i}, value = #{abt.val(i).inspect}"
  puts "Left child: index = #{l}, value = #{abt.val(l).inspect}"
  puts "Right child: index = #{r}, value = #{abt.val(r).inspect}"
  puts "Parent: index = #{_p}, value = #{abt.val(_p).inspect}"

  # Traverse the tree
  res = abt.level_order
  puts "\nLevel-order traversal: #{res}"
  res = abt.pre_order
  puts "Preorder traversal: #{res}"
  res = abt.in_order
  puts "Inorder traversal: #{res}"
  res = abt.post_order
  puts "Postorder traversal: #{res}"
end
