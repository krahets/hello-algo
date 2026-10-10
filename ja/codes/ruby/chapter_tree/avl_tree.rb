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

  ### 二分木の根ノードを取得 ###
  def get_root
    @root
  end

  ### ノードの高さを取得 ###
  def height(node)
    # 空ノードの高さは -1、葉ノードの高さは 0
    return node.height unless node.nil?

    -1
  end

  ### ノードの高さを更新 ###
  def update_height(node)
    # ノードの高さは最も高い部分木の高さ + 1 に等しい
    node.height = [height(node.left), height(node.right)].max + 1
  end

  ### 平衡係数を取得 ###
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
    # child を支点として node を右回転させる
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
    # child を支点として node を左回転させる
    child.left = node
    node.right = grand_child
    # ノードの高さを更新する
    update_height(node)
    update_height(child)
    # 回転後の部分木の根ノードを返す
    child
  end

  ### 回転操作を行い、この部分木の平衡を回復する ###
  def rotate(node)
    # ノード node の平衡係数を取得
    balance_factor = balance_factor(node)
    # 左部分木をたどる
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
    # 平衡木なので回転不要、そのまま返す
    node
  end

  ### ノードを挿入 ###
  def insert(val)
    @root = insert_helper(@root, val)
  end

  # ## ノードを再帰的に挿入（補助メソッド）###
  def insert_helper(node, val)
    return TreeNode.new(val) if node.nil?
    # 1. 挿入位置を探索してノードを挿入
    if val < node.val
      node.left = insert_helper(node.left, val)
    elsif val > node.val
      node.right = insert_helper(node.right, val)
    else
      # 重複ノードは挿入せず、そのまま返す
      return node
    end
    # ノードの高さを更新する
    update_height(node)
    # 2. 回転操作を行い、部分木の平衡を回復する
    rotate(node)
  end

  ### ノードを削除 ###
  def remove(val)
    @root = remove_helper(@root, val)
  end

  # ## ノードを再帰的に削除（補助メソッド）###
  def remove_helper(node, val)
    return if node.nil?
    # 1. ノードを探索して削除
    if val < node.val
      node.left = remove_helper(node.left, val)
    elsif val > node.val
      node.right = remove_helper(node.right, val)
    else
      if node.left.nil? || node.right.nil?
        child = node.left || node.right
        # 子ノード数 = 0 の場合、node をそのまま削除して返す
        return if child.nil?
        # 子ノード数 = 1 の場合、node をそのまま削除する
        node = child
      else
        # 子ノード数 = 2 の場合、中順走査の次のノードを削除し、そのノードで現在のノードを置き換える
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
    # 2. 回転操作を行い、部分木の平衡を回復する
    rotate(node)
  end

  ### ノードを検索 ###
  def search(val)
    cur = @root
    # ループで探索し、葉ノードを越えたら抜ける
    while !cur.nil?
      # 目標ノードは cur の右部分木にある
      if cur.val < val
        cur = cur.right
      # 目標ノードは cur の左部分木にある
      elsif cur.val > val
        cur = cur.left
      # 目標ノードが見つかったらループを抜ける
      else
        break
      end
    end
    # 目標ノードを返す
    cur
  end
end

### Driver Code ###
if __FILE__ == $0
  def test_insert(tree, val)
    tree.insert(val)
    puts "\nノード #{val} を挿入した後、AVL 木は"
    print_tree(tree.get_root)
  end

  def test_remove(tree, val)
    tree.remove(val)
    puts "\nノード #{val} を削除した後、AVL 木は"
    print_tree(tree.get_root)
  end

  # 空の AVL 木を初期化する
  avl_tree = AVLTree.new

  # ノードを挿入する
  # ノード挿入後に AVL 木がどのように平衡を保つかに注目
  for val in [1, 2, 3, 4, 5, 8, 7, 9, 10, 6]
    test_insert(avl_tree, val)
  end

  # 重複ノードを挿入する
  test_insert(avl_tree, 7)

  # ノードを削除する
  # ノード削除後に AVL 木がどのように平衡を保つかに注目
  test_remove(avl_tree, 8) # 次数 0 のノードを削除する
  test_remove(avl_tree, 5) # 次数 1 のノードを削除する
  test_remove(avl_tree, 4) # 次数 2 のノードを削除する

  result_node = avl_tree.search(7)
  puts "\n見つかったノードオブジェクトは #{result_node}、ノードの値 = #{result_node.val}"
end
