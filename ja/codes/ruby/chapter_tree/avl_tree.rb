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

  ### 二分木の根を取得する ###
  def get_root
    @root
  end

  ### ノードの高さを取得する ###
  def height(node)
    # 空のノードの高さは -1、葉の高さは 0
    return node.height unless node.nil?

    -1
  end

  ### ノードの高さを更新する ###
  def update_height(node)
    # ノードの高さは、左右の部分木の高さの最大値 + 1
    node.height = [height(node.left), height(node.right)].max + 1
  end

  ### 平衡係数を取得する ###
  def balance_factor(node)
    # 空のノードの平衡係数は 0
    return 0 if node.nil?

    # ノードの平衡係数 = 左部分木の高さ - 右部分木の高さ
    height(node.left) - height(node.right)
  end

  ### 右回転 ###
  def right_rotate(node)
    child = node.left
    grand_child = child.right
    # child を軸に node を右回転する
    child.right = node
    node.left = grand_child
    # ノードの高さを更新する
    update_height(node)
    update_height(child)
    # 回転後の部分木の根を返す
    child
  end

  ### 左回転 ###
  def left_rotate(node)
    child = node.right
    grand_child = child.left
    # child を軸に node を左回転する
    child.left = node
    node.right = grand_child
    # ノードの高さを更新する
    update_height(node)
    update_height(child)
    # 回転後の部分木の根を返す
    child
  end

  ### 回転して部分木の平衡を回復する ###
  def rotate(node)
    # ノード node の平衡係数を取得する
    balance_factor = balance_factor(node)
    # 左に偏った木
    if balance_factor > 1
      if balance_factor(node.left) >= 0
        # 右回転
        return right_rotate(node)
      else
        # 左回転してから右回転
        node.left = left_rotate(node.left)
        return right_rotate(node)
      end
    # 右に偏った木
    elsif balance_factor < -1
      if balance_factor(node.right) <= 0
        # 左回転
        return left_rotate(node)
      else
        # 右回転してから左回転
        node.right = right_rotate(node.right)
        return left_rotate(node)
      end
    end
    # 平衡なので回転せずに戻る
    node
  end

  ### ノードを挿入する ###
  def insert(val)
    @root = insert_helper(@root, val)
  end

  ### 再帰によるノードの挿入（補助メソッド）###
  def insert_helper(node, val)
    return TreeNode.new(val) if node.nil?
    # 1. 挿入位置を探してノードを挿入する
    if val < node.val
      node.left = insert_helper(node.left, val)
    elsif val > node.val
      node.right = insert_helper(node.right, val)
    else
      # 値が重複する場合は挿入せずに戻る
      return node
    end
    # ノードの高さを更新する
    update_height(node)
    # 2. 回転して部分木の平衡を回復する
    rotate(node)
  end

  ### ノードを削除する ###
  def remove(val)
    @root = remove_helper(@root, val)
  end

  ### 再帰によるノードの削除（補助メソッド）###
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
        # 子が 0 個なら node を削除して戻る
        return if child.nil?
        # 子が 1 個なら node を削除する
        node = child
      else
        # 子が 2 個なら通りがけ順で次のノードを削除し、その値で現在のノードの値を置き換える
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
    # 2. 回転して部分木の平衡を回復する
    rotate(node)
  end

  ### ノードを探索する ###
  def search(val)
    cur = @root
    # ループで探索し、葉を越えたら終了する
    while !cur.nil?
      # 目的のノードは cur の右部分木にある
      if cur.val < val
        cur = cur.right
      # 目的のノードは cur の左部分木にある
      elsif cur.val > val
        cur = cur.left
      # 目的のノードが見つかったのでループを抜ける
      else
        break
      end
    end
    # 目的のノードを返す
    cur
  end
end

### 実行例 ###
if __FILE__ == $0
  def test_insert(tree, val)
    tree.insert(val)
    puts "\nノード #{val} を挿入した後の AVL 木："
    print_tree(tree.get_root)
  end

  def test_remove(tree, val)
    tree.remove(val)
    puts "\nノード #{val} を削除した後の AVL 木："
    print_tree(tree.get_root)
  end

  # 空の AVL 木を初期化する
  avl_tree = AVLTree.new

  # ノードを挿入する
  # 挿入後に AVL 木がどのように平衡を保つかに注目
  for val in [1, 2, 3, 4, 5, 8, 7, 9, 10, 6]
    test_insert(avl_tree, val)
  end

  # 重複するノードを挿入する
  test_insert(avl_tree, 7)

  # ノードを削除する
  # 削除後に AVL 木がどのように平衡を保つかに注目
  test_remove(avl_tree, 8) # 子が 0 個のノードを削除する
  test_remove(avl_tree, 5) # 子が 1 個のノードを削除する
  test_remove(avl_tree, 4) # 子が 2 個のノードを削除する

  result_node = avl_tree.search(7)
  puts "\n見つかったノードのオブジェクト：#{result_node}、値 = #{result_node.val}"
end
