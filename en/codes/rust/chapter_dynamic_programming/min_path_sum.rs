/*
 * File: min_path_sum.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Minimum path sum: brute-force search */
fn min_path_sum_dfs(grid: &Vec<Vec<i32>>, i: i32, j: i32) -> i32 {
    // Stop searching at the top-left cell
    if i == 0 && j == 0 {
        return grid[0][0];
    }
    // If a row or column index is out of bounds, return i32::MAX to represent infinite cost
    if i < 0 || j < 0 {
        return i32::MAX;
    }
    // Calculate the minimum path costs from the top-left corner to (i-1, j) and (i, j-1)
    let up = min_path_sum_dfs(grid, i - 1, j);
    let left = min_path_sum_dfs(grid, i, j - 1);
    // Return the minimum path cost from the top-left corner to (i, j)
    std::cmp::min(left, up) + grid[i as usize][j as usize]
}

/* Minimum path sum: memoized search */
fn min_path_sum_dfs_mem(grid: &Vec<Vec<i32>>, mem: &mut Vec<Vec<i32>>, i: i32, j: i32) -> i32 {
    // Stop searching at the top-left cell
    if i == 0 && j == 0 {
        return grid[0][0];
    }
    // If a row or column index is out of bounds, return i32::MAX to represent infinite cost
    if i < 0 || j < 0 {
        return i32::MAX;
    }
    // If a result has already been recorded, return it directly
    if mem[i as usize][j as usize] != -1 {
        return mem[i as usize][j as usize];
    }
    // Minimum path costs to the cells on the left and above
    let up = min_path_sum_dfs_mem(grid, mem, i - 1, j);
    let left = min_path_sum_dfs_mem(grid, mem, i, j - 1);
    // Record and return the minimum path cost from the top-left corner to (i, j)
    mem[i as usize][j as usize] = std::cmp::min(left, up) + grid[i as usize][j as usize];
    mem[i as usize][j as usize]
}

/* Minimum path sum: dynamic programming */
fn min_path_sum_dp(grid: &Vec<Vec<i32>>) -> i32 {
    let (n, m) = (grid.len(), grid[0].len());
    // Initialize the dp table
    let mut dp = vec![vec![0; m]; n];
    dp[0][0] = grid[0][0];
    // State transitions: first row
    for j in 1..m {
        dp[0][j] = dp[0][j - 1] + grid[0][j];
    }
    // State transitions: first column
    for i in 1..n {
        dp[i][0] = dp[i - 1][0] + grid[i][0];
    }
    // State transitions: remaining rows and columns
    for i in 1..n {
        for j in 1..m {
            dp[i][j] = std::cmp::min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
        }
    }
    dp[n - 1][m - 1]
}

/* Minimum path sum: space-optimized dynamic programming */
fn min_path_sum_dp_comp(grid: &Vec<Vec<i32>>) -> i32 {
    let (n, m) = (grid.len(), grid[0].len());
    // Initialize the dp table
    let mut dp = vec![0; m];
    // State transitions: first row
    dp[0] = grid[0][0];
    for j in 1..m {
        dp[j] = dp[j - 1] + grid[0][j];
    }
    // State transitions: remaining rows
    for i in 1..n {
        // State transitions: first column
        dp[0] = dp[0] + grid[i][0];
        // State transitions: remaining columns
        for j in 1..m {
            dp[j] = std::cmp::min(dp[j - 1], dp[j]) + grid[i][j];
        }
    }
    dp[m - 1]
}

/* Driver code */
pub fn main() {
    let grid = vec![
        vec![1, 3, 1, 5],
        vec![2, 2, 4, 2],
        vec![5, 3, 2, 1],
        vec![4, 3, 5, 2],
    ];
    let (n, m) = (grid.len(), grid[0].len());

    // Brute-force search
    let res = min_path_sum_dfs(&grid, n as i32 - 1, m as i32 - 1);
    println!("Minimum path sum from the top-left to the bottom-right corner: {res}");

    // Memoized search
    let mut mem = vec![vec![0; m]; n];
    for row in mem.iter_mut() {
        row.fill(-1);
    }
    let res = min_path_sum_dfs_mem(&grid, &mut mem, n as i32 - 1, m as i32 - 1);
    println!("Minimum path sum from the top-left to the bottom-right corner: {res}");

    // Dynamic programming
    let res = min_path_sum_dp(&grid);
    println!("Minimum path sum from the top-left to the bottom-right corner: {res}");

    // Space-optimized dynamic programming
    let res = min_path_sum_dp_comp(&grid);
    println!("Minimum path sum from the top-left to the bottom-right corner: {res}");
}
