=begin
File: tree_node.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 二分木のノードクラス ###
class TreeNode
  attr_accessor :val    # ノードの値
  attr_accessor :height # ノードの高さ
  attr_accessor :left   # 左の子ノードへの参照
  attr_accessor :right  # 右の子ノードへの参照

  def initialize(val=0)
    @val = val
    @height = 0
  end
end

### リストをデシリアライズして二分木にする：再帰 ###
def arr_to_tree_dfs(arr, i)
  # インデックスが配列の長さを超えるか、対応する要素が nil の場合、nil を返す
  return if i < 0 || i >= arr.length || arr[i].nil?
  # 現在のノードを構築する
  root = TreeNode.new(arr[i])
  # 左右の部分木を再帰的に構築する
  root.left = arr_to_tree_dfs(arr, 2 * i + 1)
  root.right = arr_to_tree_dfs(arr, 2 * i + 2)
  root
end

### リストから二分木へデシリアライズ ###
def arr_to_tree(arr)
  arr_to_tree_dfs(arr, 0)
end

### 二分木をシリアライズしてリストにする：再帰 ###
def tree_to_arr_dfs(root, i, res)
  return if root.nil?

  res += Array.new(i - res.length + 1) if i >= res.length
  res[i] = root.val

  tree_to_arr_dfs(root.left, 2 * i + 1, res)
  tree_to_arr_dfs(root.right, 2 * i + 2, res)
end

### 二分木をシリアライズしてリストにする ###
def tree_to_arr(root)
  res = []
  tree_to_arr_dfs(root, 0, res)
  res
end
