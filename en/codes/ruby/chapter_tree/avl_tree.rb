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

  ### Get binary tree root node ###
  def get_root
    @root
  end

  ### Get node height ###
  def height(node)
    # Empty node height is -1, leaf node height is 0
    return node.height unless node.nil?

    -1
  end

  ### Update node height ###
  def update_height(node)
    # Node height equals the height of the tallest subtree + 1
    node.height = [height(node.left), height(node.right)].max + 1
  end

  ### Get balance factor ###
  def balance_factor(node)
    # Empty node balance factor is 0
    return 0 if node.nil?

    # Node balance factor = left subtree height - right subtree height
    height(node.left) - height(node.right)
  end

  ### Right rotation ###
  def right_rotate(node)
    child = node.left
    grand_child = child.right
    # Using child as pivot, rotate node to the right
    child.right = node
    node.left = grand_child
    # Update node height
    update_height(node)
    update_height(child)
    # Return root node of subtree after rotation
    child
  end

  ### Left rotation ###
  def left_rotate(node)
    child = node.right
    grand_child = child.left
    # Using child as pivot, rotate node to the left
    child.left = node
    node.right = grand_child
    # Update node height
    update_height(node)
    update_height(child)
    # Return root node of subtree after rotation
    child
  end

  ### Perform rotation to rebalance subtree ###
  def rotate(node)
    # Get balance factor of node
    balance_factor = balance_factor(node)
    # Left-heavy tree
    if balance_factor > 1
      if balance_factor(node.left) >= 0
        # Right rotation
        return right_rotate(node)
      else
        # First left rotation then right rotation
        node.left = left_rotate(node.left)
        return right_rotate(node)
      end
    # Right-heavy tree
    elsif balance_factor < -1
      if balance_factor(node.right) <= 0
        # Left rotation
        return left_rotate(node)
      else
        # First right rotation then left rotation
        node.right = right_rotate(node.right)
        return left_rotate(node)
      end
    end
    # Balanced tree, no rotation needed, return directly
    node
  end

  ### Insert node ###
  def insert(val)
    @root = insert_helper(@root, val)
  end

  ### Recursively insert node (helper method) ###
  def insert_helper(node, val)
    return TreeNode.new(val) if node.nil?
    # 1. Find insertion position and insert node
    if val < node.val
      node.left = insert_helper(node.left, val)
    elsif val > node.val
      node.right = insert_helper(node.right, val)
    else
      # Duplicate node not inserted, return directly
      return node
    end
    # Update node height
    update_height(node)
    # 2. Perform rotation operation to restore balance to this subtree
    rotate(node)
  end

  ### Delete node ###
  def remove(val)
    @root = remove_helper(@root, val)
  end

  ### Recursively delete node (helper method) ###
  def remove_helper(node, val)
    return if node.nil?
    # 1. Find node and delete
    if val < node.val
      node.left = remove_helper(node.left, val)
    elsif val > node.val
      node.right = remove_helper(node.right, val)
    else
      if node.left.nil? || node.right.nil?
        child = node.left || node.right
        # Number of child nodes = 0, delete node directly and return
        return if child.nil?
        # Number of child nodes = 1, delete node directly
        node = child
      else
        # Number of child nodes = 2, delete the next node in inorder traversal and replace current node with it
        temp = node.right
        while !temp.left.nil?
          temp = temp.left
        end
        node.right = remove_helper(node.right, temp.val)
        node.val = temp.val
      end
    end
    # Update node height
    update_height(node)
    # 2. Perform rotation operation to restore balance to this subtree
    rotate(node)
  end

  ### Search node ###
  def search(val)
    cur = @root
    # Loop search, exit after passing leaf node
    while !cur.nil?
      # Target node is in cur's right subtree
      if cur.val < val
        cur = cur.right
      # Target node is in cur's left subtree
      elsif cur.val > val
        cur = cur.left
      # Found target node, exit loop
      else
        break
      end
    end
    # Return target node
    cur
  end
end

### Driver Code ###
if __FILE__ == $0
  def test_insert(tree, val)
    tree.insert(val)
    puts "\nAfter inserting node #{val}, AVL tree is"
    print_tree(tree.get_root)
  end

  def test_remove(tree, val)
    tree.remove(val)
    puts "\nAfter deleting node #{val}, AVL tree is"
    print_tree(tree.get_root)
  end

  # Please pay attention to how the AVL tree maintains balance after inserting nodes
  avl_tree = AVLTree.new

  # Insert node
  # Delete nodes
  for val in [1, 2, 3, 4, 5, 8, 7, 9, 10, 6]
    test_insert(avl_tree, val)
  end

  # Please pay attention to how the AVL tree maintains balance after deleting nodes
  test_insert(avl_tree, 7)

  # Remove node
  # Delete node with degree 1
  test_remove(avl_tree, 8) # Delete node with degree 2
  test_remove(avl_tree, 5) # Remove node with degree 1
  test_remove(avl_tree, 4) # Remove node with degree 2

  result_node = avl_tree.search(7)
  puts "\nFound node object #{result_node}, node value = #{result_node.val}"
end
