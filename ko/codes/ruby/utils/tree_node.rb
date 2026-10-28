=begin
File: tree_node.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 이진 트리 노드 클래스 ###
class TreeNode
  attr_accessor :val    # 노드 값
  attr_accessor :height # 노드 높이
  attr_accessor :left   # 왼쪽 자식 노드 참조
  attr_accessor :right  # 오른쪽 자식 노드 참조

  def initialize(val=0)
    @val = val
    @height = 0
  end
end

### 리스트를 이진 트리로 역직렬화: 재귀 ###
def arr_to_tree_dfs(arr, i)
  # 인덱스가 배열 범위를 벗어나거나 해당 원소가 nil이면 nil을 반환한다
  return if i < 0 || i >= arr.length || arr[i].nil?
  # 현재 노드를 생성한다
  root = TreeNode.new(arr[i])
  # 왼쪽과 오른쪽 서브트리를 재귀적으로 구성한다
  root.left = arr_to_tree_dfs(arr, 2 * i + 1)
  root.right = arr_to_tree_dfs(arr, 2 * i + 2)
  root
end

### 리스트를 이진 트리로 역직렬화 ###
def arr_to_tree(arr)
  arr_to_tree_dfs(arr, 0)
end

### 이진 트리를 리스트로 직렬화: 재귀 ###
def tree_to_arr_dfs(root, i, res)
  return if root.nil?

  res += Array.new(i - res.length + 1) if i >= res.length
  res[i] = root.val

  tree_to_arr_dfs(root.left, 2 * i + 1, res)
  tree_to_arr_dfs(root.right, 2 * i + 2, res)
end

### 이진 트리를 리스트로 직렬화 ###
def tree_to_arr(root)
  res = []
  tree_to_arr_dfs(root, 0, res)
  res
end
