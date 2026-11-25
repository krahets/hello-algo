=begin
File: binary_tree_bfs.rb
Created Time: 2024-04-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 層序走訪 ###
def level_order(root)
  # 初始化佇列並加入根節點
  queue = [root]
  # 初始化一個串列，用來儲存走訪序列
  res = []
  while !queue.empty?
    node = queue.shift # 從佇列前端取出節點
    res << node.val # 儲存節點值
    queue << node.left unless node.left.nil? # 將左子節點加入佇列
    queue << node.right unless node.right.nil? # 將右子節點加入佇列
  end
  res
end

### 主程式 ###
if __FILE__ == $0
  # 初始化二元樹
  # 這裡使用能從陣列直接建立二元樹的函式
  root = arr_to_tree([1, 2, 3, 4, 5, 6, 7])
  puts "\n初始化二元樹\n\n"
  print_tree(root)

  # 層序走訪
  res = level_order(root)
  puts "\n依層序走訪印出的節點序列 = #{res}"
end
