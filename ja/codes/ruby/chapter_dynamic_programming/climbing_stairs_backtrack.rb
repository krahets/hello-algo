=begin
File: climbing_stairs_backtrack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### バックトラッキング ###
def backtrack(choices, state, n, res)
  # 第 n 段に到達したら、方法数を 1 増やす
  res[0] += 1 if state == n
  # すべての選択肢を走査
  for choice in choices
    # 枝刈り: 第 n 段を超えないようにする
    next if state + choice > n

    # 試行: 選択を行い、状態を更新
    backtrack(choices, state + choice, n, res)
  end
  # バックトラック
end

### 階段登り：バックトラッキング ###
def climbing_stairs_backtrack(n)
  choices = [1, 2] # 1 段または 2 段上ることを選べる
  state = 0 # 第 0 段から上り始める
  res = [0] # res[0] を使って方法数を記録する
  backtrack(choices, state, n, res)
  res.first
end

### Driver Code ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_backtrack(n)
  puts "#{n} 段の階段を上る方法は全部で #{res} 通り"
end
