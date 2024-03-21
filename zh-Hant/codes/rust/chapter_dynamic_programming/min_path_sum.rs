/*
 * File: min_path_sum.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 最小路径和：暴力搜索 */
fn min_path_sum_dfs(grid: &Vec<Vec<i32>>, i: i32, j: i32) -> i32 {
    // 若为左上角单元格，则终止搜索
    if i == 0 && j == 0 {
        return grid[0][0];
    }
    // 若行列索引越界，则返回 +∞ 代价
    if i < 0 || j < 0 {
        return i32::MAX;
    }
    // 计算从左上角到 (i-1, j) 和 (i, j-1) 的最小路径代价
    let up = min_path_sum_dfs(grid, i - 1, j);
    let left = min_path_sum_dfs(grid, i, j - 1);
    // 返回从左上角到 (i, j) 的最小路径代价
    std::cmp::min(left, up) + grid[i as usize][j as usize]
}

/* 最小路径和：记忆化搜索 */
fn min_path_sum_dfs_mem(grid: &Vec<Vec<i32>>, mem: &mut Vec<Vec<i32>>, i: i32, j: i32) -> i32 {
    // 若为左上角单元格，则终止搜索
    if i == 0 && j == 0 {
        return grid[0][0];
    }
    // 若行列索引越界，则返回 +∞ 代价
    if i < 0 || j < 0 {
        return i32::MAX;
    }
    // 若已有记录，则直接返回
    if mem[i as usize][j as usize] != -1 {
        return mem[i as usize][j as usize];
    }
    // 左边和上边单元格的最小路径代价
    let up = min_path_sum_dfs_mem(grid, mem, i - 1, j);
    let left = min_path_sum_dfs_mem(grid, mem, i, j - 1);
    // 记录并返回左上角到 (i, j) 的最小路径代价
    mem[i as usize][j as usize] = std::cmp::min(left, up) + grid[i as usize][j as usize];
    mem[i as usize][j as usize]
}

/* 最小路径和：动态规划 */
fn min_path_sum_dp(grid: &Vec<Vec<i32>>) -> i32 {
    let (n, m) = (grid.len(), grid[0].len());
    // 初始化 dp 表
    let mut dp = vec![vec![0; m]; n];
    dp[0][0] = grid[0][0];
    // 状态转移：首行
    for j in 1..m {
        dp[0][j] = dp[0][j - 1] + grid[0][j];
    }
    // 状态转移：首列
    for i in 1..n {
        dp[i][0] = dp[i - 1][0] + grid[i][0];
    }
    // 状态转移：其余行和列
    for i in 1..n {
        for j in 1..m {
            dp[i][j] = std::cmp::min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
        }
    }
    dp[n - 1][m - 1]
}

/* 最小路径和：空间优化后的动态规划 */
fn min_path_sum_dp_comp(grid: &Vec<Vec<i32>>) -> i32 {
    let (n, m) = (grid.len(), grid[0].len());
    // 初始化 dp 表
    let mut dp = vec![0; m];
    // 状态转移：首行
    dp[0] = grid[0][0];
    for j in 1..m {
        dp[j] = dp[j - 1] + grid[0][j];
    }
    // 状态转移：其余行
    for i in 1..n {
        // 状态转移：首列
        dp[0] = dp[0] + grid[i][0];
        // 状态转移：其余列
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

    // 暴力搜索
    let res = min_path_sum_dfs(&grid, n as i32 - 1, m as i32 - 1);
    println!("从左上角到右下角的最小路径和为 {res}");

    // 记忆化搜索
    let mut mem = vec![vec![0; m]; n];
    for row in mem.iter_mut() {
        row.fill(-1);
    }
    let res = min_path_sum_dfs_mem(&grid, &mut mem, n as i32 - 1, m as i32 - 1);
    println!("从左上角到右下角的最小路径和为 {res}");

    // 动态规划
    let res = min_path_sum_dp(&grid);
    println!("从左上角到右下角的最小路径和为 {res}");

    // 空间优化后的动态规划
    let res = min_path_sum_dp_comp(&grid);
    println!("从左上角到右下角的最小路径和为 {res}");
}
