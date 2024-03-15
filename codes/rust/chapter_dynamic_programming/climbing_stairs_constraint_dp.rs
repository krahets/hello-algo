/*
 * File: climbing_stairs_constraint_dp.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 带约束爬楼梯：动态规划 */
fn climbing_stairs_constraint_dp(n: usize) -> i32 {
    if n == 1 || n == 2 {
        return 1;
    };
    // 初始化 dp 表，用于存储子问题的解
    let mut dp = vec![vec![-1; 3]; n + 1];
    // 初始状态：预设最小子问题的解
    dp[1][1] = 1;
    dp[1][2] = 0;
    dp[2][1] = 0;
    dp[2][2] = 1;
    // 状态转移：从较小子问题逐步求解较大子问题
    for i in 3..=n {
        dp[i][1] = dp[i - 1][2];
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
    }
    dp[n][1] + dp[n][2]
}

/* Driver Code */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_constraint_dp(n);
    println!("爬 {n} 阶楼梯共有 {res} 种方案");
}
