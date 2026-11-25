=begin
File: subset_sum_ii.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 回溯演算法：子集和 II ###
def backtrack(state, target, choices, start, res)
  # 子集總和達到目標時，記錄此解
  if target.zero?
    res << state.dup
    return
  end

  # 逐一檢查所有選項
  # 剪枝二：從 start 開始走訪，避免產生重複子集
  # 剪枝三：從 start 開始走訪，避免重複選取同一個元素
  for i in start...choices.length
    # 剪枝一：若候選值超過剩餘目標值 target，結束迴圈
    # 陣列已排序，後面的元素更大，也一定超過剩餘目標值 target
    break if target - choices[i] < 0
    # 剪枝四：若本輪已嘗試過左鄰的相等元素，就略過這個重複分支
    next if i > start && choices[i] == choices[i - 1]
    # 嘗試：做出選擇，更新 target 和 start
    state << choices[i]
    # 進入下一輪選擇
    backtrack(state, target - choices[i], choices, i + 1, res)
    # 回溯：撤銷選擇，還原先前的狀態
    state.pop
  end
end

### 求解子集和 II ###
def subset_sum_ii(nums, target)
  state = [] # 狀態（子集）
  nums.sort! # 將 nums 排序
  start = 0 # 走訪的起點
  res = [] # 結果串列（子集串列）
  backtrack(state, target, nums, start, res)
  res
end

### 主程式 ###
if __FILE__ == $0
  nums = [4, 4, 5]
  target = 9
  res = subset_sum_ii(nums, target)

  puts "輸入陣列 nums = #{nums}, target = #{target}"
  puts "總和等於 #{target} 的所有子集 res = #{res}"
end
