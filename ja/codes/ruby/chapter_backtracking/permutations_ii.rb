=begin
File: permutations_ii.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### バックトラッキング法：全順列 II ###
def backtrack(state, choices, selected, res)
  # 状態の長さが要素数に等しければ、解を記録
  if state.length == choices.length
    res << state.dup
    return
  end

  # すべての選択肢を走査
  duplicated = Set.new
  choices.each_with_index do |choice, i|
    # 枝刈り：要素の重複選択を許可せず、同値要素の重複選択も許可しない
    if !selected[i] && !duplicated.include?(choice)
      # 試行: 選択を行い、状態を更新
      duplicated.add(choice)
      selected[i] = true
      state << choice
      # 次の選択へ進む
      backtrack(state, choices, selected, res)
      # バックトラック：選択を取り消し、前の状態に戻す
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

### Driver Code ###
if __FILE__ == $0
  nums = [1, 2, 2]

  res = permutations_ii(nums)

  puts "入力配列 nums = #{nums}"
  puts "すべての順列 res = #{res}"
end
