=begin
File: subset_sum_i_naive.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 回溯算法：子集和 I ###
def backtrack(state, target, total, choices, res)
  # 子集和等于 target 时，记录解
  if total == target
    res << state.dup
    return
  end

  # 遍历所有选择
  for i in 0...choices.length
    # 剪枝：若子集和超过 target ，则跳过该选择
    next if total + choices[i] > target
    # 尝试：做出选择，更新元素和 total
    state << choices[i]
    # 进行下一轮选择
    backtrack(state, target, total + choices[i], choices, res)
    # 回退：撤销选择，恢复到之前的状态
    state.pop
  end
end

### 求解子集和 I（包含重复子集）###
def subset_sum_i_naive(nums, target)
  state = [] # 状态（子集）
  total = 0 # 子集和
  res = [] # 结果列表（子集列表）
  backtrack(state, target, total, nums, res)
  res
end

### Driver Code ###
if __FILE__ == $0
  nums = [3, 4, 5]
  target = 9
  res = subset_sum_i_naive(nums, target)

  puts "输入数组 nums = #{nums}, target = #{target}"
  puts "所有和等于 #{target} 的子集 res = #{res}"
  puts "请注意，该方法输出的结果包含重复集合"
end
