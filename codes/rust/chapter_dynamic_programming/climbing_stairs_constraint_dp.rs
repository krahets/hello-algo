/*
 * File: climbing_stairs_constraint_dp.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 带约束爬楼梯：动态规划 */
pub fn climbing_stairs_constraint_dp(n: usize) -> usize {
    if n == 1 || n == 2 {
        return 1;
    };
    // 初始化 dp 表，用于存储子问题的解
    // 内层如果使用数组 [usize; 3] 会浪费一个字宽的空间，如果使用 [usize; 2]，
    // 索引偏移虽然会被编译期求值而零开销，但可读性会降低。这里使用元组并令字段 0
    // 为零大小类型，可以节省空间并保持良好的可读性。
    let mut dp = vec![((), 0, 0); n + 1];
    // 初始状态：预设最小子问题的解
    dp[1].1 = 1;
    dp[1].2 = 0;
    dp[2].1 = 0;
    dp[2].2 = 1;
    // 状态转移：从较小子问题逐步求解较大子问题
    for i in 3..=n {
        dp[i].1 = dp[i - 1].2;
        dp[i].2 = dp[i - 2].1 + dp[i - 2].2;
    }
    dp[n].1 + dp[n].2
}

/* Driver Code */
fn main() {
    let n = 9;

    let res = climbing_stairs_constraint_dp(n);
    println!("爬 {n} 阶楼梯共有 {res} 种方案");
}
