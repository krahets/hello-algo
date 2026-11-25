=begin
File: n_queens.rb
Created Time: 2024-05-21
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 回溯演算法：n 皇后 ###
def backtrack(row, n, state, res, cols, diags1, diags2)
  # 每一列都放好皇后後，記錄此解
  if row == n
    res << state.map { |row| row.dup }
    return
  end

  # 逐一檢查各欄
  for col in 0...n
    # 計算這一格對應的主對角線與副對角線索引
    diag1 = row - col + n - 1
    diag2 = row + col
    # 剪枝：這一格所在的欄、主對角線及副對角線都不能已有皇后
    if !cols[col] && !diags1[diag1] && !diags2[diag2]
      # 嘗試：將皇后放在這一格
      state[row][col] = "Q"
      cols[col] = diags1[diag1] = diags2[diag2] = true
      # 在下一列放置皇后
      backtrack(row + 1, n, state, res, cols, diags1, diags2)
      # 回溯：將這一格還原為空位
      state[row][col] = "#"
      cols[col] = diags1[diag1] = diags2[diag2] = false
    end
  end
end

### 求解 n 皇后問題 ###
def n_queens(n)
  # 初始化 n*n 棋盤，'Q' 代表皇后，'#' 代表空位
  state = Array.new(n) { Array.new(n, "#") }
  cols = Array.new(n, false) # 記錄各欄是否已有皇后
  diags1 = Array.new(2 * n - 1, false) # 記錄各主對角線上是否已有皇后
  diags2 = Array.new(2 * n - 1, false) # 記錄各副對角線上是否已有皇后
  res = []
  backtrack(0, n, state, res, cols, diags1, diags2)

  res
end

### 主程式 ###
if __FILE__ == $0
  n = 4
  res = n_queens(n)

  puts "輸入棋盤的邊長為 #{n}"
  puts "皇后共有 #{res.length} 種擺法"

  for state in res
    puts "--------------------"
    for row in state
      p row
    end
  end
end
