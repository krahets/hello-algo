=begin
File: climbing_stairs_backtrack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### バックトラッキング ###
def backtrack(choices, state, n, res)
  # n 段目に到達したら、方法の数を 1 増やす
  res[0] += 1 if state == n
  # すべての選択肢を走査する
  for choice in choices
    # 枝刈り：n 段目を越えてはならない
    next if state + choice > n

    # 試行：選択を行い、状態を更新する
    backtrack(choices, state + choice, n, res)
  end
  # 復元
end

### 階段の上り方：バックトラッキング ###
def climbing_stairs_backtrack(n)
  choices = [1, 2] # 1 段または 2 段上ることを選択できる
  state = 0 # 0 段目から上り始める
  res = [0] # res[0] に方法の数を記録する
  backtrack(choices, state, n, res)
  res.first
end

### 実行用コード ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_backtrack(n)
  puts "#{n} 段の階段を上る方法は全部で #{res} 通り"
end
