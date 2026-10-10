=begin
File: n_queens.rb
Created Time: 2024-05-21
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Backtracking: n queens ###
def backtrack(row, n, state, res, cols, diags1, diags2)
  # When all rows are placed, record the solution
  if row == n
    res << state.map { |row| row.dup }
    return
  end

  # Traverse all columns
  for col in 0...n
    # Calculate the main diagonal and anti-diagonal corresponding to this cell
    diag1 = row - col + n - 1
    diag2 = row + col
    # Pruning: do not allow queens to exist in the column, main diagonal, and anti-diagonal of this cell
    if !cols[col] && !diags1[diag1] && !diags2[diag2]
      # Attempt: place the queen in this cell
      state[row][col] = "Q"
      cols[col] = diags1[diag1] = diags2[diag2] = true
      # Place the next row
      backtrack(row + 1, n, state, res, cols, diags1, diags2)
      # Backtrack: restore this cell to an empty cell
      state[row][col] = "#"
      cols[col] = diags1[diag1] = diags2[diag2] = false
    end
  end
end

### Solve n queens ###
def n_queens(n)
  # Initialize an n*n chessboard, where 'Q' represents a queen and '#' represents an empty cell
  state = Array.new(n) { Array.new(n, "#") }
  cols = Array.new(n, false) # Record whether there is a queen in the column
  diags1 = Array.new(2 * n - 1, false) # Record whether there is a queen on the main diagonal
  diags2 = Array.new(2 * n - 1, false) # Record whether there is a queen on the anti-diagonal
  res = []
  backtrack(0, n, state, res, cols, diags1, diags2)

  res
end

### Driver Code ###
if __FILE__ == $0
  n = 4
  res = n_queens(n)

  puts "Input board size is #{n}"
  puts "Total queen placement solutions: #{res.length}"

  for state in res
    puts "--------------------"
    for row in state
      p row
    end
  end
end
