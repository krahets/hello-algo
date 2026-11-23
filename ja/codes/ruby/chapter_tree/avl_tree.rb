=begin
File: avl_tree.rb
Created Time: 2024-04-17
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### AVL 木 ###
class AVLTree
  ### コンストラクタ ###
  def initialize
    @root = nil
  end

  ### 二分木の根ノードを取得する ###
  def get_root
    @root
  end

  ### ノードの高さを取得する ###
  def height(node)
    # 空ノードの高さは -1 、葉ノードの高さは 0
    return node.height unless node.nil?

    -1
  end

  ### ノードの高さを更新する ###
  def update_height(node)
    # ノードの高さは、最も高い部分木の高さ + 1
    node.height = [height(node.left), height(node.right)].max + 1
  end

  ### 平衡係数を取得する ###
  def balance_factor(node)
    # 空ノードの平衡係数は 0
    return 0 if node.nil?

    # ノードの平衡係数 = 左部分木の高さ - 右部分木の高さ
    height(node.left) - height(node.right)
  end

  ### 右回転操作 ###
  def right_rotate(node)
    child = node.left
    grand_child = child.right
    # child を中心に node を右回転する
    child.right = node
    node.left = grand_child
    # ノードの高さを更新する
    update_height(node)
    update_height(child)
    # 回転後の部分木の根ノードを返す
    child
  end

  ### 左回転操作 ###
  def left_rotate(node)
    child = node.right
    grand_child = child.left
    # child を中心に node を左回転する
    child.left = node
    node.right = grand_child
    # ノードの高さを更新する
    update_height(node)
    update_height(child)
    # 回転後の部分木の根ノードを返す
    child
  end

  ### 回転操作によって、この部分木の平衡を回復する ###
  def rotate(node)
    # ノード node の平衡係数を取得する
    balance_factor = balance_factor(node)
    # 左に偏った木
    if balance_factor > 1
      if balance_factor(node.left) >= 0
        # 右回転
        return right_rotate(node)
      else
        # 左回転してから右回転する
        node.left = left_rotate(node.left)
        return right_rotate(node)
      end
    # 右に偏った木
    elsif balance_factor < -1
      if balance_factor(node.right) <= 0
        # 左回転
        return left_rotate(node)
      else
        # 右回転してから左回転する
        node.right = right_rotate(node.right)
        return left_rotate(node)
      end
    end
    # 平衡な木なので、回転せずにそのまま返す
    node
  end

  ### ノードを挿入する ###
  def insert(val)
    @root = insert_helper(@root, val)
  end

  ### ノードを再帰的に挿入する（補助メソッド）###
  def insert_helper(node, val)
    return TreeNode.new(val) if node.nil?
    # 1. 挿入位置を探してノードを挿入する
    if val < node.val
      node.left = insert_helper(node.left, val)
    elsif val > node.val
      node.right = insert_helper(node.right, val)
    else
      # 重複したノードは挿入せず、そのまま戻る
      return node
    end
    # ノードの高さを更新する
    update_height(node)
    # 2. 回転操作によって、この部分木の平衡を回復する
    rotate(node)
  end

  ### ノードを削除する ###
  def remove(val)
    @root = remove_helper(@root, val)
  end

  ### ノードを再帰的に削除する（補助メソッド）###
  def remove_helper(node, val)
    return if node.nil?
    # 1. ノードを探して削除する
    if val < node.val
      node.left = remove_helper(node.left, val)
    elsif val > node.val
      node.right = remove_helper(node.right, val)
    else
      if node.left.nil? || node.right.nil?
        child = node.left || node.right
        # 子ノード数 = 0 の場合、node を削除して戻る
        return if child.nil?
        # 子ノード数 = 1 の場合、node を削除する
        node = child
      else
        # 子ノード数 = 2 の場合、通りがけ順で次のノードを削除し、そのノードで現在のノードを置き換える
        temp = node.right
        while !temp.left.nil?
          temp = temp.left
        end
        node.right = remove_helper(node.right, temp.val)
        node.val = temp.val
      end
    end
    # ノードの高さを更新する
    update_height(node)
    # 2. 回転操作によって、この部分木の平衡を回復する
    rotate(node)
  end

  ### ノードを探索する ###
  def search(val)
    cur = @root
    # 繰り返し探索し、葉ノードを越えたら終了する
    while !cur.nil?
      # 目的のノードは cur の右部分木にある
      if cur.val < val
        cur = cur.right
      # 目的のノードは cur の左部分木にある
      elsif cur.val > val
        cur = cur.left
      # 目的のノードが見つかったので、ループを終了する
      else
        break
      end
    end
    # 目的のノードを返す
    cur
  end
end

### 実行用コード ###
if __FILE__ == $0
  def test_insert(tree, val)
    tree.insert(val)
    puts "\nノード #{val} を挿入した後の AVL 木"
    print_tree(tree.get_root)
  end

  def test_remove(tree, val)
    tree.remove(val)
    puts "\nノード #{val} を削除した後の AVL 木"
    print_tree(tree.get_root)
  end

  # 空の AVL 木を初期化する
  avl_tree = AVLTree.new

  # ノードを挿入する
  # ノード挿入後、AVL 木がどのように平衡を保つかに注目する
  for val in [1, 2, 3, 4, 5, 8, 7, 9, 10, 6]
    test_insert(avl_tree, val)
  end

  # 重複したノードを挿入する
  test_insert(avl_tree, 7)

  # ノードを削除する
  # ノード削除後、AVL 木がどのように平衡を保つかに注目する
  test_remove(avl_tree, 8) # 次数 0 のノードを削除する
  test_remove(avl_tree, 5) # 次数 1 のノードを削除する
  test_remove(avl_tree, 4) # 次数 2 のノードを削除する

  result_node = avl_tree.search(7)
  puts "\n見つかったノードオブジェクトは #{result_node}、ノードの値 = #{result_node.val}"
end
