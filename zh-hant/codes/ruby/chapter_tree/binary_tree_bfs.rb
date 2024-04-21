=begin
File: binary_tree_bfs.rb
Created Time: 2024-04-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 層序走訪 ###
def level_order(root)
  # 初始化佇列，加入根節點
  queue = [root]
  # 初始化一個串列，用於儲存走訪序列
  res = []
  while !queue.empty?
    node = queue.shift # 隊列出隊
    res << node.val # 儲存節點值
    queue << node.left unless node.left.nil? # 左子節點入列
    queue << node.right unless node.right.nil? # 右子節點入列
  end
  res
end

### Driver Code ###
if __FILE__ == $0
  # 初始化二元樹
  # 這裡藉助了一個從陣列直接生成二元樹的函式
  root = arr_to_tree([1, 2, 3, 4, 5, 6, 7])
  puts "\n初始化二元樹\n\n"
  print_tree(root)

  # 層序走訪
  res = level_order(root)
  puts "\n層序走訪的節點列印序列 = #{res}"
end
