=begin
File: array_binary_tree.rb
Created Time: 2024-04-17
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 数组表示下的二叉树类 ###
class ArrayBinaryTree
  ### 构造方法 ###
  def initialize(arr)
    @tree = arr.to_a
  end

  ### 列表容量 ###
  def size
    @tree.length
  end

  ### 获取索引为 i 节点的值 ###
  def val(i)
    # 若索引越界，则返回 nil ，代表空位
    return if i < 0 || i >= size

    @tree[i]
  end

  ### 获取索引为 i 节点的左子节点的索引 ###
  def left(i)
    2 * i + 1
  end

  ### 获取索引为 i 节点的右子节点的索引 ###
  def right(i)
    2 * i + 2
  end

  ### 获取索引为 i 节点的父节点的索引 ###
  def parent(i)
    (i - 1) / 2
  end

  ### 层序遍历 ###
  def level_order
    @res = []

    # 直接遍历数组
    for i in 0...size
      @res << val(i) unless val(i).nil?
    end

    @res
  end

  ### 深度优先遍历 ###
  def dfs(i, order)
    return if val(i).nil?
    # 前序遍历
    @res << val(i) if order == :pre
    dfs(left(i), order)
    # 中序遍历
    @res << val(i) if order == :in
    dfs(right(i), order)
    # 后序遍历
    @res << val(i) if order == :post
  end

  ### 前序遍历 ###
  def pre_order
    @res = []
    dfs(0, :pre)
    @res
  end

  ### 中序遍历 ###
  def in_order
    @res = []
    dfs(0, :in)
    @res
  end

  ### 后序遍历 ###
  def post_order
    @res = []
    dfs(0, :post)
    @res
  end
end

### Driver Code ###
if __FILE__ == $0
  # 初始化二叉树
  # 这里借助了一个从数组直接生成二叉树的函数
  arr = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
  root = arr_to_tree(arr)
  puts "\n初始化二叉树\n\n"
  puts '二叉树的数组表示：'
  pp arr
  puts '二叉树的链表表示：'
  print_tree(root)

  # 数组表示下的二叉树类
  abt = ArrayBinaryTree.new(arr)

  # 访问节点
  i = 1
  l, r, _p = abt.left(i), abt.right(i), abt.parent(i)
  puts "\n当前节点的索引为 #{i} ，值为 #{abt.val(i).inspect}"
  puts "其左子节点的索引为 #{l} ，值为 #{abt.val(l).inspect}"
  puts "其右子节点的索引为 #{r} ，值为 #{abt.val(r).inspect}"
  puts "其父节点的索引为 #{_p} ，值为 #{abt.val(_p).inspect}"

  # 遍历树
  res = abt.level_order
  puts "\n层序遍历为： #{res}"
  res = abt.pre_order
  puts "前序遍历为： #{res}"
  res = abt.in_order
  puts "中序遍历为： #{res}"
  res = abt.post_order
  puts "后序遍历为： #{res}"
end
