=begin
File: avl_tree.rb
Created Time: 2024-04-17
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### AVL 樹 ###
class AVLTree
  ### 建構子 ###
  def initialize
    @root = nil
  end

  ### 獲取二元樹根節點 ###
  def get_root
    @root
  end

  ### 獲取節點高度 ###
  def height(node)
    # 空節點高度為 -1 ，葉節點高度為 0
    return node.height unless node.nil?

    -1
  end

  ### 更新節點高度 ###
  def update_height(node)
    # 節點高度等於最高子樹高度 + 1
    node.height = [height(node.left), height(node.right)].max + 1
  end

  ### 獲取平衡因子 ###
  def balance_factor(node)
    # 空節點平衡因子為 0
    return 0 if node.nil?

    # 節點平衡因子 = 左子樹高度 - 右子樹高度
    height(node.left) - height(node.right)
  end

  ### 右旋操作 ###
  def right_rotate(node)
    child = node.left
    grand_child = child.right
    # 以 child 為原點，將 node 向右旋轉
    child.right = node
    node.left = grand_child
    # 更新節點高度
    update_height(node)
    update_height(child)
    # 返回旋轉後子樹的根節點
    child
  end

  ### 左旋操作 ###
  def left_rotate(node)
    child = node.right
    grand_child = child.left
    # 以 child 為原點，將 node 向左旋轉
    child.left = node
    node.right = grand_child
    # 更新節點高度
    update_height(node)
    update_height(child)
    # 返回旋轉後子樹的根節點
    child
  end

  ### 執行旋轉操作，使該子樹重新恢復平衡 ###
  def rotate(node)
    # 獲取節點 node 的平衡因子
    balance_factor = balance_factor(node)
    # 左遍樹
    if balance_factor > 1
      if balance_factor(node.left) >= 0
        # 右旋
        return right_rotate(node)
      else
        # 先左旋後右旋
        node.left = left_rotate(node.left)
        return right_rotate(node)
      end
    # 右遍樹
    elsif balance_factor < -1
      if balance_factor(node.right) <= 0
        # 左旋
        return left_rotate(node)
      else
        # 先右旋後左旋
        node.right = right_rotate(node.right)
        return left_rotate(node)
      end
    end
    # 平衡樹，無須旋轉，直接返回
    node
  end

  ### 插入節點 ###
  def insert(val)
    @root = insert_helper(@root, val)
  end

  ### 遞迴插入節點（輔助方法）###
  def insert_helper(node, val)
    return TreeNode.new(val) if node.nil?
    # 1. 查詢插入位置並插入節點
    if val < node.val
      node.left = insert_helper(node.left, val)
    elsif val > node.val
      node.right = insert_helper(node.right, val)
    else
      # 重複節點不插入，直接返回
      return node
    end
    # 更新節點高度
    update_height(node)
    # 2. 執行旋轉操作，使該子樹重新恢復平衡
    rotate(node)
  end

  ### 刪除節點 ###
  def remove(val)
    @root = remove_helper(@root, val)
  end

  ### 遞迴刪除節點（輔助方法）###
  def remove_helper(node, val)
    return if node.nil?
    # 1. 查詢節點並刪除
    if val < node.val
      node.left = remove_helper(node.left, val)
    elsif val > node.val
      node.right = remove_helper(node.right, val)
    else
      if node.left.nil? || node.right.nil?
        child = node.left || node.right
        # 子節點數量 = 0 ，直接刪除 node 並返回
        return if child.nil?
        # 子節點數量 = 1 ，直接刪除 node
        node = child
      else
        # 子節點數量 = 2 ，則將中序走訪的下個節點刪除，並用該節點替換當前節點
        temp = node.right
        while !temp.left.nil?
          temp = temp.left
        end
        node.right = remove_helper(node.right, temp.val)
        node.val = temp.val
      end
    end
    # 更新節點高度
    update_height(node)
    # 2. 執行旋轉操作，使該子樹重新恢復平衡
    rotate(node)
  end

  ### 查詢節點 ###
  def search(val)
    cur = @root
    # 迴圈查詢，越過葉節點後跳出
    while !cur.nil?
      # 目標節點在 cur 的右子樹中
      if cur.val < val
        cur = cur.right
      # 目標節點在 cur 的左子樹中
      elsif cur.val > val
        cur = cur.left
      # 找到目標節點，跳出迴圈
      else
        break
      end
    end
    # 返回目標節點
    cur
  end
end

### Driver Code ###
if __FILE__ == $0
  def test_insert(tree, val)
    tree.insert(val)
    puts "\n插入節點 #{val} 後，AVL 樹為"
    print_tree(tree.get_root)
  end

  def test_remove(tree, val)
    tree.remove(val)
    puts "\n刪除節點 #{val} 後，AVL 樹為"
    print_tree(tree.get_root)
  end

  # 初始化空 AVL 樹
  avl_tree = AVLTree.new

  # 插入節點
  # 請關注插入節點後，AVL 樹是如何保持平衡的
  for val in [1, 2, 3, 4, 5, 8, 7, 9, 10, 6]
    test_insert(avl_tree, val)
  end

  # 插入重複節點
  test_insert(avl_tree, 7)

  # 刪除節點
  # 請關注刪除節點後，AVL 樹是如何保持平衡的
  test_remove(avl_tree, 8) # 刪除度為 0 的節點
  test_remove(avl_tree, 5) # 刪除度為 1 的節點
  test_remove(avl_tree, 4) # 刪除度為 2 的節點

  result_node = avl_tree.search(7)
  puts "\n查詢到的節點物件為 #{result_node}，節點值 = #{result_node.val}"
end
