=begin
File: preorder_traversal_iii_template.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 현재 상태가 해인지 판단 ###
def is_solution?(state)
  !state.empty? && state.last.val == 7
end

### 해를 기록한다 ###
def record_solution(state, res)
  res << state.dup
end

### 현재 상태에서 해당 선택이 유효한지 판단 ###
def is_valid?(state, choice)
  choice && choice.val != 3
end

### 상태 갱신 ###
def make_choice(state, choice)
  state << choice
end

### 상태 복원 ###
def undo_choice(state, choice)
  state.pop
end

### 백트래킹 알고리즘: 예제 3 ###
def backtrack(state, choices, res)
  # 해인지 확인한다
  record_solution(state, res) if is_solution?(state)

  # 모든 선택지를 순회한다
  for choice in choices
    # 가지치기: 선택이 유효한지 확인한다
    if is_valid?(state, choice)
      # 시도: 선택하고 상태를 갱신한다
      make_choice(state, choice)
      # 다음 선택을 진행한다
      backtrack(state, [choice.left, choice.right], res)
      # 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
      undo_choice(state, choice)
    end
  end
end

### 실행 코드 ###
if __FILE__ == $0
  root = arr_to_tree([1, 7, 3, 4, 5, 6, 7])
  puts "\n이진 트리 초기화"
  print_tree(root)

  # 백트래킹 알고리즘
  res = []
  backtrack([], [root], res)

  puts "\n값이 3인 노드를 포함하지 않는 조건으로, 루트 노드에서 노드 7까지의 모든 경로 출력"
  for path in res
    p path.map { |node| node.val }
  end
end
