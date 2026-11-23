=begin
File: permutations_i.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### バックトラッキング：すべての順列 I ###
def backtrack(state, choices, selected, res)
  # 状態の長さが要素数と等しくなったら、解を記録する
  if state.length == choices.length
    res << state.dup
    return
  end

  # すべての選択肢を走査する
  choices.each_with_index do |choice, i|
    # 枝刈り：同じ要素を繰り返し選んではならない
    unless selected[i]
      # 試行：選択を行い、状態を更新する
      selected[i] = true
      state << choice
      # 次の選択に進む
      backtrack(state, choices, selected, res)
      # 復元：選択を取り消し、以前の状態に戻す
      selected[i] = false
      state.pop
    end
  end
end

### すべての順列 I ###
def permutations_i(nums)
  res = []
  backtrack([], nums, Array.new(nums.length, false), res)
  res
end

### 実行用コード ###
if __FILE__ == $0
  nums = [1, 2, 3]

  res = permutations_i(nums)

  puts "入力配列 nums = #{nums}"
  puts "すべての順列 res = #{res}"
end
