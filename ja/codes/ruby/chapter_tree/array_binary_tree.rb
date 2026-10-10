=begin
File: array_binary_tree.rb
Created Time: 2024-04-17
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 配列表現の二分木クラス ###
class ArrayBinaryTree
  ### コンストラクタ ###
  def initialize(arr)
    @tree = arr.to_a
  end

  ### リスト容量 ###
  def size
    @tree.length
  end

  ### インデックス i のノードの値を取得 ###
  def val(i)
    # インデックスが範囲外なら `nil` を返し、空きスロットを表す
    return if i < 0 || i >= size

    @tree[i]
  end

  ### インデックス i のノードの左子ノードのインデックスを取得 ###
  def left(i)
    2 * i + 1
  end

  ### インデックス i のノードの右子ノードのインデックスを取得 ###
  def right(i)
    2 * i + 2
  end

  ### インデックス i のノードの親ノードのインデックスを取得 ###
  def parent(i)
    (i - 1) / 2
  end

  ### レベル順走査 ###
  def level_order
    @res = []

    # 配列を直接走査する
    for i in 0...size
      @res << val(i) unless val(i).nil?
    end

    @res
  end

  ### 深さ優先探索 ###
  def dfs(i, order)
    return if val(i).nil?
    # 先行順走査
    @res << val(i) if order == :pre
    dfs(left(i), order)
    # 中順走査
    @res << val(i) if order == :in
    dfs(right(i), order)
    # 後順走査
    @res << val(i) if order == :post
  end

  ### 前順走査 ###
  def pre_order
    @res = []
    dfs(0, :pre)
    @res
  end

  ### 中順走査 ###
  def in_order
    @res = []
    dfs(0, :in)
    @res
  end

  ### 後順走査 ###
  def post_order
    @res = []
    dfs(0, :post)
    @res
  end
end

### Driver Code ###
if __FILE__ == $0
  # 二分木を初期化
  # ここでは、配列から直接二分木を生成する関数を利用する
  arr = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
  root = arr_to_tree(arr)
  puts "\n二分木を初期化\n\n"
  puts '二分木の配列表現：'
  pp arr
  puts '二分木の連結リスト表現：'
  print_tree(root)

  # 配列表現による二分木クラス
  abt = ArrayBinaryTree.new(arr)

  # ノードにアクセス
  i = 1
  l, r, _p = abt.left(i), abt.right(i), abt.parent(i)
  puts "\n現在のノードのインデックスは #{i} ，値は #{abt.val(i).inspect}"
  puts "左の子ノードのインデックスは #{l} ，値は #{abt.val(l).inspect}"
  puts "右の子ノードのインデックスは #{r} ，値は #{abt.val(r).inspect}"
  puts "親ノードのインデックスは #{_p} ，値は #{abt.val(_p).inspect}"

  # 木を走査
  res = abt.level_order
  puts "\nレベル順走査の結果： #{res}"
  res = abt.pre_order
  puts "前順走査の結果： #{res}"
  res = abt.in_order
  puts "中順走査の結果： #{res}"
  res = abt.post_order
  puts "後順走査の結果： #{res}"
end
