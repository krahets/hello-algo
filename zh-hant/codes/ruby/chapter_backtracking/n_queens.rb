=begin
File: n_queens.rb
Created Time: 2024-05-21
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 回溯演算法：n 皇后 ###
def backtrack(row, n, state, res, cols, diags1, diags2)
  # 當放置完所有行時，記錄解
  if row == n
    res << state.map { |row| row.dup }
    return
  end

  # 走訪所有列
  for col in 0...n
    # 計算該格子對應的主對角線和次對角線
    diag1 = row - col + n - 1
    diag2 = row + col
    # 剪枝：不允許該格子所在列、主對角線、次對角線上存在皇后
    if !cols[col] && !diags1[diag1] && !diags2[diag2]
      # 嘗試：將皇后放置在該格子
      state[row][col] = "Q"
      cols[col] = diags1[diag1] = diags2[diag2] = true
      # 放置下一行
      backtrack(row + 1, n, state, res, cols, diags1, diags2)
      # 回退：將該格子恢復為空位
      state[row][col] = "#"
      cols[col] = diags1[diag1] = diags2[diag2] = false
    end
  end
end

### 求解 n 皇后 ###
def n_queens(n)
  # 初始化 n*n 大小的棋盤，其中 'Q' 代表皇后，'#' 代表空位
  state = Array.new(n) { Array.new(n, "#") }
  cols = Array.new(n, false) # 記錄列是否有皇后
  diags1 = Array.new(2 * n - 1, false) # 記錄主對角線上是否有皇后
  diags2 = Array.new(2 * n - 1, false) # 記錄次對角線上是否有皇后
  res = []
  backtrack(0, n, state, res, cols, diags1, diags2)

  res
end

### Driver Code ###
if __FILE__ == $0
  n = 4
  res = n_queens(n)

  puts "輸入棋盤長寬為 #{n}"
  puts "皇后放置方案共有 #{res.length} 種"

  for state in res
    puts "--------------------"
    for row in state
      p row
    end
  end
end
