/*
 * File: min_path_sum.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 最小路徑和：暴力搜尋 */
fn min_path_sum_dfs(grid: &Vec<Vec<i32>>, i: i32, j: i32) -> i32 {
    // 若為左上角單元格，則終止搜尋
    if i == 0 && j == 0 {
        return grid[0][0];
    }
    // 若行列索引越界，則返回 +∞ 代價
    if i < 0 || j < 0 {
        return i32::MAX;
    }
    // 計算從左上角到 (i-1, j) 和 (i, j-1) 的最小路徑代價
    let up = min_path_sum_dfs(grid, i - 1, j);
    let left = min_path_sum_dfs(grid, i, j - 1);
    // 返回從左上角到 (i, j) 的最小路徑代價
    std::cmp::min(left, up) + grid[i as usize][j as usize]
}

/* 最小路徑和：記憶化搜尋 */
fn min_path_sum_dfs_mem(grid: &Vec<Vec<i32>>, mem: &mut Vec<Vec<i32>>, i: i32, j: i32) -> i32 {
    // 若為左上角單元格，則終止搜尋
    if i == 0 && j == 0 {
        return grid[0][0];
    }
    // 若行列索引越界，則返回 +∞ 代價
    if i < 0 || j < 0 {
        return i32::MAX;
    }
    // 若已有記錄，則直接返回
    if mem[i as usize][j as usize] != -1 {
        return mem[i as usize][j as usize];
    }
    // 左邊和上邊單元格的最小路徑代價
    let up = min_path_sum_dfs_mem(grid, mem, i - 1, j);
    let left = min_path_sum_dfs_mem(grid, mem, i, j - 1);
    // 記錄並返回左上角到 (i, j) 的最小路徑代價
    mem[i as usize][j as usize] = std::cmp::min(left, up) + grid[i as usize][j as usize];
    mem[i as usize][j as usize]
}

/* 最小路徑和：動態規劃 */
fn min_path_sum_dp(grid: &Vec<Vec<i32>>) -> i32 {
    let (n, m) = (grid.len(), grid[0].len());
    // 初始化 dp 表
    let mut dp = vec![vec![0; m]; n];
    dp[0][0] = grid[0][0];
    // 狀態轉移：首行
    for j in 1..m {
        dp[0][j] = dp[0][j - 1] + grid[0][j];
    }
    // 狀態轉移：首列
    for i in 1..n {
        dp[i][0] = dp[i - 1][0] + grid[i][0];
    }
    // 狀態轉移：其餘行和列
    for i in 1..n {
        for j in 1..m {
            dp[i][j] = std::cmp::min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
        }
    }
    dp[n - 1][m - 1]
}

/* 最小路徑和：空間最佳化後的動態規劃 */
fn min_path_sum_dp_comp(grid: &Vec<Vec<i32>>) -> i32 {
    let (n, m) = (grid.len(), grid[0].len());
    // 初始化 dp 表
    let mut dp = vec![0; m];
    // 狀態轉移：首行
    dp[0] = grid[0][0];
    for j in 1..m {
        dp[j] = dp[j - 1] + grid[0][j];
    }
    // 狀態轉移：其餘行
    for i in 1..n {
        // 狀態轉移：首列
        dp[0] = dp[0] + grid[i][0];
        // 狀態轉移：其餘列
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

    // 暴力搜尋
    let res = min_path_sum_dfs(&grid, n as i32 - 1, m as i32 - 1);
    println!("從左上角到右下角的最小路徑和為 {res}");

    // 記憶化搜尋
    let mut mem = vec![vec![0; m]; n];
    for row in mem.iter_mut() {
        row.fill(-1);
    }
    let res = min_path_sum_dfs_mem(&grid, &mut mem, n as i32 - 1, m as i32 - 1);
    println!("從左上角到右下角的最小路徑和為 {res}");

    // 動態規劃
    let res = min_path_sum_dp(&grid);
    println!("從左上角到右下角的最小路徑和為 {res}");

    // 空間最佳化後的動態規劃
    let res = min_path_sum_dp_comp(&grid);
    println!("從左上角到右下角的最小路徑和為 {res}");
}
