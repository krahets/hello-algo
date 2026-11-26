=begin
File: permutations_i.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 回溯演算法：全排列 I ###
def backtrack(state, choices, selected, res)
  # 當狀態長度等於元素個數時，記錄此解
  if state.length == choices.length
    res << state.dup
    return
  end

  # 逐一檢查所有選項
  choices.each_with_index do |choice, i|
    # 剪枝：不可重複選取同一個元素
    unless selected[i]
      # 嘗試：做出選擇並更新狀態
      selected[i] = true
      state << choice
      # 進入下一輪選擇
      backtrack(state, choices, selected, res)
      # 回溯：撤銷選擇，還原先前的狀態
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

### 主程式 ###
if __FILE__ == $0
  nums = [1, 2, 3]

  res = permutations_i(nums)

  puts "輸入陣列 nums = #{nums}"
  puts "所有排列 res = #{res}"
end
