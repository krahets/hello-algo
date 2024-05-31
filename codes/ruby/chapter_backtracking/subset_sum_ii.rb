=begin
File: subset_sum_ii.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 回溯算法：子集和 II ###
def backtrack(state, target, choices, start, res)
  # 子集和等于 target 时，记录解
  if target.zero?
    res << state.dup
    return
  end

  # 遍历所有选择
  # 剪枝二：从 start 开始遍历，避免生成重复子集
  # 剪枝三：从 start 开始遍历，避免重复选择同一元素
  for i in start...choices.length
    # 剪枝一：若子集和超过 target ，则直接结束循环
    # 这是因为数组已排序，后边元素更大，子集和一定超过 target
    break if target - choices[i] < 0
    # 剪枝四：如果该元素与左边元素相等，说明该搜索分支重复，直接跳过
    next if i > start && choices[i] == choices[i - 1]
    # 尝试：做出选择，更新 target, start
    state << choices[i]
    # 进行下一轮选择
    backtrack(state, target - choices[i], choices, i + 1, res)
    # 回退：撤销选择，恢复到之前的状态
    state.pop
  end
end

### 求解子集和 II ###
def subset_sum_ii(nums, target)
  state = [] # 状态（子集）
  nums.sort! # 对 nums 进行排序
  start = 0 # 遍历起始点
  res = [] # 结果列表（子集列表）
  backtrack(state, target, nums, start, res)
  res
end

### Driver Code ###
if __FILE__ == $0
  nums = [4, 4, 5]
  target = 9
  res = subset_sum_ii(nums, target)

  puts "输入数组 nums = #{nums}, target = #{target}"
  puts "所有和等于 #{target} 的子集 res = #{res}"
end
