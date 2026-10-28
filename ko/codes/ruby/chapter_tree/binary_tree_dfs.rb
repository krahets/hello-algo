=begin
File: binary_tree_dfs.rb
Created Time: 2024-04-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 전위 순회 ###
def pre_order(root)
  return if root.nil?

  # 방문 우선순위: 루트 노드 -> 왼쪽 서브트리 -> 오른쪽 서브트리
  $res << root.val
  pre_order(root.left)
  pre_order(root.right)
end

### 중위 순회 ###
def in_order(root)
  return if root.nil?

  # 방문 우선순위: 왼쪽 서브트리 -> 루트 노드 -> 오른쪽 서브트리
  in_order(root.left)
  $res << root.val
  in_order(root.right)
end

### 후위 순회 ###
def post_order(root)
  return if root.nil?

  # 방문 우선순위: 왼쪽 서브트리 -> 오른쪽 서브트리 -> 루트 노드
  post_order(root.left)
  post_order(root.right)
  $res << root.val
end

### 실행 코드 ###
if __FILE__ == $0
  # 이진 트리 초기화
  # 여기서는 배열로부터 이진 트리를 바로 생성하는 함수를 사용한다
  root = arr_to_tree([1, 2, 3, 4, 5, 6, 7])
  puts "\n이진 트리 초기화\n\n"
  print_tree(root)

  # 전위 순회
  $res = []
  pre_order(root)
  puts "\n전위 순회의 노드 출력 순서 = #{$res}"

  # 중위 순회
  $res.clear
  in_order(root)
  puts "\nn중위 순회의 노드 출력 순서 = #{$res}"

  # 후위 순회
  $res.clear
  post_order(root)
  puts "\nn후위 순회의 노드 출력 순서 = #{$res}"
end
