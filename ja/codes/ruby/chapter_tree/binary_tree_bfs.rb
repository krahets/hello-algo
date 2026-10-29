=begin
File: binary_tree_bfs.rb
Created Time: 2024-04-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### レベル順走査 ###
def level_order(root)
  # キューを初期化し、根ノードを追加する
  queue = [root]
  # 走査順序を保存するリストを初期化する
  res = []
  while !queue.empty?
    node = queue.shift # キューからデキューする
    res << node.val # ノードの値を保存する
    queue << node.left unless node.left.nil? # 左の子ノードをエンキューする
    queue << node.right unless node.right.nil? # 右の子ノードをエンキューする
  end
  res
end

### 実行用コード ###
if __FILE__ == $0
  # 二分木を初期化する
  # ここでは配列から二分木を直接生成する関数を使う
  root = arr_to_tree([1, 2, 3, 4, 5, 6, 7])
  puts "\n二分木を初期化する\n\n"
  print_tree(root)

  # レベル順走査
  res = level_order(root)
  puts "\nレベル順走査で表示するノードの順序 = #{res}"
end
