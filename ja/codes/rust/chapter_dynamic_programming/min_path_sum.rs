/*
 * File: min_path_sum.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 最小経路和：全探索 */
fn min_path_sum_dfs(grid: &Vec<Vec<i32>>, i: i32, j: i32) -> i32 {
    // 左上のセルなら探索を終了する
    if i == 0 && j == 0 {
        return grid[0][0];
    }
    // 行または列のインデックスが範囲外なら、コスト +∞ を返す
    if i < 0 || j < 0 {
        return i32::MAX;
    }
    // 左上から (i-1, j) および (i, j-1) までの最小経路コストを計算する
    let up = min_path_sum_dfs(grid, i - 1, j);
    let left = min_path_sum_dfs(grid, i, j - 1);
    // 左上隅から (i, j) までの最小経路コストを返す
    std::cmp::min(left, up) + grid[i as usize][j as usize]
}

/* 最小経路和：メモ化探索 */
fn min_path_sum_dfs_mem(grid: &Vec<Vec<i32>>, mem: &mut Vec<Vec<i32>>, i: i32, j: i32) -> i32 {
    // 左上のセルなら探索を終了する
    if i == 0 && j == 0 {
        return grid[0][0];
    }
    // 行または列のインデックスが範囲外なら、コスト +∞ を返す
    if i < 0 || j < 0 {
        return i32::MAX;
    }
    // 既に記録があればそのまま返す
    if mem[i as usize][j as usize] != -1 {
        return mem[i as usize][j as usize];
    }
    // 左と上のセルからの最小経路コスト
    let up = min_path_sum_dfs_mem(grid, mem, i - 1, j);
    let left = min_path_sum_dfs_mem(grid, mem, i, j - 1);
    // 左上から (i, j) までの最小経路コストを記録して返す
    mem[i as usize][j as usize] = std::cmp::min(left, up) + grid[i as usize][j as usize];
    mem[i as usize][j as usize]
}

/* 最小経路和：動的計画法 */
fn min_path_sum_dp(grid: &Vec<Vec<i32>>) -> i32 {
    let (n, m) = (grid.len(), grid[0].len());
    // dp テーブルを初期化
    let mut dp = vec![vec![0; m]; n];
    dp[0][0] = grid[0][0];
    // 状態遷移：先頭行
    for j in 1..m {
        dp[0][j] = dp[0][j - 1] + grid[0][j];
    }
    // 状態遷移：先頭列
    for i in 1..n {
        dp[i][0] = dp[i - 1][0] + grid[i][0];
    }
    // 状態遷移: 残りの行と列
    for i in 1..n {
        for j in 1..m {
            dp[i][j] = std::cmp::min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
        }
    }
    dp[n - 1][m - 1]
}

/* 最小経路和：空間最適化後の動的計画法 */
fn min_path_sum_dp_comp(grid: &Vec<Vec<i32>>) -> i32 {
    let (n, m) = (grid.len(), grid[0].len());
    // dp テーブルを初期化
    let mut dp = vec![0; m];
    // 状態遷移：先頭行
    dp[0] = grid[0][0];
    for j in 1..m {
        dp[j] = dp[j - 1] + grid[0][j];
    }
    // 状態遷移：残りの行
    for i in 1..n {
        // 状態遷移：先頭列
        dp[0] = dp[0] + grid[i][0];
        // 状態遷移：残りの列
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

    // 全探索
    let res = min_path_sum_dfs(&grid, n as i32 - 1, m as i32 - 1);
    println!("左上から右下までの最小経路和は {res}");

    // メモ化探索
    let mut mem = vec![vec![0; m]; n];
    for row in mem.iter_mut() {
        row.fill(-1);
    }
    let res = min_path_sum_dfs_mem(&grid, &mut mem, n as i32 - 1, m as i32 - 1);
    println!("左上から右下までの最小経路和は {res}");

    // 動的計画法
    let res = min_path_sum_dp(&grid);
    println!("左上から右下までの最小経路和は {res}");

    // 空間最適化後の動的計画法
    let res = min_path_sum_dp_comp(&grid);
    println!("左上から右下までの最小経路和は {res}");
}
