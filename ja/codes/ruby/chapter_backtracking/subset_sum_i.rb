=begin
File: subset_sum_i.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### バックトラッキングによる部分和問題 I ###
def backtrack(state, target, choices, start, res)
  # 部分集合の要素の和が target に等しくなったら解を記録する
  if target.zero?
    res << state.dup
    return
  end
  # すべての選択肢を調べる
  # 枝刈り 2：start から調べて部分集合の重複を防ぐ
  for i in start...choices.length
    # 枝刈り 1：部分集合の要素の和が target を超えたらループを終了する
    # 配列はソート済みで、後の要素ほど大きく、和は必ず target を超えるため
    break if target - choices[i] < 0
    # 試行：選択して target と start を更新する
    state << choices[i]
    # 次の選択に進む
    backtrack(state, target - choices[i], choices, i, res)
    # 後戻り：選択を取り消し、元の状態に戻す
    state.pop
  end
end

### 部分和問題 I を解く ###
def subset_sum_i(nums, target)
  state = [] # 状態（部分集合）
  nums.sort! # nums をソートする
  start = 0 # 走査の開始位置
  res = [] # 結果のリスト（部分集合のリスト）
  backtrack(state, target, nums, start, res)
  res
end

### 実行例 ###
if __FILE__ == $0
  nums = [3, 4, 5]
  target = 9
  res = subset_sum_i(nums, target)

  puts "入力配列 = #{nums}, target = #{target}"
  puts "要素の和が #{target} となるすべての部分集合 res = #{res}"
end
