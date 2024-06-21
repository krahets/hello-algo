=begin
File: array_binary_tree.rb
Created Time: 2024-04-17
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 陣列表示下的二元樹類別 ###
class ArrayBinaryTree
  ### 建構子 ###
  def initialize(arr)
    @tree = arr.to_a
  end

  ### 串列容量 ###
  def size
    @tree.length
  end

  ### 獲取索引為 i 節點的值 ###
  def val(i)
    # 若索引越界，則返回 nil ，代表空位
    return if i < 0 || i >= size

    @tree[i]
  end

  ### 獲取索引為 i 節點的左子節點的索引 ###
  def left(i)
    2 * i + 1
  end

  ### 獲取索引為 i 節點的右子節點的索引 ###
  def right(i)
    2 * i + 2
  end

  ### 獲取索引為 i 節點的父節點的索引 ###
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

### Driver Code ###
if __FILE__ == $0
  # 初始化二元樹
  # 這裡藉助了一個從陣列直接生成二元樹的函式
  arr = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
  root = arr_to_tree(arr)
  puts "\n初始化二元樹\n\n"
  puts '二元樹的陣列表示：'
  pp arr
  puts '二元樹的鏈結串列表示：'
  print_tree(root)

  # 陣列表示下的二元樹類別
  abt = ArrayBinaryTree.new(arr)

  # 訪問節點
  i = 1
  l, r, _p = abt.left(i), abt.right(i), abt.parent(i)
  puts "\n當前節點的索引為 #{i} ，值為 #{abt.val(i).inspect}"
  puts "其左子節點的索引為 #{l} ，值為 #{abt.val(l).inspect}"
  puts "其右子節點的索引為 #{r} ，值為 #{abt.val(r).inspect}"
  puts "其父節點的索引為 #{_p} ，值為 #{abt.val(_p).inspect}"

  # 走訪樹
  res = abt.level_order
  puts "\n層序走訪為： #{res}"
  res = abt.pre_order
  puts "前序走訪為： #{res}"
  res = abt.in_order
  puts "中序走訪為： #{res}"
  res = abt.post_order
  puts "後序走訪為： #{res}"
end
