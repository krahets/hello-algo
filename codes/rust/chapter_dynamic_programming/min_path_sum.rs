/*
 * File: min_path_sum.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

use std::cmp;

/* 最小路径和：暴力搜索 */
pub fn min_path_sum_dfs(grid: &[Vec<u32>], i: usize, j: usize) -> u32 {
    // 由调用者保证 i 和 j 不越界

    // 若为左上角单元格，则终止搜索
    if i == 0 && j == 0 {
        return grid[0][0];
    }
    // 左边和上边单元格的最小路径代价
    let up = match i.checked_sub(1) {
        // 若行索引越界，则代价为 +∞
        None => u32::MAX,
        Some(i) => min_path_sum_dfs(grid, i, j),
    };
    let left = match j.checked_sub(1) {
        // 若列索引越界，则代价为 +∞
        None => u32::MAX,
        Some(j) => min_path_sum_dfs(grid, i, j),
    };
    // 返回从左上角到 (i, j) 的最小路径代价
    cmp::min(left, up) + grid[i][j]
}

/* 最小路径和：记忆化搜索 */
pub fn min_path_sum_dfs_mem(
    grid: &[Vec<u32>],
    mem: &mut Vec<Vec<Option<u32>>>,
    i: usize,
    j: usize,
) -> u32 {
    // 由调用者保证 i 和 j 不越界

    // 若为左上角单元格，则终止搜索
    if i == 0 && j == 0 {
        return grid[0][0];
    }
    // 若已有记录，则直接返回
    if let Some(cost) = mem[i][j] {
        return cost;
    }
    // 左边和上边单元格的最小路径代价
    let up = match i.checked_sub(1) {
        // 若行索引越界，代价为 +∞
        None => u32::MAX,
        Some(i) => min_path_sum_dfs_mem(grid, mem, i, j),
    };
    let left = match j.checked_sub(1) {
        // 若列索引越界，代价为 +∞
        None => u32::MAX,
        Some(j) => min_path_sum_dfs_mem(grid, mem, i, j),
    };
    // 记录并返回左上角到 (i, j) 的最小路径代价
    let cost = cmp::min(left, up) + grid[i][j];
    mem[i][j] = Some(cost);
    cost
}

/* 最小路径和：动态规划 */
pub fn min_path_sum_dp(grid: &[Vec<u32>]) -> u32 {
    let (n, m) = (grid.len(), grid[0].len());
    if n == 0 || m == 0 {
        // grid 为空，提前返回
        return 0;
    }
    // 初始化 dp 表
    let mut dp = vec![vec![0; m]; n];
    // dp 和 grid 保证不为空，此处不会越界
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
            dp[i][j] = cmp::min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
        }
    }
    dp[n - 1][m - 1]
}

/* 最小路径和：空间优化后的动态规划 */
#[allow(clippy::needless_range_loop)]
pub fn min_path_sum_dp_comp(grid: &[Vec<u32>]) -> u32 {
    let (n, m) = (grid.len(), grid[0].len());
    if n == 0 || m == 0 {
        // grid 为空，提前返回
        return 0;
    }
    // 初始化 dp 表
    let mut dp = vec![0; m];
    // dp 和 grid 保证不为空，此处不会越界
    dp[0] = grid[0][0];
    // 状态转移：首行
    for j in 1..m {
        dp[j] = dp[j - 1] + grid[0][j];
    }
    // 状态转移：其余行
    for i in 1..n {
        // 状态转移：首列
        dp[0] += grid[i][0];
        // 状态转移：其余列
        for j in 1..m {
            dp[j] = cmp::min(dp[j - 1], dp[j]) + grid[i][j];
        }
    }
    dp[m - 1]
}

/* Driver Code */
fn main() {
    let grid = vec![
        vec![1, 3, 1, 5],
        vec![2, 2, 4, 2],
        vec![5, 3, 2, 1],
        vec![4, 3, 5, 2],
    ];
    let (n, m) = (grid.len(), grid[0].len());

    // 暴力搜索
    let res = min_path_sum_dfs(&grid, n - 1, m - 1);
    println!("从左上角到右下角的最小路径和为 {res}");

    // 记忆化搜索
    let mut mem = vec![vec![None; m]; n];
    let res = min_path_sum_dfs_mem(&grid, &mut mem, n - 1, m - 1);
    println!("从左上角到右下角的最小路径和为 {res}");

    // 动态规划
    let res = min_path_sum_dp(&grid);
    println!("从左上角到右下角的最小路径和为 {res}");

    // 空间优化后的动态规划
    let res = min_path_sum_dp_comp(&grid);
    println!("从左上角到右下角的最小路径和为 {res}");
}
