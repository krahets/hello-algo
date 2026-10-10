=begin
File: binary_search_tree.rb
Created Time: 2024-04-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 二分探索木 ###
class BinarySearchTree
  ### コンストラクタ ###
  def initialize
    # 空の木を初期化する
    @root = nil
  end

  ### 二分木の根ノードを取得 ###
  def get_root
    @root
  end

  ### ノードを検索 ###
  def search(num)
    cur = @root

    # ループで探索し、葉ノードを越えたら抜ける
    while !cur.nil?
      # 目標ノードは cur の右部分木にある
      if cur.val < num
        cur = cur.right
      # 目標ノードは cur の左部分木にある
      elsif cur.val > num
        cur = cur.left
      # 目標ノードが見つかったらループを抜ける
      else
        break
      end
    end

    cur
  end

  ### ノードを挿入 ###
  def insert(num)
    # 木が空なら、根ノードを初期化する
    if @root.nil?
      @root = TreeNode.new(num)
      return
    end

    # ループで探索し、葉ノードを越えたら抜ける
    cur, pre = @root, nil
    while !cur.nil?
      # 重複ノードが見つかったら、直ちに返す
      return if cur.val == num

      pre = cur
      # 挿入位置は cur の右部分木にある
      if cur.val < num
        cur = cur.right
      # 挿入位置は cur の左部分木にある
      else
        cur = cur.left
      end
    end

    # ノードを挿入
    node = TreeNode.new(num)
    if pre.val < num
      pre.right = node
    else
      pre.left = node
    end
  end

  ### ノードを削除 ###
  def remove(num)
    # 木が空なら、そのまま早期リターンする
    return if @root.nil?

    # ループで探索し、葉ノードを越えたら抜ける
    cur, pre = @root, nil
    while !cur.nil?
      # 削除対象のノードが見つかったら、ループを抜ける
      break if cur.val == num

      pre = cur
      # 削除対象ノードは cur の右部分木にある
      if cur.val < num
        cur = cur.right
      # 削除対象ノードは cur の左部分木にある
      else
        cur = cur.left
      end
    end
    # 削除対象ノードがなければそのまま返す
    return if cur.nil?

    # 子ノード数 = 0 or 1
    if cur.left.nil? || cur.right.nil?
      # 子ノード数が 0 / 1 のとき、child = null / その子ノード
      child = cur.left || cur.right
      # ノード cur を削除する
      if cur != @root
        if pre.left == cur
          pre.left = child
        else
          pre.right = child
        end
      else
        # 削除ノードが根ノードなら、根ノードを再設定
        @root = child
      end
    # 子ノード数 = 2
    else
      # 中順走査における cur の次ノードを取得
      tmp = cur.right
      while !tmp.left.nil?
        tmp = tmp.left
      end
      # ノード tmp を再帰的に削除
      remove(tmp.val)
      # tmp で cur を上書きする
      cur.val = tmp.val
    end
  end
end

### Driver Code ###
if __FILE__ == $0
  # 二分探索木を初期化
  bst = BinarySearchTree.new
  nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]
  # 注意：挿入順序が異なると異なる二分木が生成される。このシーケンスからは完全二分木を生成できる
  nums.each { |num| bst.insert(num) }
  puts "\n初期化された二分木は\n"
  print_tree(bst.get_root)

  # ノードを探索
  node = bst.search(7)
  puts "\n見つかったノードオブジェクトは: #{node}、ノードの値 = #{node.val}"

  # ノードを挿入
  bst.insert(16)
  puts "\nノード 16 を挿入した後、二分木は\n"
  print_tree(bst.get_root)

  # ノードを削除
  bst.remove(1)
  puts "\nノード 1 を削除した後、二分木は\n"
  print_tree(bst.get_root)

  bst.remove(2)
  puts "\nノード 2 を削除した後、二分木は\n"
  print_tree(bst.get_root)

  bst.remove(4)
  puts "\nノード 4 を削除した後、二分木は\n"
  print_tree(bst.get_root)
end
