=begin
File: binary_search_tree.rb
Created Time: 2024-04-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### Binary search tree ###
class BinarySearchTree
  ### Constructor ###
  def initialize
    # Initialize empty tree
    @root = nil
  end

  ### Get binary tree root node ###
  def get_root
    @root
  end

  ### Search node ###
  def search(num)
    cur = @root

    # Loop search, exit after passing leaf node
    while !cur.nil?
      # Target node is in cur's right subtree
      if cur.val < num
        cur = cur.right
      # Target node is in cur's left subtree
      elsif cur.val > num
        cur = cur.left
      # Found target node, exit loop
      else
        break
      end
    end

    cur
  end

  ### Insert node ###
  def insert(num)
    # If tree is empty, initialize root node
    if @root.nil?
      @root = TreeNode.new(num)
      return
    end

    # Loop search, exit after passing leaf node
    cur, pre = @root, nil
    while !cur.nil?
      # Found duplicate node, return directly
      return if cur.val == num

      pre = cur
      # Insertion position is in cur's right subtree
      if cur.val < num
        cur = cur.right
      # Insertion position is in cur's left subtree
      else
        cur = cur.left
      end
    end

    # Insert node
    node = TreeNode.new(num)
    if pre.val < num
      pre.right = node
    else
      pre.left = node
    end
  end

  ### Delete node ###
  def remove(num)
    # If tree is empty, return directly
    return if @root.nil?

    # Loop search, exit after passing leaf node
    cur, pre = @root, nil
    while !cur.nil?
      # Found node to delete, exit loop
      break if cur.val == num

      pre = cur
      # Node to delete is in cur's right subtree
      if cur.val < num
        cur = cur.right
      # Node to delete is in cur's left subtree
      else
        cur = cur.left
      end
    end
    # If no node to delete, return directly
    return if cur.nil?

    # Number of child nodes = 0 or 1
    if cur.left.nil? || cur.right.nil?
      # When number of child nodes = 0 / 1, child = null / that child node
      child = cur.left || cur.right
      # Delete node cur
      if cur != @root
        if pre.left == cur
          pre.left = child
        else
          pre.right = child
        end
      else
        # If deleted node is root node, reassign root node
        @root = child
      end
    # Number of child nodes = 2
    else
      # Get next node of cur in inorder traversal
      tmp = cur.right
      while !tmp.left.nil?
        tmp = tmp.left
      end
      # Recursively delete node tmp
      remove(tmp.val)
      # Replace cur with tmp
      cur.val = tmp.val
    end
  end
end

### Driver Code ###
if __FILE__ == $0
  # Initialize binary search tree
  bst = BinarySearchTree.new
  nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]
  # Please note that different insertion orders will generate different binary trees, this sequence can generate a perfect binary tree
  nums.each { |num| bst.insert(num) }
  puts "\nInitialized binary tree is\n"
  print_tree(bst.get_root)

  # Search node
  node = bst.search(7)
  puts "\nFound node object: #{node}, node value = #{node.val}"

  # Insert node
  bst.insert(16)
  puts "\nAfter inserting node 16, binary tree is\n"
  print_tree(bst.get_root)

  # Remove node
  bst.remove(1)
  puts "\nAfter removing node 1, binary tree is\n"
  print_tree(bst.get_root)

  bst.remove(2)
  puts "\nAfter removing node 2, binary tree is\n"
  print_tree(bst.get_root)

  bst.remove(4)
  puts "\nAfter removing node 4, binary tree is\n"
  print_tree(bst.get_root)
end
