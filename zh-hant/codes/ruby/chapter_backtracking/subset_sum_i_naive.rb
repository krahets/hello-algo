=begin
File: subset_sum_i_naive.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 回溯演算法：子集和 I ###
def backtrack(state, target, total, choices, res)
  # 子集總和達到目標時，記錄此解
  if total == target
    res << state.dup
    return
  end

  # 逐一檢查所有選項
  for i in 0...choices.length
    # 剪枝：若加入該元素後總和超過 target，略過這個選擇
    next if total + choices[i] > target
    # 嘗試：做出選擇，更新元素總和 total
    state << choices[i]
    # 進入下一輪選擇
    backtrack(state, target, total + choices[i], choices, res)
    # 回溯：撤銷選擇，還原先前的狀態
    state.pop
  end
end

### 求解子集和 I（含重複子集）###
def subset_sum_i_naive(nums, target)
  state = [] # 狀態（子集）
  total = 0 # 子集總和
  res = [] # 結果串列（子集串列）
  backtrack(state, target, total, nums, res)
  res
end

### 主程式 ###
if __FILE__ == $0
  nums = [3, 4, 5]
  target = 9
  res = subset_sum_i_naive(nums, target)

  puts "輸入陣列 nums = #{nums}, target = #{target}"
  puts "總和等於 #{target} 的所有子集 res = #{res}"
  puts "請注意，這個方法輸出的結果含有重複集合"
end
