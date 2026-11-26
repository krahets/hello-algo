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

  ### 二分木の根を取得する ###
  def get_root
    @root
  end

  ### ノードを探索する ###
  def search(num)
    cur = @root

    # ループで探索し、葉を越えたら終了する
    while !cur.nil?
      # 目的のノードは cur の右部分木にある
      if cur.val < num
        cur = cur.right
      # 目的のノードは cur の左部分木にある
      elsif cur.val > num
        cur = cur.left
      # 目的のノードが見つかったのでループを抜ける
      else
        break
      end
    end

    cur
  end

  ### ノードを挿入する ###
  def insert(num)
    # 木が空なら根を初期化する
    if @root.nil?
      @root = TreeNode.new(num)
      return
    end

    # ループで探索し、葉を越えたら終了する
    cur, pre = @root, nil
    while !cur.nil?
      # 値が重複するノードが見つかったらそのまま戻る
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

    # ノードを挿入する
    node = TreeNode.new(num)
    if pre.val < num
      pre.right = node
    else
      pre.left = node
    end
  end

  ### ノードを削除する ###
  def remove(num)
    # 木が空ならすぐに戻る
    return if @root.nil?

    # ループで探索し、葉を越えたら終了する
    cur, pre = @root, nil
    while !cur.nil?
      # 削除対象のノードが見つかったのでループを抜ける
      break if cur.val == num

      pre = cur
      # 削除対象は cur の右部分木にある
      if cur.val < num
        cur = cur.right
      # 削除対象は cur の左部分木にある
      else
        cur = cur.left
      end
    end
    # 削除対象が見つからなければそのまま戻る
    return if cur.nil?

    # 子が 0 個または 1 個
    if cur.left.nil? || cur.right.nil?
      # 子が 0 個なら child = null、1 個なら child はその子
      child = cur.left || cur.right
      # ノード cur を削除する
      if cur != @root
        if pre.left == cur
          pre.left = child
        else
          pre.right = child
        end
      else
        # 削除対象が根なら根を設定し直す
        @root = child
      end
    # 子が 2 個
    else
      # 通りがけ順で cur の次に来るノードを取得する
      tmp = cur.right
      while !tmp.left.nil?
        tmp = tmp.left
      end
      # ノード tmp を再帰的に削除する
      remove(tmp.val)
      # tmp の値で cur の値を上書きする
      cur.val = tmp.val
    end
  end
end

### 実行例 ###
if __FILE__ == $0
  # 二分探索木を初期化する
  bst = BinarySearchTree.new
  nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]
  # 挿入順によって木の形は変わる。この順に挿入すると完璧二分木になる
  nums.each { |num| bst.insert(num) }
  puts "\n初期化した二分木：\n"
  print_tree(bst.get_root)

  # ノードを探索する
  node = bst.search(7)
  puts "\n見つかったノードのオブジェクト：#{node}、値 = #{node.val}"

  # ノードを挿入する
  bst.insert(16)
  puts "\nノード 16 を挿入した後の二分木：\n"
  print_tree(bst.get_root)

  # ノードを削除する
  bst.remove(1)
  puts "\nノード 1 を削除した後の二分木：\n"
  print_tree(bst.get_root)

  bst.remove(2)
  puts "\nノード 2 を削除した後の二分木：\n"
  print_tree(bst.get_root)

  bst.remove(4)
  puts "\nノード 4 を削除した後の二分木：\n"
  print_tree(bst.get_root)
end
