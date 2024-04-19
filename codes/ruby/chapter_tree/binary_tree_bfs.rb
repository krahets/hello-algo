=begin
File: binary_tree_bfs.rb
Created Time: 2024-04-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 层序遍历 ###
def level_order(root)
  # 初始化队列，加入根节点
  queue = [root]
  # 初始化一个列表，用于保存遍历序列
  res = []
  while !queue.empty?
    node = queue.shift # 队列出队
    res << node.val # 保存节点值
    queue << node.left unless node.left.nil? # 左子节点入队
    queue << node.right unless node.right.nil? # 右子节点入队
  end
  res
end

### Driver Code ###
if __FILE__ == $0
  # 初始化二叉树
  # 这里借助了一个从数组直接生成二叉树的函数
  root = arr_to_tree([1, 2, 3, 4, 5, 6, 7])
  puts "\n初始化二叉树\n\n"
  print_tree(root)

  # 层序遍历
  res = level_order(root)
  puts "\n层序遍历的节点打印序列 = #{res}"
end
