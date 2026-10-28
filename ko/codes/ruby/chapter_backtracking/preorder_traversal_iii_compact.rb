=begin
File: preorder_traversal_iii_compact.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 전위 순회: 예제 3 ###
def pre_order(root)
  # 가지치기
  return if !root || root.val == 3

  # 시도
  $path.append(root)

  # 해를 기록한다
  $res << $path.dup if root.val == 7

  pre_order(root.left)
  pre_order(root.right)

  # 되돌리기
  $path.pop
end

### 실행 코드 ###
if __FILE__ == $0
  root = arr_to_tree([1, 7, 3, 4, 5, 6, 7])
  puts "\n이진 트리 초기화"
  print_tree(root)

  # 전위 순회
  $path, $res = [], []
  pre_order(root)

  puts "\n루트 노드에서 노드 7까지의 모든 경로 출력. 경로에는 값이 3인 노드가 포함되지 않는다"
  for path in $res
    p path.map { |node| node.val }
  end
end
