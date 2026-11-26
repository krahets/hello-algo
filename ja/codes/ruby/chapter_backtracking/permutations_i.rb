=begin
File: permutations_i.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### バックトラッキングによる全順列 I ###
def backtrack(state, choices, selected, res)
  # 状態の長さが要素数に達したら解を記録する
  if state.length == choices.length
    res << state.dup
    return
  end

  # すべての選択肢を調べる
  choices.each_with_index do |choice, i|
    # 枝刈り：同じ要素は二度選ばない
    unless selected[i]
      # 試行：選択して状態を更新する
      selected[i] = true
      state << choice
      # 次の選択に進む
      backtrack(state, choices, selected, res)
      # 後戻り：選択を取り消し、元の状態に戻す
      selected[i] = false
      state.pop
    end
  end
end

### 全順列 I ###
def permutations_i(nums)
  res = []
  backtrack([], nums, Array.new(nums.length, false), res)
  res
end

### 実行例 ###
if __FILE__ == $0
  nums = [1, 2, 3]

  res = permutations_i(nums)

  puts "入力配列 nums = #{nums}"
  puts "すべての順列 res = #{res}"
end
