=begin
File: permutations_ii.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require 'set'

### バックトラッキング：すべての順列 II ###
def backtrack(state, choices, selected, res)
  # 状態の長さが要素数と等しくなったら、解を記録する
  if state.length == choices.length
    res << state.dup
    return
  end

  # すべての選択肢を走査する
  duplicated = Set.new
  choices.each_with_index do |choice, i|
    # 枝刈り：同じ要素の再選択も、等しい値を持つ要素の重複選択も許可しない
    if !selected[i] && !duplicated.include?(choice)
      # 試行：選択を行い、状態を更新する
      duplicated.add(choice)
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

### すべての順列 II ###
def permutations_ii(nums)
  res = []
  backtrack([], nums, Array.new(nums.length, false), res)
  res
end

### 実行用コード ###
if __FILE__ == $0
  nums = [1, 2, 2]

  res = permutations_ii(nums)

  puts "入力配列 nums = #{nums}"
  puts "すべての順列 res = #{res}"
end
