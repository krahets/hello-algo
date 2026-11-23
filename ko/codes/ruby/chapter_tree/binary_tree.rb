=begin
File: binary_tree.rb
Created Time: 2024-04-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 실행 코드 ###
if __FILE__ == $0
  # 이진 트리 초기화
  # 노드 초기화
  n1 = TreeNode.new(1)
  n2 = TreeNode.new(2)
  n3 = TreeNode.new(3)
  n4 = TreeNode.new(4)
  n5 = TreeNode.new(5)
  # 노드 사이의 참조(포인터)를 설정한다
  n1.left = n2
  n1.right = n3
  n2.left = n4
  n2.right = n5
  puts "\n이진 트리 초기화\n\n"
  print_tree(n1)

  # 노드 삽입과 삭제
  _p = TreeNode.new(0)
  # n1 -> n2 사이에 노드 _p를 삽입한다
  n1.left = _p
  _p.left = n2
  puts "\n노드 _p를 삽입한 후\n\n"
  print_tree(n1)
  # 노드 삭제
  n1.left = n2
  puts "\n노드 _p를 삭제한 후\n\n"
  print_tree(n1)
end
