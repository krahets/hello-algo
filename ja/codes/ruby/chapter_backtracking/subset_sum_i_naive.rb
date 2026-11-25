=begin
File: subset_sum_i_naive.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### バックトラッキングによる部分和問題 I ###
def backtrack(state, target, total, choices, res)
  # 部分集合の要素の和が target に等しくなったら解を記録する
  if total == target
    res << state.dup
    return
  end

  # すべての選択肢を調べる
  for i in 0...choices.length
    # 枝刈り：部分集合の要素の和が target を超えるなら、その選択を飛ばす
    next if total + choices[i] > target
    # 試行：選択して要素の和 total を更新する
    state << choices[i]
    # 次の選択に進む
    backtrack(state, target, total + choices[i], choices, res)
    # 後戻り：選択を取り消し、元の状態に戻す
    state.pop
  end
end

### 部分和問題 I を解く（重複する部分集合を含む）###
def subset_sum_i_naive(nums, target)
  state = [] # 状態（部分集合）
  total = 0 # 部分和
  res = [] # 結果のリスト（部分集合のリスト）
  backtrack(state, target, total, nums, res)
  res
end

### 実行例 ###
if __FILE__ == $0
  nums = [3, 4, 5]
  target = 9
  res = subset_sum_i_naive(nums, target)

  puts "入力配列 nums = #{nums}, target = #{target}"
  puts "要素の和が #{target} となるすべての部分集合 res = #{res}"
  puts "この方法の出力には重複する集合が含まれる点に注意"
end
