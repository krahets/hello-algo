=begin
File: n_queens.rb
Created Time: 2024-05-21
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Backtracking: n-queens ###
def backtrack(row, n, state, res, cols, diags1, diags2)
  # Record the solution once every row has a queen
  if row == n
    res << state.map { |row| row.dup }
    return
  end

  # Try each column
  for col in 0...n
    # Find the two diagonals through this square
    diag1 = row - col + n - 1
    diag2 = row + col
    # Prune if the column or either diagonal already has a queen
    if !cols[col] && !diags1[diag1] && !diags2[diag2]
      # Try placing a queen on this square
      state[row][col] = "Q"
      cols[col] = diags1[diag1] = diags2[diag2] = true
      # Place a queen in the next row
      backtrack(row + 1, n, state, res, cols, diags1, diags2)
      # Backtrack: clear this square
      state[row][col] = "#"
      cols[col] = diags1[diag1] = diags2[diag2] = false
    end
  end
end

### Solve the n-queens problem ###
def n_queens(n)
  # Set up an n-by-n board with 'Q' for a queen and '#' for an empty square
  state = Array.new(n) { Array.new(n, "#") }
  cols = Array.new(n, false) # Track occupied columns
  diags1 = Array.new(2 * n - 1, false) # Track occupied main diagonals
  diags2 = Array.new(2 * n - 1, false) # Track occupied secondary diagonals
  res = []
  backtrack(0, n, state, res, cols, diags1, diags2)

  res
end

### Driver code ###
if __FILE__ == $0
  n = 4
  res = n_queens(n)

  puts "Board side length: #{n}"
  puts "Found #{res.length} queen arrangements"

  for state in res
    puts "--------------------"
    for row in state
      p row
    end
  end
end
