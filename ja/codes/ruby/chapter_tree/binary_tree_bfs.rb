=begin
File: binary_tree_bfs.rb
Created Time: 2024-04-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### レベル順走査 ###
def level_order(root)
  # キューを初期化し、ルートノードを追加する
  queue = [root]
  # 走査順序を保存するためのリストを初期化する
  res = []
  while !queue.empty?
    node = queue.shift # デキュー
    res << node.val # ノードの値を保存する
    queue << node.left unless node.left.nil? # 左子ノードをキューに追加
    queue << node.right unless node.right.nil? # 右子ノードをキューに追加
  end
  res
end

### Driver Code ###
if __FILE__ == $0
  # 二分木を初期化
  # ここでは、配列から直接二分木を生成する関数を利用する
  root = arr_to_tree([1, 2, 3, 4, 5, 6, 7])
  puts "\n二分木を初期化\n\n"
  print_tree(root)

  # レベル順走査
  res = level_order(root)
  puts "\nレベル順走査のノード出力順 = #{res}"
end
