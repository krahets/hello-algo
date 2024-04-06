=begin
File: permutations_ii.rb
Created Time: 2024-04-07
Author: hoangtien2k3 (hoangtien2k3qx1@gmail.com)
=end

# 回溯算法：全排列 II
def backtrack(state, choices, selected, res)
  # 当状态长度等于元素数量时，记录解
  if state.length == choices.length
    res << state.clone
    return
  end
  # 遍历所有选择
  duplicated = Set.new
  choices.each_with_index do |choice, i|
    # 剪枝：不允许重复选择元素 且 不允许重复选择相等元素
    if !selected[i] && !duplicated.include?(choice)
      # 尝试：做出选择，更新状态
      duplicated.add(choice) # 记录选择过的元素值
      selected[i] = true
      state << choice
      # 进行下一轮选择
      backtrack(state, choices, selected, res)
      # 回退：撤销选择，恢复到之前的状态
      selected[i] = false
      state.pop
    end
  end
end

# 全排列 II
def permutations_ii(nums)
  res = []
  backtrack([], nums, Array.new(nums.length, false), res)
  return res
end

nums = [1, 2, 2]

res = permutations_ii(nums)

puts "输入数组 nums = #{nums}"
puts "所有排列 res = #{res}"
