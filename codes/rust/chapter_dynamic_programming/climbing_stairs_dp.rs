/*
 * File: climbing_stairs_dp.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 爬楼梯：动态规划 */
pub fn climbing_stairs_dp(n: usize) -> usize {
    // 已知 dp[1] 和 dp[2] ，返回之
    if n == 1 || n == 2 {
        return n;
    }
    // 初始化 dp 表，用于存储子问题的解
    let mut dp = vec![0; n + 1];
    // 初始状态：预设最小子问题的解
    dp[1] = 1;
    dp[2] = 2;
    // 状态转移：从较小子问题逐步求解较大子问题
    for i in 3..=n {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    dp[n]
}

/* 爬楼梯：空间优化后的动态规划 */
pub fn climbing_stairs_dp_comp(n: usize) -> usize {
    if n == 1 || n == 2 {
        return n;
    }
    let (mut a, mut b) = (1, 2);
    for _ in 3..=n {
        (a, b) = (b, a + b);
    }
    b
}

/* Driver Code */
fn main() {
    let n = 9;

    let res = climbing_stairs_dp(n);
    println!("爬 {n} 阶楼梯共有 {res} 种方案");

    let res = climbing_stairs_dp_comp(n);
    println!("爬 {n} 阶楼梯共有 {res} 种方案");
}
