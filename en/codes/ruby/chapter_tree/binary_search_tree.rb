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
    # Initialize an empty tree
    @root = nil
  end

  ### Get the root of the binary tree ###
  def get_root
    @root
  end

  ### Search for a node ###
  def search(num)
    cur = @root

    # Stop the search after passing a leaf
    while !cur.nil?
      # The target is in the right subtree of cur
      if cur.val < num
        cur = cur.right
      # The target is in the left subtree of cur
      elsif cur.val > num
        cur = cur.left
      # The target was found, so exit the loop
      else
        break
      end
    end

    cur
  end

  ### Insert a node ###
  def insert(num)
    # If the tree is empty, initialize the root
    if @root.nil?
      @root = TreeNode.new(num)
      return
    end

    # Stop the search after passing a leaf
    cur, pre = @root, nil
    while !cur.nil?
      # Return if a duplicate is found
      return if cur.val == num

      pre = cur
      # The insertion position is in the right subtree of cur
      if cur.val < num
        cur = cur.right
      # The insertion position is in the left subtree of cur
      else
        cur = cur.left
      end
    end

    # Insert a node
    node = TreeNode.new(num)
    if pre.val < num
      pre.right = node
    else
      pre.left = node
    end
  end

  ### Delete a node ###
  def remove(num)
    # Return immediately if the tree is empty
    return if @root.nil?

    # Stop the search after passing a leaf
    cur, pre = @root, nil
    while !cur.nil?
      # The node to delete was found, so exit the loop
      break if cur.val == num

      pre = cur
      # The node to delete is in the right subtree of cur
      if cur.val < num
        cur = cur.right
      # The node to delete is in the left subtree of cur
      else
        cur = cur.left
      end
    end
    # Return if the node to delete does not exist
    return if cur.nil?

    # Number of children = 0 or 1
    if cur.left.nil? || cur.right.nil?
      # With no children, child = null. With one child, child is that child.
      child = cur.left || cur.right
      # Delete node cur
      if cur != @root
        if pre.left == cur
          pre.left = child
        else
          pre.right = child
        end
      else
        # If deleting the root, assign a new root
        @root = child
      end
    # Number of children = 2
    else
      # Get the inorder successor of cur
      tmp = cur.right
      while !tmp.left.nil?
        tmp = tmp.left
      end
      # Recursively delete node tmp
      remove(tmp.val)
      # Replace the value of cur with that of tmp
      cur.val = tmp.val
    end
  end
end

### Driver code ###
if __FILE__ == $0
  # Initialize the binary search tree
  bst = BinarySearchTree.new
  nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]
  # Different insertion orders produce different tree shapes. This sequence produces a perfect binary tree.
  nums.each { |num| bst.insert(num) }
  puts "\nInitial binary tree:\n"
  print_tree(bst.get_root)

  # Search for a node
  node = bst.search(7)
  puts "\nNode found: #{node}, node value = #{node.val}"

  # Insert a node
  bst.insert(16)
  puts "\nBinary tree after inserting node 16:\n"
  print_tree(bst.get_root)

  # Delete a node
  bst.remove(1)
  puts "\nBinary tree after deleting node 1:\n"
  print_tree(bst.get_root)

  bst.remove(2)
  puts "\nBinary tree after deleting node 2:\n"
  print_tree(bst.get_root)

  bst.remove(4)
  puts "\nBinary tree after deleting node 4:\n"
  print_tree(bst.get_root)
end
