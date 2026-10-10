=begin
File: n_queens.rb
Created Time: 2024-05-21
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### バックトラッキング法：Nクイーン ###
def backtrack(row, n, state, res, cols, diags1, diags2)
  # すべての行への配置が完了したら、解を記録する
  if row == n
    res << state.map { |row| row.dup }
    return
  end

  # すべての列を走査
  for col in 0...n
    # このマスに対応する主対角線と副対角線を計算
    diag1 = row - col + n - 1
    diag2 = row + col
    # 枝刈り：そのマスの列、主対角線、副対角線にクイーンがあってはならない
    if !cols[col] && !diags1[diag1] && !diags2[diag2]
      # 試行：そのマスにクイーンを置く
      state[row][col] = "Q"
      cols[col] = diags1[diag1] = diags2[diag2] = true
      # 次の行に配置する
      backtrack(row + 1, n, state, res, cols, diags1, diags2)
      # 戻す：そのマスを空きマスに戻す
      state[row][col] = "#"
      cols[col] = diags1[diag1] = diags2[diag2] = false
    end
  end
end

### Nクイーンを解く ###
def n_queens(n)
  # n*n の盤面を初期化する。'Q' はクイーン、'#' は空きマスを表す
  state = Array.new(n) { Array.new(n, "#") }
  cols = Array.new(n, false) # 列にクイーンがあるか記録
  diags1 = Array.new(2 * n - 1, false) # 主対角線にクイーンがあるかを記録
  diags2 = Array.new(2 * n - 1, false) # 副対角線にクイーンがあるかを記録
  res = []
  backtrack(0, n, state, res, cols, diags1, diags2)

  res
end

### Driver Code ###
if __FILE__ == $0
  n = 4
  res = n_queens(n)

  puts "入力した盤面の縦横は #{n}"
  puts "クイーンの配置方法は全部で #{res.length} 通り"

  for state in res
    puts "--------------------"
    for row in state
      p row
    end
  end
end
