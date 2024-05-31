=begin
File: hanota.rb
Created Time: 2024-05-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 移動一個圓盤 ###
def move(src, tar)
  # 從 src 頂部拿出一個圓盤
  pan = src.pop
  # 將圓盤放入 tar 頂部
  tar << pan
end

### 求解河內塔問題 f(i) ###
def dfs(i, src, buf, tar)
  # 若 src 只剩下一個圓盤，則直接將其移到 tar
  if i == 1
    move(src, tar)
    return
  end

  # 子問題 f(i-1) ：將 src 頂部 i-1 個圓盤藉助 tar 移到 buf
  dfs(i - 1, src, tar, buf)
  # 子問題 f(1) ：將 src 剩餘一個圓盤移到 tar
  move(src, tar)
  # 子問題 f(i-1) ：將 buf 頂部 i-1 個圓盤藉助 src 移到 tar
  dfs(i - 1, buf, src, tar)
end

### 求解河內塔問題 ###
def solve_hanota(_A, _B, _C)
  n = _A.length
  # 將 A 頂部 n 個圓盤藉助 B 移到 C
  dfs(n, _A, _B, _C)
end

### Driver Code ###
if __FILE__ == $0
  # 串列尾部是柱子頂部
  A = [5, 4, 3, 2, 1]
  B = []
  C = []
  puts "初始狀態下："
  puts "A = #{A}"
  puts "B = #{B}"
  puts "C = #{C}"

  solve_hanota(A, B, C)

  puts "圓盤移動完成後："
  puts "A = #{A}"
  puts "B = #{B}"
  puts "C = #{C}"
end
