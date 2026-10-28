=begin
File: preorder_traversal_i_compact.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 전위 순회: 예제 1 ###
def pre_order(root)
  return unless root

  # 해를 기록한다
  $res << root if root.val == 7

  pre_order(root.left)
  pre_order(root.right)
end

### 실행 코드 ###
if __FILE__ == $0
  root = arr_to_tree([1, 7, 3, 4, 5, 6, 7])
  puts "\n이진 트리 초기화"
  print_tree(root)

  # 전위 순회
  $res = []
  pre_order(root)

  puts "\n값이 7인 모든 노드 출력"
  p $res.map { |node| node.val }
end
