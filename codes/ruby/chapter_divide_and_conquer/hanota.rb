=begin
File: hanota.rb
Created Time: 2024-05-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 移动一个圆盘 ###
def move(src, tar)
  # 从 src 顶部拿出一个圆盘
  pan = src.pop
  # 将圆盘放入 tar 顶部
  tar << pan
end

### 求解汉诺塔问题 f(i) ###
def dfs(i, src, buf, tar)
  # 若 src 只剩下一个圆盘，则直接将其移到 tar
  if i == 1
    move(src, tar)
    return
  end

  # 子问题 f(i-1) ：将 src 顶部 i-1 个圆盘借助 tar 移到 buf
  dfs(i - 1, src, tar, buf)
  # 子问题 f(1) ：将 src 剩余一个圆盘移到 tar
  move(src, tar)
  # 子问题 f(i-1) ：将 buf 顶部 i-1 个圆盘借助 src 移到 tar
  dfs(i - 1, buf, src, tar)
end

### 求解汉诺塔问题 ###
def solve_hanota(_A, _B, _C)
  n = _A.length
  # 将 A 顶部 n 个圆盘借助 B 移到 C
  dfs(n, _A, _B, _C)
end

### Driver Code ###
if __FILE__ == $0
  # 列表尾部是柱子顶部
  A = [5, 4, 3, 2, 1]
  B = []
  C = []
  puts "初始状态下："
  puts "A = #{A}"
  puts "B = #{B}"
  puts "C = #{C}"

  solve_hanota(A, B, C)

  puts "圆盘移动完成后："
  puts "A = #{A}"
  puts "B = #{B}"
  puts "C = #{C}"
end
