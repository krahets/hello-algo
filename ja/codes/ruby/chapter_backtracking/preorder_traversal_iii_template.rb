=begin
File: preorder_traversal_iii_template.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 現在の状態が解かどうかを判定 ###
def is_solution?(state)
  !state.empty? && state.last.val == 7
end

### 解を記録 ###
def record_solution(state, res)
  res << state.dup
end

### 現在の状態で、この選択が妥当かを判定 ###
def is_valid?(state, choice)
  choice && choice.val != 3
end

### 状態を更新 ###
def make_choice(state, choice)
  state << choice
end

### 状態を復元 ###
def undo_choice(state, choice)
  state.pop
end

### バックトラッキング法：例題3 ###
def backtrack(state, choices, res)
  # 解かどうかを確認
  record_solution(state, res) if is_solution?(state)

  # すべての選択肢を走査
  for choice in choices
    # 枝刈り：選択が妥当かを確認する
    if is_valid?(state, choice)
      # 試行: 選択を行い、状態を更新
      make_choice(state, choice)
      # 次の選択へ進む
      backtrack(state, [choice.left, choice.right], res)
      # バックトラック：選択を取り消し、前の状態に戻す
      undo_choice(state, choice)
    end
  end
end

### Driver Code ###
if __FILE__ == $0
  root = arr_to_tree([1, 7, 3, 4, 5, 6, 7])
  puts "\n二分木を初期化"
  print_tree(root)

  # バックトラッキング法
  res = []
  backtrack([], [root], res)

  puts "\n根ノードからノード 7 までのすべての経路を出力し、経路に値が 3 のノードを含まないことを条件とする"
  for path in res
    p path.map { |node| node.val }
  end
end
