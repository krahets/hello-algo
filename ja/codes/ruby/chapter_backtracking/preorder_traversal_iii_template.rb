=begin
File: preorder_traversal_iii_template.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 現在の状態が解かを判定 ###
def is_solution?(state)
  !state.empty? && state.last.val == 7
end

### 解を記録する ###
def record_solution(state, res)
  res << state.dup
end

### 現在の状態でこの選択が有効か判定 ###
def is_valid?(state, choice)
  choice && choice.val != 3
end

### 状態を更新する ###
def make_choice(state, choice)
  state << choice
end

### 状態を復元する ###
def undo_choice(state, choice)
  state.pop
end

### バックトラッキング：例題 3 ###
def backtrack(state, choices, res)
  # 解かを確認
  record_solution(state, res) if is_solution?(state)

  # すべての選択肢を走査する
  for choice in choices
    # 枝刈り：選択が有効か確認
    if is_valid?(state, choice)
      # 試行：選択を行い、状態を更新する
      make_choice(state, choice)
      # 次の選択に進む
      backtrack(state, [choice.left, choice.right], res)
      # 復元：選択を取り消し、以前の状態に戻す
      undo_choice(state, choice)
    end
  end
end

### 実行用コード ###
if __FILE__ == $0
  root = arr_to_tree([1, 7, 3, 4, 5, 6, 7])
  puts "\n二分木を初期化する"
  print_tree(root)

  # バックトラッキング
  res = []
  backtrack([], [root], res)

  puts "\n値が 3 のノードを含まない、根ノードからノード 7 までのすべての経路を出力する"
  for path in res
    p path.map { |node| node.val }
  end
end
