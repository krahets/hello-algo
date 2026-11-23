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

  ### 二分木の根ノードを取得する ###
  def get_root
    @root
  end

  ### ノードを探索する ###
  def search(num)
    cur = @root

    # 繰り返し探索し、葉ノードを越えたら終了する
    while !cur.nil?
      # 目的のノードは cur の右部分木にある
      if cur.val < num
        cur = cur.right
      # 目的のノードは cur の左部分木にある
      elsif cur.val > num
        cur = cur.left
      # 目的のノードが見つかったので、ループを終了する
      else
        break
      end
    end

    cur
  end

  ### ノードを挿入する ###
  def insert(num)
    # 木が空の場合、根ノードを初期化する
    if @root.nil?
      @root = TreeNode.new(num)
      return
    end

    # 繰り返し探索し、葉ノードを越えたら終了する
    cur, pre = @root, nil
    while !cur.nil?
      # 重複したノードが見つかったので、そのまま戻る
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
    # 木が空の場合、そのまま早期リターンする
    return if @root.nil?

    # 繰り返し探索し、葉ノードを越えたら終了する
    cur, pre = @root, nil
    while !cur.nil?
      # 削除対象のノードが見つかったので、ループを終了する
      break if cur.val == num

      pre = cur
      # 削除対象のノードは cur の右部分木にある
      if cur.val < num
        cur = cur.right
      # 削除対象のノードは cur の左部分木にある
      else
        cur = cur.left
      end
    end
    # 削除対象のノードが存在しない場合、そのまま戻る
    return if cur.nil?

    # 子ノード数 = 0 または 1
    if cur.left.nil? || cur.right.nil?
      # 子ノード数 = 0 / 1 の場合、child = null / その子ノード
      child = cur.left || cur.right
      # ノード cur を削除する
      if cur != @root
        if pre.left == cur
          pre.left = child
        else
          pre.right = child
        end
      else
        # 削除するノードが根ノードの場合、根ノードを指定し直す
        @root = child
      end
    # 子ノード数 = 2
    else
      # 通りがけ順で cur の次のノードを取得する
      tmp = cur.right
      while !tmp.left.nil?
        tmp = tmp.left
      end
      # ノード tmp を再帰的に削除する
      remove(tmp.val)
      # tmp で cur を上書きする
      cur.val = tmp.val
    end
  end
end

### 実行用コード ###
if __FILE__ == $0
  # 二分探索木を初期化する
  bst = BinarySearchTree.new
  nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]
  # 挿入順序が異なると異なる二分木になることに注意。この順序ではパーフェクト二分木を生成できる
  nums.each { |num| bst.insert(num) }
  puts "\n初期化した二分木\n"
  print_tree(bst.get_root)

  # ノードを探索する
  node = bst.search(7)
  puts "\n見つかったノードオブジェクトは: #{node}、ノードの値 = #{node.val}"

  # ノードを挿入する
  bst.insert(16)
  puts "\nノード 16 を挿入した後の二分木\n"
  print_tree(bst.get_root)

  # ノードを削除する
  bst.remove(1)
  puts "\nノード 1 を削除した後の二分木\n"
  print_tree(bst.get_root)

  bst.remove(2)
  puts "\nノード 2 を削除した後の二分木\n"
  print_tree(bst.get_root)

  bst.remove(4)
  puts "\nノード 4 を削除した後の二分木\n"
  print_tree(bst.get_root)
end
