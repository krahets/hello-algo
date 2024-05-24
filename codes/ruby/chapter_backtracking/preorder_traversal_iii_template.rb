=begin
File: preorder_traversal_iii_template.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 判断当前状态是否为解 ###
def is_solution?(state)
  !state.empty? && state.last.val == 7
end

### 记录解 ###
def record_solution(state, res)
  res << state.dup
end

### 判断在当前状态下，该选择是否合法 ###
def is_valid?(state, choice)
  choice && choice.val != 3
end

### 更新状态 ###
def make_choice(state, choice)
  state << choice
end

### 恢复状态 ###
def undo_choice(state, choice)
  state.pop
end

### 回溯算法：例题三 ###
def backtrack(state, choices, res)
  # 检查是否为解
  record_solution(state, res) if is_solution?(state)

  # 遍历所有选择
  for choice in choices
    # 剪枝：检查选择是否合法
    if is_valid?(state, choice)
      # 尝试：做出选择，更新状态
      make_choice(state, choice)
      # 进行下一轮选择
      backtrack(state, [choice.left, choice.right], res)
      # 回退：撤销选择，恢复到之前的状态
      undo_choice(state, choice)
    end
  end
end

### Driver Code ###
if __FILE__ == $0
  root = arr_to_tree([1, 7, 3, 4, 5, 6, 7])
  puts "\n初始化二叉树"
  print_tree(root)

  # 回溯算法
  res = []
  backtrack([], [root], res)

  puts "\n输出所有根节点到节点 7 的路径，要求路径中不包含值为 3 的节点"
  for path in res
    p path.map { |node| node.val }
  end
end
