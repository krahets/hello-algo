=begin
File: build_tree.rb
Created Time: 2024-05-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 이진 트리 구성: 분할 정복 ###
def dfs(preorder, inorder_map, i, l, r)
  # 서브트리 구간이 비어 있으면 종료한다
  return if r - l < 0

  # 루트 노드를 초기화한다
  root = TreeNode.new(preorder[i])
  # m을 조회하여 왼쪽과 오른쪽 서브트리를 나눈다
  m = inorder_map[preorder[i]]
  # 부분 문제: 왼쪽 서브트리 구성
  root.left = dfs(preorder, inorder_map, i + 1, l, m - 1)
  # 부분 문제: 오른쪽 서브트리 구성
  root.right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r)

  # 루트 노드를 반환한다
  root
end

### 이진 트리 구성 ###
def build_tree(preorder, inorder)
  # inorder 원소와 인덱스의 대응 관계를 저장할 해시 테이블을 초기화한다
  inorder_map = {}
  inorder.each_with_index { |val, i| inorder_map[val] = i }
  dfs(preorder, inorder_map, 0, 0, inorder.length - 1)
end

### 실행 코드 ###
if __FILE__ == $0
  preorder = [3, 9, 2, 1, 7]
  inorder = [9, 3, 1, 2, 7]
  puts "전위 순회 = #{preorder}"
  puts "중위 순회 = #{inorder}"

  root = build_tree(preorder, inorder)
  puts "구성한 이진 트리:"
  print_tree(root)
end
