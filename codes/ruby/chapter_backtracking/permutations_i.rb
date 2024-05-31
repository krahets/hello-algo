=begin
File: permutations_i.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 回溯算法：全排列 I ###
def backtrack(state, choices, selected, res)
  # 当状态长度等于元素数量时，记录解
  if state.length == choices.length
    res << state.dup
    return
  end

  # 遍历所有选择
  choices.each_with_index do |choice, i|
    # 剪枝：不允许重复选择元素
    unless selected[i]
      # 尝试：做出选择，更新状态
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

### 全排列 I ###
def permutations_i(nums)
  res = []
  backtrack([], nums, Array.new(nums.length, false), res)
  res
end

### Driver Code ###
if __FILE__ == $0
  nums = [1, 2, 3]

  res = permutations_i(nums)

  puts "输入数组 nums = #{nums}"
  puts "所有排列 res = #{res}"
end
