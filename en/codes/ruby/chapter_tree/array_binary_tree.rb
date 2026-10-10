=begin
File: array_binary_tree.rb
Created Time: 2024-04-17
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### Array representation of binary tree class ###
class ArrayBinaryTree
  ### Constructor ###
  def initialize(arr)
    @tree = arr.to_a
  end

  ### List capacity ###
  def size
    @tree.length
  end

  ### Get value of node at index i ###
  def val(i)
    # Return nil if index out of bounds, representing empty position
    return if i < 0 || i >= size

    @tree[i]
  end

  ### Get left child index of node at index i ###
  def left(i)
    2 * i + 1
  end

  ### Get right child index of node at index i ###
  def right(i)
    2 * i + 2
  end

  ### Get parent node index of node at index i ###
  def parent(i)
    (i - 1) / 2
  end

  ### Level-order traversal ###
  def level_order
    @res = []

    # Traverse array directly
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

  ### Pre-order traversal ###
  def pre_order
    @res = []
    dfs(0, :pre)
    @res
  end

  ### In-order traversal ###
  def in_order
    @res = []
    dfs(0, :in)
    @res
  end

  ### Post-order traversal ###
  def post_order
    @res = []
    dfs(0, :post)
    @res
  end
end

### Driver Code ###
if __FILE__ == $0
  # Initialize binary tree
  # Here we use a function to generate a binary tree directly from an array
  arr = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
  root = arr_to_tree(arr)
  puts "\nInitialize binary tree\n\n"
  puts 'Array representation of binary tree:'
  pp arr
  puts 'Linked list representation of binary tree:'
  print_tree(root)

  # Binary tree class represented by array
  abt = ArrayBinaryTree.new(arr)

  # Access node
  i = 1
  l, r, _p = abt.left(i), abt.right(i), abt.parent(i)
  puts "\nCurrent node index is #{i}, value is #{abt.val(i).inspect}"
  puts "Left child index is #{l}, value is #{abt.val(l).inspect}"
  puts "Right child index is #{r}, value is #{abt.val(r).inspect}"
  puts "Parent node index is #{_p}, value is #{abt.val(_p).inspect}"

  # Traverse tree
  res = abt.level_order
  puts "\nLevel-order traversal is: #{res}"
  res = abt.pre_order
  puts "Pre-order traversal is: #{res}"
  res = abt.in_order
  puts "In-order traversal is: #{res}"
  res = abt.post_order
  puts "Post-order traversal is: #{res}"
end
