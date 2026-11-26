=begin
File: preorder_traversal_iii_template.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 現在の状態が解かどうか判定する ###
def is_solution?(state)
  !state.empty? && state.last.val == 7
end

### 解を記録する ###
def record_solution(state, res)
  res << state.dup
end

### 現在の状態でその選択が可能か判定する ###
def is_valid?(state, choice)
  choice && choice.val != 3
end

### 状態を更新する ###
def make_choice(state, choice)
  state << choice
end

### 状態を元に戻す ###
def undo_choice(state, choice)
  state.pop
end

### バックトラッキング：例題 3 ###
def backtrack(state, choices, res)
  # 解かどうか調べる
  record_solution(state, res) if is_solution?(state)

  # すべての選択肢を調べる
  for choice in choices
    # 枝刈り：その選択が可能か調べる
    if is_valid?(state, choice)
      # 試行：選択して状態を更新する
      make_choice(state, choice)
      # 次の選択に進む
      backtrack(state, [choice.left, choice.right], res)
      # 後戻り：選択を取り消し、元の状態に戻す
      undo_choice(state, choice)
    end
  end
end

### 実行例 ###
if __FILE__ == $0
  root = arr_to_tree([1, 7, 3, 4, 5, 6, 7])
  puts "\n二分木を初期化"
  print_tree(root)

  # バックトラッキング
  res = []
  backtrack([], [root], res)

  puts "\n根から値が 7 のノードまでの経路のうち、値が 3 のノードを含まないものをすべて出力"
  for path in res
    p path.map { |node| node.val }
  end
end
