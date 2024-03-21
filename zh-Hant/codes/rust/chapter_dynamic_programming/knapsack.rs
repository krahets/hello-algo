/*
 * File: knapsack.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 0-1 背包：暴力搜尋 */
fn knapsack_dfs(wgt: &[i32], val: &[i32], i: usize, c: usize) -> i32 {
    // 若已選完所有物品或背包無剩餘容量，則返回價值 0
    if i == 0 || c == 0 {
        return 0;
    }
    // 若超過背包容量，則只能選擇不放入背包
    if wgt[i - 1] > c as i32 {
        return knapsack_dfs(wgt, val, i - 1, c);
    }
    // 計算不放入和放入物品 i 的最大價值
    let no = knapsack_dfs(wgt, val, i - 1, c);
    let yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1] as usize) + val[i - 1];
    // 返回兩種方案中價值更大的那一個
    std::cmp::max(no, yes)
}

/* 0-1 背包：記憶化搜尋 */
fn knapsack_dfs_mem(wgt: &[i32], val: &[i32], mem: &mut Vec<Vec<i32>>, i: usize, c: usize) -> i32 {
    // 若已選完所有物品或背包無剩餘容量，則返回價值 0
    if i == 0 || c == 0 {
        return 0;
    }
    // 若已有記錄，則直接返回
    if mem[i][c] != -1 {
        return mem[i][c];
    }
    // 若超過背包容量，則只能選擇不放入背包
    if wgt[i - 1] > c as i32 {
        return knapsack_dfs_mem(wgt, val, mem, i - 1, c);
    }
    // 計算不放入和放入物品 i 的最大價值
    let no = knapsack_dfs_mem(wgt, val, mem, i - 1, c);
    let yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1] as usize) + val[i - 1];
    // 記錄並返回兩種方案中價值更大的那一個
    mem[i][c] = std::cmp::max(no, yes);
    mem[i][c]
}

/* 0-1 背包：動態規劃 */
fn knapsack_dp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
    let n = wgt.len();
    // 初始化 dp 表
    let mut dp = vec![vec![0; cap + 1]; n + 1];
    // 狀態轉移
    for i in 1..=n {
        for c in 1..=cap {
            if wgt[i - 1] > c as i32 {
                // 若超過背包容量，則不選物品 i
                dp[i][c] = dp[i - 1][c];
            } else {
                // 不選和選物品 i 這兩種方案的較大值
                dp[i][c] = std::cmp::max(
                    dp[i - 1][c],
                    dp[i - 1][c - wgt[i - 1] as usize] + val[i - 1],
                );
            }
        }
    }
    dp[n][cap]
}

/* 0-1 背包：空間最佳化後的動態規劃 */
fn knapsack_dp_comp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
    let n = wgt.len();
    // 初始化 dp 表
    let mut dp = vec![0; cap + 1];
    // 狀態轉移
    for i in 1..=n {
        // 倒序走訪
        for c in (1..=cap).rev() {
            if wgt[i - 1] <= c as i32 {
                // 不選和選物品 i 這兩種方案的較大值
                dp[c] = std::cmp::max(dp[c], dp[c - wgt[i - 1] as usize] + val[i - 1]);
            }
        }
    }
    dp[cap]
}

/* Driver Code */
pub fn main() {
    let wgt = [10, 20, 30, 40, 50];
    let val = [50, 120, 150, 210, 240];
    let cap: usize = 50;
    let n = wgt.len();

    // 暴力搜尋
    let res = knapsack_dfs(&wgt, &val, n, cap);
    println!("不超過背包容量的最大物品價值為 {res}");

    // 記憶搜尋
    let mut mem = vec![vec![0; cap + 1]; n + 1];
    for row in mem.iter_mut() {
        row.fill(-1);
    }
    let res = knapsack_dfs_mem(&wgt, &val, &mut mem, n, cap);
    println!("不超過背包容量的最大物品價值為 {res}");

    // 動態規劃
    let res = knapsack_dp(&wgt, &val, cap);
    println!("不超過背包容量的最大物品價值為 {res}");

    // 空間最佳化後的動態規劃
    let res = knapsack_dp_comp(&wgt, &val, cap);
    println!("不超過背包容量的最大物品價值為 {res}");
}
