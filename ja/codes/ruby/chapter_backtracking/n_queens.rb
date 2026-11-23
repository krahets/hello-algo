=begin
File: n_queens.rb
Created Time: 2024-05-21
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### バックトラッキング：n クイーン ###
def backtrack(row, n, state, res, cols, diags1, diags2)
  # すべての行への配置が終わったら、解を記録する
  if row == n
    res << state.map { |row| row.dup }
    return
  end

  # すべての列を走査する
  for col in 0...n
    # このマスに対応する主対角線と副対角線を求める
    diag1 = row - col + n - 1
    diag2 = row + col
    # 枝刈り：このマスと同じ列、主対角線、副対角線にクイーンがあってはならない
    if !cols[col] && !diags1[diag1] && !diags2[diag2]
      # 試行：このマスにクイーンを配置する
      state[row][col] = "Q"
      cols[col] = diags1[diag1] = diags2[diag2] = true
      # 次の行に配置する
      backtrack(row + 1, n, state, res, cols, diags1, diags2)
      # 復元：このマスを空きマスに戻す
      state[row][col] = "#"
      cols[col] = diags1[diag1] = diags2[diag2] = false
    end
  end
end

### n クイーン問題を解く ###
def n_queens(n)
  # n*n の盤面を初期化する。'Q' はクイーン、'#' は空きマスを表す
  state = Array.new(n) { Array.new(n, "#") }
  cols = Array.new(n, false) # 列にクイーンがあるかどうかを記録する
  diags1 = Array.new(2 * n - 1, false) # 主対角線にクイーンがあるかどうかを記録する
  diags2 = Array.new(2 * n - 1, false) # 副対角線にクイーンがあるかどうかを記録する
  res = []
  backtrack(0, n, state, res, cols, diags1, diags2)

  res
end

### 実行用コード ###
if __FILE__ == $0
  n = 4
  res = n_queens(n)

  puts "入力した盤面の縦横の長さは #{n}"
  puts "クイーンの配置方法は全部で #{res.length} 通り"

  for state in res
    puts "--------------------"
    for row in state
      p row
    end
  end
end
