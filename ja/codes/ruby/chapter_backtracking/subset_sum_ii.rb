=begin
File: subset_sum_ii.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### バックトラッキング法：部分和 II ###
def backtrack(state, target, choices, start, res)
  # 部分集合の和が target に等しければ、解を記録
  if target.zero?
    res << state.dup
    return
  end

  # すべての選択肢を走査
  # 枝刈り 2: start から走査し、重複する部分集合の生成を避ける
  # 枝刈り 3: start から走査し、同じ要素の重複選択を避ける
  for i in start...choices.length
    # 枝刈り1：部分集合の和が target を超えたら、直ちにループを終了する
    # 配列はソート済みで後続要素のほうが大きく、部分集合の和は必ず target を超えるため
    break if target - choices[i] < 0
    # 枝刈り4：この要素が左隣の要素と等しければ、その探索分岐は重複しているためスキップする
    next if i > start && choices[i] == choices[i - 1]
    # 試す：選択を行い、target と start を更新
    state << choices[i]
    # 次の選択へ進む
    backtrack(state, target - choices[i], choices, i + 1, res)
    # バックトラック：選択を取り消し、前の状態に戻す
    state.pop
  end
end

### 部分和 II を解く ###
def subset_sum_ii(nums, target)
  state = [] # 状態（部分集合）
  nums.sort! # nums をソート
  start = 0 # 開始点を走査
  res = [] # 結果リスト（部分集合のリスト）
  backtrack(state, target, nums, start, res)
  res
end

### Driver Code ###
if __FILE__ == $0
  nums = [4, 4, 5]
  target = 9
  res = subset_sum_ii(nums, target)

  puts "入力配列 nums = #{nums}, target = #{target}"
  puts "和が #{target} に等しいすべての部分集合 res = #{res}"
end
