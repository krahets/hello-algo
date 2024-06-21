=begin
File: subset_sum_ii.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 回溯演算法：子集和 II ###
def backtrack(state, target, choices, start, res)
  # 子集和等於 target 時，記錄解
  if target.zero?
    res << state.dup
    return
  end

  # 走訪所有選擇
  # 剪枝二：從 start 開始走訪，避免生成重複子集
  # 剪枝三：從 start 開始走訪，避免重複選擇同一元素
  for i in start...choices.length
    # 剪枝一：若子集和超過 target ，則直接結束迴圈
    # 這是因為陣列已排序，後邊元素更大，子集和一定超過 target
    break if target - choices[i] < 0
    # 剪枝四：如果該元素與左邊元素相等，說明該搜尋分支重複，直接跳過
    next if i > start && choices[i] == choices[i - 1]
    # 嘗試：做出選擇，更新 target, start
    state << choices[i]
    # 進行下一輪選擇
    backtrack(state, target - choices[i], choices, i + 1, res)
    # 回退：撤銷選擇，恢復到之前的狀態
    state.pop
  end
end

### 求解子集和 II ###
def subset_sum_ii(nums, target)
  state = [] # 狀態（子集）
  nums.sort! # 對 nums 進行排序
  start = 0 # 走訪起始點
  res = [] # 結果串列（子集串列）
  backtrack(state, target, nums, start, res)
  res
end

### Driver Code ###
if __FILE__ == $0
  nums = [4, 4, 5]
  target = 9
  res = subset_sum_ii(nums, target)

  puts "輸入陣列 nums = #{nums}, target = #{target}"
  puts "所有和等於 #{target} 的子集 res = #{res}"
end
