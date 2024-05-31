=begin
File: preorder_traversal_iii_template.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 判斷當前狀態是否為解 ###
def is_solution?(state)
  !state.empty? && state.last.val == 7
end

### 記錄解 ###
def record_solution(state, res)
  res << state.dup
end

### 判斷在當前狀態下，該選擇是否合法 ###
def is_valid?(state, choice)
  choice && choice.val != 3
end

### 更新狀態 ###
def make_choice(state, choice)
  state << choice
end

### 恢復狀態 ###
def undo_choice(state, choice)
  state.pop
end

### 回溯演算法：例題三 ###
def backtrack(state, choices, res)
  # 檢查是否為解
  record_solution(state, res) if is_solution?(state)

  # 走訪所有選擇
  for choice in choices
    # 剪枝：檢查選擇是否合法
    if is_valid?(state, choice)
      # 嘗試：做出選擇，更新狀態
      make_choice(state, choice)
      # 進行下一輪選擇
      backtrack(state, [choice.left, choice.right], res)
      # 回退：撤銷選擇，恢復到之前的狀態
      undo_choice(state, choice)
    end
  end
end

### Driver Code ###
if __FILE__ == $0
  root = arr_to_tree([1, 7, 3, 4, 5, 6, 7])
  puts "\n初始化二元樹"
  print_tree(root)

  # 回溯演算法
  res = []
  backtrack([], [root], res)

  puts "\n輸出所有根節點到節點 7 的路徑，要求路徑中不包含值為 3 的節點"
  for path in res
    p path.map { |node| node.val }
  end
end
