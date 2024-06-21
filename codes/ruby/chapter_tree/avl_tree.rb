=begin
File: avl_tree.rb
Created Time: 2024-04-17
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### AVL 树 ###
class AVLTree
  ### 构造方法 ###
  def initialize
    @root = nil
  end

  ### 获取二叉树根节点 ###
  def get_root
    @root
  end

  ### 获取节点高度 ###
  def height(node)
    # 空节点高度为 -1 ，叶节点高度为 0
    return node.height unless node.nil?

    -1
  end

  ### 更新节点高度 ###
  def update_height(node)
    # 节点高度等于最高子树高度 + 1
    node.height = [height(node.left), height(node.right)].max + 1
  end

  ### 获取平衡因子 ###
  def balance_factor(node)
    # 空节点平衡因子为 0
    return 0 if node.nil?

    # 节点平衡因子 = 左子树高度 - 右子树高度
    height(node.left) - height(node.right)
  end

  ### 右旋操作 ###
  def right_rotate(node)
    child = node.left
    grand_child = child.right
    # 以 child 为原点，将 node 向右旋转
    child.right = node
    node.left = grand_child
    # 更新节点高度
    update_height(node)
    update_height(child)
    # 返回旋转后子树的根节点
    child
  end

  ### 左旋操作 ###
  def left_rotate(node)
    child = node.right
    grand_child = child.left
    # 以 child 为原点，将 node 向左旋转
    child.left = node
    node.right = grand_child
    # 更新节点高度
    update_height(node)
    update_height(child)
    # 返回旋转后子树的根节点
    child
  end

  ### 执行旋转操作，使该子树重新恢复平衡 ###
  def rotate(node)
    # 获取节点 node 的平衡因子
    balance_factor = balance_factor(node)
    # 左遍树
    if balance_factor > 1
      if balance_factor(node.left) >= 0
        # 右旋
        return right_rotate(node)
      else
        # 先左旋后右旋
        node.left = left_rotate(node.left)
        return right_rotate(node)
      end
    # 右遍树
    elsif balance_factor < -1
      if balance_factor(node.right) <= 0
        # 左旋
        return left_rotate(node)
      else
        # 先右旋后左旋
        node.right = right_rotate(node.right)
        return left_rotate(node)
      end
    end
    # 平衡树，无须旋转，直接返回
    node
  end

  ### 插入节点 ###
  def insert(val)
    @root = insert_helper(@root, val)
  end

  ### 递归插入节点（辅助方法）###
  def insert_helper(node, val)
    return TreeNode.new(val) if node.nil?
    # 1. 查找插入位置并插入节点
    if val < node.val
      node.left = insert_helper(node.left, val)
    elsif val > node.val
      node.right = insert_helper(node.right, val)
    else
      # 重复节点不插入，直接返回
      return node
    end
    # 更新节点高度
    update_height(node)
    # 2. 执行旋转操作，使该子树重新恢复平衡
    rotate(node)
  end

  ### 删除节点 ###
  def remove(val)
    @root = remove_helper(@root, val)
  end

  ### 递归删除节点（辅助方法）###
  def remove_helper(node, val)
    return if node.nil?
    # 1. 查找节点并删除
    if val < node.val
      node.left = remove_helper(node.left, val)
    elsif val > node.val
      node.right = remove_helper(node.right, val)
    else
      if node.left.nil? || node.right.nil?
        child = node.left || node.right
        # 子节点数量 = 0 ，直接删除 node 并返回
        return if child.nil?
        # 子节点数量 = 1 ，直接删除 node
        node = child
      else
        # 子节点数量 = 2 ，则将中序遍历的下个节点删除，并用该节点替换当前节点
        temp = node.right
        while !temp.left.nil?
          temp = temp.left
        end
        node.right = remove_helper(node.right, temp.val)
        node.val = temp.val
      end
    end
    # 更新节点高度
    update_height(node)
    # 2. 执行旋转操作，使该子树重新恢复平衡
    rotate(node)
  end

  ### 查找节点 ###
  def search(val)
    cur = @root
    # 循环查找，越过叶节点后跳出
    while !cur.nil?
      # 目标节点在 cur 的右子树中
      if cur.val < val
        cur = cur.right
      # 目标节点在 cur 的左子树中
      elsif cur.val > val
        cur = cur.left
      # 找到目标节点，跳出循环
      else
        break
      end
    end
    # 返回目标节点
    cur
  end
end

### Driver Code ###
if __FILE__ == $0
  def test_insert(tree, val)
    tree.insert(val)
    puts "\n插入节点 #{val} 后，AVL 树为"
    print_tree(tree.get_root)
  end

  def test_remove(tree, val)
    tree.remove(val)
    puts "\n删除节点 #{val} 后，AVL 树为"
    print_tree(tree.get_root)
  end

  # 初始化空 AVL 树
  avl_tree = AVLTree.new

  # 插入节点
  # 请关注插入节点后，AVL 树是如何保持平衡的
  for val in [1, 2, 3, 4, 5, 8, 7, 9, 10, 6]
    test_insert(avl_tree, val)
  end

  # 插入重复节点
  test_insert(avl_tree, 7)

  # 删除节点
  # 请关注删除节点后，AVL 树是如何保持平衡的
  test_remove(avl_tree, 8) # 删除度为 0 的节点
  test_remove(avl_tree, 5) # 删除度为 1 的节点
  test_remove(avl_tree, 4) # 删除度为 2 的节点

  result_node = avl_tree.search(7)
  puts "\n查找到的节点对象为 #{result_node}，节点值 = #{result_node.val}"
end
