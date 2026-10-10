=begin
File: hanota.rb
Created Time: 2024-05-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 円盤を1枚移動 ###
def move(src, tar)
  # src の上から円盤を1枚取り出す
  pan = src.pop
  # 円盤を tar の上に置く
  tar << pan
end

### ハノイの塔 f(i) を解く ###
def dfs(i, src, buf, tar)
  # src に円盤が 1 枚だけ残っている場合は、そのまま tar へ移す
  if i == 1
    move(src, tar)
    return
  end

  # 部分問題 f(i-1)：src の上部 i-1 枚の円盤を tar を補助にして buf へ移す
  dfs(i - 1, src, tar, buf)
  # 部分問題 f(1)：src に残る 1 枚の円盤を tar に移す
  move(src, tar)
  # 部分問題 f(i-1)：buf の上部 i-1 枚の円盤を src を補助にして tar へ移す
  dfs(i - 1, buf, src, tar)
end

### ハノイの塔を解く ###
def solve_hanota(_A, _B, _C)
  n = _A.length
  # A の上から n 枚の円盤を B を介して C へ移す
  dfs(n, _A, _B, _C)
end

### Driver Code ###
if __FILE__ == $0
  # リスト末尾が柱の頂上
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
