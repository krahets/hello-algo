/*
 * File: unbounded_knapsack.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 完全背包：動態規劃 */
fn unbounded_knapsack_dp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
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
                dp[i][c] = std::cmp::max(dp[i - 1][c], dp[i][c - wgt[i - 1] as usize] + val[i - 1]);
            }
        }
    }
    return dp[n][cap];
}

/* 完全背包：空間最佳化後的動態規劃 */
fn unbounded_knapsack_dp_comp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
    let n = wgt.len();
    // 初始化 dp 表
    let mut dp = vec![0; cap + 1];
    // 狀態轉移
    for i in 1..=n {
        for c in 1..=cap {
            if wgt[i - 1] > c as i32 {
                // 若超過背包容量，則不選物品 i
                dp[c] = dp[c];
            } else {
                // 不選和選物品 i 這兩種方案的較大值
                dp[c] = std::cmp::max(dp[c], dp[c - wgt[i - 1] as usize] + val[i - 1]);
            }
        }
    }
    dp[cap]
}

/* Driver Code */
pub fn main() {
    let wgt = [1, 2, 3];
    let val = [5, 11, 15];
    let cap: usize = 4;

    // 動態規劃
    let res = unbounded_knapsack_dp(&wgt, &val, cap);
    println!("不超過背包容量的最大物品價值為 {res}");

    // 空間最佳化後的動態規劃
    let res = unbounded_knapsack_dp_comp(&wgt, &val, cap);
    println!("不超過背包容量的最大物品價值為 {res}");
}
