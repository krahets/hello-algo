=begin
File: n_queens.rb
Created Time: 2024-05-21
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 백트래킹 알고리즘: n-퀸 ###
def backtrack(row, n, state, res, cols, diags1, diags2)
  # 모든 행에 배치했으면 해를 기록한다
  if row == n
    res << state.map { |row| row.dup }
    return
  end

  # 모든 열을 순회한다
  for col in 0...n
    # 해당 칸이 속한 주대각선과 부대각선을 계산한다
    diag1 = row - col + n - 1
    diag2 = row + col
    # 가지치기: 해당 칸이 속한 열, 주대각선, 부대각선에 퀸이 있으면 안 된다
    if !cols[col] && !diags1[diag1] && !diags2[diag2]
      # 시도: 해당 칸에 퀸을 놓는다
      state[row][col] = "Q"
      cols[col] = diags1[diag1] = diags2[diag2] = true
      # 다음 행에 배치한다
      backtrack(row + 1, n, state, res, cols, diags1, diags2)
      # 되돌리기: 해당 칸을 빈칸으로 되돌린다
      state[row][col] = "#"
      cols[col] = diags1[diag1] = diags2[diag2] = false
    end
  end
end

### n-퀸 문제 풀기 ###
def n_queens(n)
  # n*n 크기의 체스판을 초기화한다. 'Q'는 퀸, '#'은 빈칸을 나타낸다
  state = Array.new(n) { Array.new(n, "#") }
  cols = Array.new(n, false) # 열에 퀸이 있는지 기록한다
  diags1 = Array.new(2 * n - 1, false) # 주대각선에 퀸이 있는지 기록한다
  diags2 = Array.new(2 * n - 1, false) # 부대각선에 퀸이 있는지 기록한다
  res = []
  backtrack(0, n, state, res, cols, diags1, diags2)

  res
end

### 실행 코드 ###
if __FILE__ == $0
  n = 4
  res = n_queens(n)

  puts "입력한 체스판의 가로와 세로 길이: #{n}"
  puts "퀸을 배치하는 방법은 총 #{res.length}가지이다"

  for state in res
    puts "--------------------"
    for row in state
      p row
    end
  end
end
