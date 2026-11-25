=begin
File: permutations_ii.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require 'set'

### バックトラッキングによる全順列 II ###
def backtrack(state, choices, selected, res)
  # 状態の長さが要素数に達したら解を記録する
  if state.length == choices.length
    res << state.dup
    return
  end

  # すべての選択肢を調べる
  duplicated = Set.new
  choices.each_with_index do |choice, i|
    # 枝刈り：同じ要素は二度選ばず、この段階で同じ値の要素も繰り返し試さない
    if !selected[i] && !duplicated.include?(choice)
      # 試行：選択して状態を更新する
      duplicated.add(choice)
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

### 全順列 II ###
def permutations_ii(nums)
  res = []
  backtrack([], nums, Array.new(nums.length, false), res)
  res
end

### 実行例 ###
if __FILE__ == $0
  nums = [1, 2, 2]

  res = permutations_ii(nums)

  puts "入力配列 nums = #{nums}"
  puts "すべての順列 res = #{res}"
end
