=begin
File: array_binary_tree.rb
Created Time: 2024-04-17
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 配列で表した二分木クラス ###
class ArrayBinaryTree
  ### コンストラクタ ###
  def initialize(arr)
    @tree = arr.to_a
  end

  ### リストの容量 ###
  def size
    @tree.length
  end

  ### インデックス i のノードの値を取得する ###
  def val(i)
    # インデックスが範囲外の場合、空きを表す nil を返す
    return if i < 0 || i >= size

    @tree[i]
  end

  ### インデックス i のノードの左の子ノードのインデックスを取得する ###
  def left(i)
    2 * i + 1
  end

  ### インデックス i のノードの右の子ノードのインデックスを取得する ###
  def right(i)
    2 * i + 2
  end

  ### インデックス i のノードの親ノードのインデックスを取得する ###
  def parent(i)
    (i - 1) / 2
  end

  ### レベル順走査 ###
  def level_order
    @res = []

    # 配列をそのまま走査する
    for i in 0...size
      @res << val(i) unless val(i).nil?
    end

    @res
  end

  ### 深さ優先走査 ###
  def dfs(i, order)
    return if val(i).nil?
    # 行きがけ順走査
    @res << val(i) if order == :pre
    dfs(left(i), order)
    # 通りがけ順走査
    @res << val(i) if order == :in
    dfs(right(i), order)
    # 帰りがけ順走査
    @res << val(i) if order == :post
  end

  ### 行きがけ順走査 ###
  def pre_order
    @res = []
    dfs(0, :pre)
    @res
  end

  ### 通りがけ順走査 ###
  def in_order
    @res = []
    dfs(0, :in)
    @res
  end

  ### 帰りがけ順走査 ###
  def post_order
    @res = []
    dfs(0, :post)
    @res
  end
end

### 実行用コード ###
if __FILE__ == $0
  # 二分木を初期化する
  # ここでは配列から二分木を直接生成する関数を使う
  arr = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
  root = arr_to_tree(arr)
  puts "\n二分木を初期化する\n\n"
  puts '二分木の配列表現：'
  pp arr
  puts '二分木の連結リスト表現：'
  print_tree(root)

  # 配列で表した二分木クラス
  abt = ArrayBinaryTree.new(arr)

  # ノードにアクセスする
  i = 1
  l, r, _p = abt.left(i), abt.right(i), abt.parent(i)
  puts "\n現在のノードのインデックスは #{i} 、値は #{abt.val(i).inspect}"
  puts "左の子ノードのインデックスは #{l} 、値は #{abt.val(l).inspect}"
  puts "右の子ノードのインデックスは #{r} 、値は #{abt.val(r).inspect}"
  puts "親ノードのインデックスは #{_p} 、値は #{abt.val(_p).inspect}"

  # 木を走査する
  res = abt.level_order
  puts "\nレベル順走査： #{res}"
  res = abt.pre_order
  puts "行きがけ順走査： #{res}"
  res = abt.in_order
  puts "通りがけ順走査： #{res}"
  res = abt.post_order
  puts "帰りがけ順走査： #{res}"
end
