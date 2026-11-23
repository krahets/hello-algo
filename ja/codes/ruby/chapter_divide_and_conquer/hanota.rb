=begin
File: hanota.rb
Created Time: 2024-05-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 円盤を 1 枚移動する ###
def move(src, tar)
  # src の一番上から円盤を 1 枚取り出す
  pan = src.pop
  # tar の一番上に円盤を置く
  tar << pan
end

### ハノイの塔の問題 f(i) を解く ###
def dfs(i, src, buf, tar)
  # src に円盤が 1 枚だけ残っている場合、そのまま tar に移す
  if i == 1
    move(src, tar)
    return
  end

  # 部分問題 f(i-1) ：src の上から i-1 枚の円盤を、tar を使って buf に移す
  dfs(i - 1, src, tar, buf)
  # 部分問題 f(1) ：src に残った 1 枚の円盤を tar に移す
  move(src, tar)
  # 部分問題 f(i-1) ：buf の上から i-1 枚の円盤を、src を使って tar に移す
  dfs(i - 1, buf, src, tar)
end

### ハノイの塔の問題を解く ###
def solve_hanota(_A, _B, _C)
  n = _A.length
  # A の上から n 枚の円盤を、B を使って C に移す
  dfs(n, _A, _B, _C)
end

### 実行用コード ###
if __FILE__ == $0
  # リストの末尾が棒の一番上に対応する
  A = [5, 4, 3, 2, 1]
  B = []
  C = []
  puts "初期状態："
  puts "A = #{A}"
  puts "B = #{B}"
  puts "C = #{C}"

  solve_hanota(A, B, C)

  puts "円盤の移動完了後："
  puts "A = #{A}"
  puts "B = #{B}"
  puts "C = #{C}"
end
