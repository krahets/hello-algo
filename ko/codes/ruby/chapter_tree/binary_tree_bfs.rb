=begin
File: binary_tree_bfs.rb
Created Time: 2024-04-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 레벨 순서 순회 ###
def level_order(root)
  # 큐를 초기화하고 루트 노드를 넣는다
  queue = [root]
  # 순회 순서를 저장할 리스트를 초기화한다
  res = []
  while !queue.empty?
    node = queue.shift # 큐에서 꺼낸다
    res << node.val # 노드 값을 저장한다
    queue << node.left unless node.left.nil? # 왼쪽 자식 노드를 큐에 삽입한다
    queue << node.right unless node.right.nil? # 오른쪽 자식 노드를 큐에 삽입한다
  end
  res
end

### 실행 코드 ###
if __FILE__ == $0
  # 이진 트리 초기화
  # 여기서는 배열로부터 이진 트리를 바로 생성하는 함수를 사용한다
  root = arr_to_tree([1, 2, 3, 4, 5, 6, 7])
  puts "\n이진 트리 초기화\n\n"
  print_tree(root)

  # 레벨 순서 순회
  res = level_order(root)
  puts "\n레벨 순서 순회의 노드 출력 순서 = #{res}"
end
