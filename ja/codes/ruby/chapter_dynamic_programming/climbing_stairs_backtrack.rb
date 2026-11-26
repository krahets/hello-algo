=begin
File: climbing_stairs_backtrack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### バックトラック ###
def backtrack(choices, state, n, res)
  # n 段目に着いたら、登り方の数を 1 増やす
  res[0] += 1 if state == n
  # すべての選択肢を調べる
  for choice in choices
    # 枝刈り：n 段目を越えないようにする
    next if state + choice > n

    # 選択肢を試し、状態を更新する
    backtrack(choices, state + choice, n, res)
  end
  # 選択を取り消す
end

### 階段の登り方：バックトラック ###
def climbing_stairs_backtrack(n)
  choices = [1, 2] # 1 段または 2 段登れる
  state = 0 # 0 段目から登り始める
  res = [0] # res[0] に登り方の数を記録する
  backtrack(choices, state, n, res)
  res.first
end

### 実行例 ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_backtrack(n)
  puts "全 #{n} 段の階段の登り方は #{res} 通り"
end
