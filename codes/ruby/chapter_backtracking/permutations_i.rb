=begin
File: permutations_i.rb
Created Time: 2024-04-07
Author: hoangtien2k3 (hoangtien2k3qx1@gmail.com)
=end

# 回溯算法：全排列 I
def backtrack(state, choices, selected, res)
  # 当 state 的长度等于选择集的长度时，记录解
  if state.length == choices.length
    res << state.clone
    return
  end
  # 遍历所有选择
  choices.each_with_index do |choice, i|
    # 剪枝：不允许选择重复元素
    if !selected[i]
      # 尝试：做出选择，更新状态
      selected[i] = true
      state << choice
      # 继续向下选择
      backtrack(state, choices, selected, res)
      # 回溯：撤销选择，恢复状态
      selected[i] = false
      state.pop
    end
  end
end

# 全排列 I
def permutations_i(nums)
  res = []
  backtrack([], nums, Array.new(nums.length, false), res)
  return res
end

nums = [1, 2, 3]

res = permutations_i(nums)

puts "输入数组 nums = #{nums}"
puts "所有排列结果 res = #{res}"
