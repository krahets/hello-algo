=begin
File: array_binary_tree.rb
Created Time: 2024-04-17
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 以陣列表示二元樹的類別 ###
class ArrayBinaryTree
  ### 建構方法 ###
  def initialize(arr)
    @tree = arr.to_a
  end

  ### 串列長度 ###
  def size
    @tree.length
  end

  ### 取得索引 i 處的節點值 ###
  def val(i)
    # 若索引超出範圍，回傳 nil 表示空位
    return if i < 0 || i >= size

    @tree[i]
  end

  ### 取得索引 i 處節點的左子節點索引 ###
  def left(i)
    2 * i + 1
  end

  ### 取得索引 i 處節點的右子節點索引 ###
  def right(i)
    2 * i + 2
  end

  ### 取得索引 i 處節點的父節點索引 ###
  def parent(i)
    (i - 1) / 2
  end

  ### 層序走訪 ###
  def level_order
    @res = []

    # 直接走訪陣列
    for i in 0...size
      @res << val(i) unless val(i).nil?
    end

    @res
  end

  ### 深度優先走訪 ###
  def dfs(i, order)
    return if val(i).nil?
    # 前序走訪
    @res << val(i) if order == :pre
    dfs(left(i), order)
    # 中序走訪
    @res << val(i) if order == :in
    dfs(right(i), order)
    # 後序走訪
    @res << val(i) if order == :post
  end

  ### 前序走訪 ###
  def pre_order
    @res = []
    dfs(0, :pre)
    @res
  end

  ### 中序走訪 ###
  def in_order
    @res = []
    dfs(0, :in)
    @res
  end

  ### 後序走訪 ###
  def post_order
    @res = []
    dfs(0, :post)
    @res
  end
end

### 主程式 ###
if __FILE__ == $0
  # 初始化二元樹
  # 這裡使用能從陣列直接建立二元樹的函式
  arr = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
  root = arr_to_tree(arr)
  puts "\n初始化二元樹\n\n"
  puts '二元樹的陣列表示法：'
  pp arr
  puts '二元樹的鏈結串列表示法：'
  print_tree(root)

  # 以陣列表示二元樹的類別
  abt = ArrayBinaryTree.new(arr)

  # 存取節點
  i = 1
  l, r, _p = abt.left(i), abt.right(i), abt.parent(i)
  puts "\n目前節點的索引為 #{i}，值為 #{abt.val(i).inspect}"
  puts "其左子節點的索引為 #{l}，值為 #{abt.val(l).inspect}"
  puts "其右子節點的索引為 #{r}，值為 #{abt.val(r).inspect}"
  puts "其父節點的索引為 #{_p}，值為 #{abt.val(_p).inspect}"

  # 走訪樹
  res = abt.level_order
  puts "\n層序走訪的結果： #{res}"
  res = abt.pre_order
  puts "前序走訪的結果： #{res}"
  res = abt.in_order
  puts "中序走訪的結果： #{res}"
  res = abt.post_order
  puts "後序走訪的結果： #{res}"
end
