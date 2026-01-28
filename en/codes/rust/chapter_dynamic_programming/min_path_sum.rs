/*
 * File: min_path_sum.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Minimum path sum: Brute-force search */
fn min_path_sum_dfs(grid: &Vec<Vec<i32>>, i: i32, j: i32) -> i32 {
    // If it's the top-left cell, terminate the search
    if i == 0 && j == 0 {
        return grid[0][0];
    }
    // If row or column index is out of bounds, return +∞ cost
    if i < 0 || j < 0 {
        return i32::MAX;
    }
    // Calculate the minimum path cost from top-left to (i-1, j) and (i, j-1)
    let up = min_path_sum_dfs(grid, i - 1, j);
    let left = min_path_sum_dfs(grid, i, j - 1);
    // Return the minimum path cost from top-left to (i, j)
    std::cmp::min(left, up) + grid[i as usize][j as usize]
}

/* Minimum path sum: Memoization search */
fn min_path_sum_dfs_mem(grid: &Vec<Vec<i32>>, mem: &mut Vec<Vec<i32>>, i: i32, j: i32) -> i32 {
    // If it's the top-left cell, terminate the search
    if i == 0 && j == 0 {
        return grid[0][0];
    }
    // If row or column index is out of bounds, return +∞ cost
    if i < 0 || j < 0 {
        return i32::MAX;
    }
    // If there's a record, return it directly
    if mem[i as usize][j as usize] != -1 {
        return mem[i as usize][j as usize];
    }
    // Minimum path cost for left and upper cells
    let up = min_path_sum_dfs_mem(grid, mem, i - 1, j);
    let left = min_path_sum_dfs_mem(grid, mem, i, j - 1);
    // Record and return the minimum path cost from top-left to (i, j)
    mem[i as usize][j as usize] = std::cmp::min(left, up) + grid[i as usize][j as usize];
    mem[i as usize][j as usize]
}

/* Minimum path sum: Dynamic programming */
fn min_path_sum_dp(grid: &Vec<Vec<i32>>) -> i32 {
    let (n, m) = (grid.len(), grid[0].len());
    // Initialize dp table
    let mut dp = vec![vec![0; m]; n];
    dp[0][0] = grid[0][0];
    // State transition: first row
    for j in 1..m {
        dp[0][j] = dp[0][j - 1] + grid[0][j];
    }
    // State transition: first column
    for i in 1..n {
        dp[i][0] = dp[i - 1][0] + grid[i][0];
    }
    // State transition: rest of the rows and columns
    for i in 1..n {
        for j in 1..m {
            dp[i][j] = std::cmp::min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
        }
    }
    dp[n - 1][m - 1]
}

/* Minimum path sum: Space-optimized dynamic programming */
fn min_path_sum_dp_comp(grid: &Vec<Vec<i32>>) -> i32 {
    let (n, m) = (grid.len(), grid[0].len());
    // Initialize dp table
    let mut dp = vec![0; m];
    // State transition: first row
    dp[0] = grid[0][0];
    for j in 1..m {
        dp[j] = dp[j - 1] + grid[0][j];
    }
    // State transition: rest of the rows
    for i in 1..n {
        // State transition: first column
        dp[0] = dp[0] + grid[i][0];
        // State transition: rest of the columns
        for j in 1..m {
            dp[j] = std::cmp::min(dp[j - 1], dp[j]) + grid[i][j];
        }
    }
    dp[m - 1]
}

/* Driver Code */
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
    println!("Minimum path sum from top-left to bottom-right is {res}");

    // Memoization search
    let mut mem = vec![vec![0; m]; n];
    for row in mem.iter_mut() {
        row.fill(-1);
    }
    let res = min_path_sum_dfs_mem(&grid, &mut mem, n as i32 - 1, m as i32 - 1);
    println!("Minimum path sum from top-left to bottom-right is {res}");

    // Dynamic programming
    let res = min_path_sum_dp(&grid);
    println!("Minimum path sum from top-left to bottom-right is {res}");

    // Space-optimized dynamic programming
    let res = min_path_sum_dp_comp(&grid);
    println!("Minimum path sum from top-left to bottom-right is {res}");
}
