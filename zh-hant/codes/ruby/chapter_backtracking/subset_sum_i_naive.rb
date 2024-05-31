=begin
File: subset_sum_i_naive.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 回溯演算法：子集和 I ###
def backtrack(state, target, total, choices, res)
  # 子集和等於 target 時，記錄解
  if total == target
    res << state.dup
    return
  end

  # 走訪所有選擇
  for i in 0...choices.length
    # 剪枝：若子集和超過 target ，則跳過該選擇
    next if total + choices[i] > target
    # 嘗試：做出選擇，更新元素和 total
    state << choices[i]
    # 進行下一輪選擇
    backtrack(state, target, total + choices[i], choices, res)
    # 回退：撤銷選擇，恢復到之前的狀態
    state.pop
  end
end

### 求解子集和 I（包含重複子集）###
def subset_sum_i_naive(nums, target)
  state = [] # 狀態（子集）
  total = 0 # 子集和
  res = [] # 結果串列（子集串列）
  backtrack(state, target, total, nums, res)
  res
end

### Driver Code ###
if __FILE__ == $0
  nums = [3, 4, 5]
  target = 9
  res = subset_sum_i_naive(nums, target)

  puts "輸入陣列 nums = #{nums}, target = #{target}"
  puts "所有和等於 #{target} 的子集 res = #{res}"
  puts "請注意，該方法輸出的結果包含重複集合"
end
