=begin
File: subset_sum_i_naive.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### バックトラッキング: 部分和 I ###
def backtrack(state, target, total, choices, res)
  # 部分集合の和が target に等しければ、解を記録
  if total == target
    res << state.dup
    return
  end

  # すべての選択肢を走査
  for i in 0...choices.length
    # 枝刈り：部分和が target を超える場合はその選択をスキップする
    next if total + choices[i] > target
    # 試行：選択を行い、要素と total を更新する
    state << choices[i]
    # 次の選択へ進む
    backtrack(state, target, total + choices[i], choices, res)
    # バックトラック：選択を取り消し、前の状態に戻す
    state.pop
  end
end

# ## 部分和 I を解く（重複する部分集合を含む）###
def subset_sum_i_naive(nums, target)
  state = [] # 状態（部分集合）
  total = 0 # 部分和
  res = [] # 結果リスト（部分集合のリスト）
  backtrack(state, target, total, nums, res)
  res
end

### Driver Code ###
if __FILE__ == $0
  nums = [3, 4, 5]
  target = 9
  res = subset_sum_i_naive(nums, target)

  puts "入力配列 nums = #{nums}, target = #{target}"
  puts "和が #{target} に等しいすべての部分集合 res = #{res}"
  puts "この方法の出力結果には重複した集合が含まれることに注意してください"
end
