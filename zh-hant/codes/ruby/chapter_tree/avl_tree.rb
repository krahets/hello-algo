=begin
File: avl_tree.rb
Created Time: 2024-04-17
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### AVL 樹 ###
class AVLTree
  ### 建構方法 ###
  def initialize
    @root = nil
  end

  ### 取得二元樹的根節點 ###
  def get_root
    @root
  end

  ### 取得節點高度 ###
  def height(node)
    # 空節點的高度為 -1，葉節點的高度為 0
    return node.height unless node.nil?

    -1
  end

  ### 更新節點高度 ###
  def update_height(node)
    # 節點高度等於最高子樹的高度加 1
    node.height = [height(node.left), height(node.right)].max + 1
  end

  ### 取得平衡因子 ###
  def balance_factor(node)
    # 空節點的平衡因子為 0
    return 0 if node.nil?

    # 節點的平衡因子 = 左子樹高度 - 右子樹高度
    height(node.left) - height(node.right)
  end

  ### 右旋操作 ###
  def right_rotate(node)
    child = node.left
    grand_child = child.right
    # 以 child 為支點，將 node 向右旋轉
    child.right = node
    node.left = grand_child
    # 更新節點高度
    update_height(node)
    update_height(child)
    # 回傳旋轉後的子樹根節點
    child
  end

  ### 左旋操作 ###
  def left_rotate(node)
    child = node.right
    grand_child = child.left
    # 以 child 為支點，將 node 向左旋轉
    child.left = node
    node.right = grand_child
    # 更新節點高度
    update_height(node)
    update_height(child)
    # 回傳旋轉後的子樹根節點
    child
  end

  ### 透過旋轉讓這棵子樹恢復平衡 ###
  def rotate(node)
    # 取得節點 node 的平衡因子
    balance_factor = balance_factor(node)
    # 左偏樹
    if balance_factor > 1
      if balance_factor(node.left) >= 0
        # 右旋
        return right_rotate(node)
      else
        # 先左旋再右旋
        node.left = left_rotate(node.left)
        return right_rotate(node)
      end
    # 右偏樹
    elsif balance_factor < -1
      if balance_factor(node.right) <= 0
        # 左旋
        return left_rotate(node)
      else
        # 先右旋再左旋
        node.right = right_rotate(node.right)
        return left_rotate(node)
      end
    end
    # 樹已平衡，無須旋轉，直接返回
    node
  end

  ### 插入節點 ###
  def insert(val)
    @root = insert_helper(@root, val)
  end

  ### 以遞迴插入節點（輔助方法）###
  def insert_helper(node, val)
    return TreeNode.new(val) if node.nil?
    # 1. 找出插入位置並插入節點
    if val < node.val
      node.left = insert_helper(node.left, val)
    elsif val > node.val
      node.right = insert_helper(node.right, val)
    else
      # 若節點重複，直接返回，略過插入操作
      return node
    end
    # 更新節點高度
    update_height(node)
    # 2. 透過旋轉讓這棵子樹恢復平衡
    rotate(node)
  end

  ### 刪除節點 ###
  def remove(val)
    @root = remove_helper(@root, val)
  end

  ### 以遞迴刪除節點（輔助方法）###
  def remove_helper(node, val)
    return if node.nil?
    # 1. 找出並刪除節點
    if val < node.val
      node.left = remove_helper(node.left, val)
    elsif val > node.val
      node.right = remove_helper(node.right, val)
    else
      if node.left.nil? || node.right.nil?
        child = node.left || node.right
        # 若有 0 個子節點，直接刪除 node 並返回
        return if child.nil?
        # 若只有 1 個子節點，直接刪除 node
        node = child
      else
        # 若有 2 個子節點，刪除中序走訪的下一個節點，並用它的值取代目前節點的值
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
    # 2. 透過旋轉讓這棵子樹恢復平衡
    rotate(node)
  end

  ### 搜尋節點 ###
  def search(val)
    cur = @root
    # 用迴圈搜尋，越過葉節點後跳出迴圈
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
    # 回傳目標節點
    cur
  end
end

### 主程式 ###
if __FILE__ == $0
  def test_insert(tree, val)
    tree.insert(val)
    puts "\n插入節點 #{val} 後的 AVL 樹為"
    print_tree(tree.get_root)
  end

  def test_remove(tree, val)
    tree.remove(val)
    puts "\n刪除節點 #{val} 後的 AVL 樹為"
    print_tree(tree.get_root)
  end

  # 初始化一棵空的 AVL 樹
  avl_tree = AVLTree.new

  # 插入節點
  # 請觀察插入節點後 AVL 樹如何維持平衡
  for val in [1, 2, 3, 4, 5, 8, 7, 9, 10, 6]
    test_insert(avl_tree, val)
  end

  # 插入重複節點
  test_insert(avl_tree, 7)

  # 刪除節點
  # 請觀察刪除節點後 AVL 樹如何維持平衡
  test_remove(avl_tree, 8) # 刪除分支度為 0 的節點
  test_remove(avl_tree, 5) # 刪除分支度為 1 的節點
  test_remove(avl_tree, 4) # 刪除分支度為 2 的節點

  result_node = avl_tree.search(7)
  puts "\n找到的節點物件為 #{result_node}，節點值 = #{result_node.val}"
end
