=begin
File: n_queens.rb
Created Time: 2024-04-07
Author: hoangtien2k3 (hoangtien2k3qx1@gmail.com)
=end

module Backtracking
  # 回溯算法：n 皇后
  def self.backtrack(row, n, state, res, cols, diags1, diags2)
    # 当放置完所有行时，记录解
    if row == n
      copy_state = state.map(&:dup)
      res << copy_state
      return
    end

    # 遍历所有列
    (0...n).each do |col|
      # 计算该格子对应的主对角线和次对角线
      diag1 = row - col + n - 1
      diag2 = row + col
      # 剪枝：不允许该格子所在列、主对角线、次对角线上存在皇后
      if !cols[col] && !diags1[diag1] && !diags2[diag2]
        # 尝试：将皇后放置在该格子
        state[row][col] = 'Q'
        cols[col] = diags1[diag1] = diags2[diag2] = true
        # 放置下一行
        backtrack(row + 1, n, state, res, cols, diags1, diags2)
        # 回退：将该格子恢复为空位
        state[row][col] = '#'
        cols[col] = diags1[diag1] = diags2[diag2] = false
      end
    end
  end
end

# 求解 n 皇后
def n_queens(n)
  # 初始化 n*n 大小的棋盘，其中 'Q' 代表皇后，'#' 代表空位
  state = Array.new(n) { Array.new(n, '#') }
  cols = [false] * n # 记录列是否有皇后
  diags1 = [false] * (2 * n - 1) # 记录主对角线上是否有皇后
  diags2 = [false] * (2 * n - 1) # 记录次对角线上是否有皇后
  res = []

  Backtracking.backtrack(0, n, state, res, cols, diags1, diags2)

  res
end

n = 4
res = n_queens(n)

puts "输入棋盘长宽为 #{n}"
puts "皇后放置方案共有 #{res.size} 种"
res.each_with_index do |state, index|
  puts "--------------------"
  puts "方案 #{index + 1}:"
  state.each { |row| puts row.join(' ') }
end