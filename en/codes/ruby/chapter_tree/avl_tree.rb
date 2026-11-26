=begin
File: avl_tree.rb
Created Time: 2024-04-17
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### AVL tree ###
class AVLTree
  ### Constructor ###
  def initialize
    @root = nil
  end

  ### Get the root of the binary tree ###
  def get_root
    @root
  end

  ### Get the node height ###
  def height(node)
    # A null node has height -1, and a leaf has height 0
    return node.height unless node.nil?

    -1
  end

  ### Update the node height ###
  def update_height(node)
    # Node height is the height of the taller subtree plus 1
    node.height = [height(node.left), height(node.right)].max + 1
  end

  ### Get the balance factor ###
  def balance_factor(node)
    # A null node has a balance factor of 0
    return 0 if node.nil?

    # Balance factor = left subtree height - right subtree height
    height(node.left) - height(node.right)
  end

  ### Right rotation ###
  def right_rotate(node)
    child = node.left
    grand_child = child.right
    # Rotate node to the right around child
    child.right = node
    node.left = grand_child
    # Update the node height
    update_height(node)
    update_height(child)
    # Return the root of the rotated subtree
    child
  end

  ### Left rotation ###
  def left_rotate(node)
    child = node.right
    grand_child = child.left
    # Rotate node to the left around child
    child.left = node
    node.right = grand_child
    # Update the node height
    update_height(node)
    update_height(child)
    # Return the root of the rotated subtree
    child
  end

  ### Rebalance the subtree by rotating it ###
  def rotate(node)
    # Get the balance factor of node
    balance_factor = balance_factor(node)
    # Left-heavy tree
    if balance_factor > 1
      if balance_factor(node.left) >= 0
        # Rotate right
        return right_rotate(node)
      else
        # Rotate left, then right
        node.left = left_rotate(node.left)
        return right_rotate(node)
      end
    # Right-heavy tree
    elsif balance_factor < -1
      if balance_factor(node.right) <= 0
        # Rotate left
        return left_rotate(node)
      else
        # Rotate right, then left
        node.right = right_rotate(node.right)
        return left_rotate(node)
      end
    end
    # The tree is balanced, so return without rotating
    node
  end

  ### Insert a node ###
  def insert(val)
    @root = insert_helper(@root, val)
  end

  ### Insert a node recursively (helper method)###
  def insert_helper(node, val)
    return TreeNode.new(val) if node.nil?
    # 1. Find the insertion position and insert the node
    if val < node.val
      node.left = insert_helper(node.left, val)
    elsif val > node.val
      node.right = insert_helper(node.right, val)
    else
      # Return without inserting a duplicate
      return node
    end
    # Update the node height
    update_height(node)
    # 2. Rebalance the subtree by rotating it
    rotate(node)
  end

  ### Delete a node ###
  def remove(val)
    @root = remove_helper(@root, val)
  end

  ### Delete a node recursively (helper method)###
  def remove_helper(node, val)
    return if node.nil?
    # 1. Find the node and delete it
    if val < node.val
      node.left = remove_helper(node.left, val)
    elsif val > node.val
      node.right = remove_helper(node.right, val)
    else
      if node.left.nil? || node.right.nil?
        child = node.left || node.right
        # No children: delete node and return
        return if child.nil?
        # One child: delete node
        node = child
      else
        # Two children: delete the inorder successor and use it to replace the current node
        temp = node.right
        while !temp.left.nil?
          temp = temp.left
        end
        node.right = remove_helper(node.right, temp.val)
        node.val = temp.val
      end
    end
    # Update the node height
    update_height(node)
    # 2. Rebalance the subtree by rotating it
    rotate(node)
  end

  ### Search for a node ###
  def search(val)
    cur = @root
    # Stop the search after passing a leaf
    while !cur.nil?
      # The target is in the right subtree of cur
      if cur.val < val
        cur = cur.right
      # The target is in the left subtree of cur
      elsif cur.val > val
        cur = cur.left
      # The target was found, so exit the loop
      else
        break
      end
    end
    # Return the target node
    cur
  end
end

### Driver code ###
if __FILE__ == $0
  def test_insert(tree, val)
    tree.insert(val)
    puts "\nAVL tree after inserting #{val}:"
    print_tree(tree.get_root)
  end

  def test_remove(tree, val)
    tree.remove(val)
    puts "\nAVL tree after deleting #{val}:"
    print_tree(tree.get_root)
  end

  # Initialize an empty AVL tree
  avl_tree = AVLTree.new

  # Insert a node
  # Watch how the AVL tree stays balanced after an insertion
  for val in [1, 2, 3, 4, 5, 8, 7, 9, 10, 6]
    test_insert(avl_tree, val)
  end

  # Insert a duplicate node
  test_insert(avl_tree, 7)

  # Delete a node
  # Watch how the AVL tree stays balanced after a deletion
  test_remove(avl_tree, 8) # Delete a node with no children
  test_remove(avl_tree, 5) # Delete a node with one child
  test_remove(avl_tree, 4) # Delete a node with two children

  result_node = avl_tree.search(7)
  puts "\nNode found: #{result_node}, node value = #{result_node.val}"
end
