=begin
File: subset_sum_ii.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### バックトラッキング：部分集合和 II ###
def backtrack(state, target, choices, start, res)
  # 部分集合の和が target と等しくなったら、解を記録する
  if target.zero?
    res << state.dup
    return
  end

  # すべての選択肢を走査する
  # 枝刈り 2：start から走査を始め、重複した部分集合の生成を避ける
  # 枝刈り 3：start から走査を始め、同じ要素の再選択を避ける
  for i in start...choices.length
    # 枝刈り 1：部分集合の和が target を超えたら、直ちにループを終了する
    # 配列はソート済みで後ろの要素ほど大きいため、部分集合の和が必ず target を超えるからである
    break if target - choices[i] < 0
    # 枝刈り 4：この要素が左隣の要素と等しい場合、探索の分岐が重複するため、直ちにスキップする
    next if i > start && choices[i] == choices[i - 1]
    # 試行：選択を行い、target, start を更新する
    state << choices[i]
    # 次の選択に進む
    backtrack(state, target - choices[i], choices, i + 1, res)
    # 復元：選択を取り消し、以前の状態に戻す
    state.pop
  end
end

### 部分集合和 II を解く ###
def subset_sum_ii(nums, target)
  state = [] # 状態（部分集合）
  nums.sort! # nums をソートする
  start = 0 # 走査の開始位置
  res = [] # 結果リスト（部分集合のリスト）
  backtrack(state, target, nums, start, res)
  res
end

### 実行用コード ###
if __FILE__ == $0
  nums = [4, 4, 5]
  target = 9
  res = subset_sum_ii(nums, target)

  puts "入力配列 nums = #{nums}, target = #{target}"
  puts "和が #{target} になるすべての部分集合 res = #{res}"
end
