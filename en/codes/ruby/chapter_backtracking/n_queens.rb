=begin
File: n_queens.rb
Created Time: 2024-05-21
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Backtracking: n-queens ###
def backtrack(row, n, state, res, cols, diags1, diags2)
  # Record a solution when a queen has been placed in every row
  if row == n
    res << state.map { |row| row.dup }
    return
  end

  # Iterate over all columns
  for col in 0...n
    # Calculate the main-diagonal and anti-diagonal indices for this square
    diag1 = row - col + n - 1
    diag2 = row + col
    # Prune: the square must have no queen in its column, main diagonal, or anti-diagonal
    if !cols[col] && !diags1[diag1] && !diags2[diag2]
      # Try: place a queen on this square
      state[row][col] = "Q"
      cols[col] = diags1[diag1] = diags2[diag2] = true
      # Place a queen in the next row
      backtrack(row + 1, n, state, res, cols, diags1, diags2)
      # Backtrack: restore this square to empty
      state[row][col] = "#"
      cols[col] = diags1[diag1] = diags2[diag2] = false
    end
  end
end

### Solve the n-queens problem ###
def n_queens(n)
  # Initialize an n*n board, where 'Q' represents a queen and '#' represents an empty square
  state = Array.new(n) { Array.new(n, "#") }
  cols = Array.new(n, false) # Track whether a column contains a queen
  diags1 = Array.new(2 * n - 1, false) # Track whether a main diagonal contains a queen
  diags2 = Array.new(2 * n - 1, false) # Track whether an anti-diagonal contains a queen
  res = []
  backtrack(0, n, state, res, cols, diags1, diags2)

  res
end

### Driver code ###
if __FILE__ == $0
  n = 4
  res = n_queens(n)

  puts "Input board width and height: #{n}"
  puts "Number of queen arrangements: #{res.length}"

  for state in res
    puts "--------------------"
    for row in state
      p row
    end
  end
end
