/*
 * File: climbing_stairs_dp.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 爬楼梯：动态规划 */
pub fn climbing_stairs_dp(n: u32) -> u32 {
    // 出于语义考虑，此处令参数和返回值的类型为 u32 而非 usize，
    // 因为 u32 是天然的非负整数类型，而 usize 则用于索引和内存
    // 分配，属于抽象层次更低的底层细节。

    // 已知 dp[1] 和 dp[2] ，返回之
    if n == 1 || n == 2 {
        return n;
    }

    // 这里转换为 usize 类型以便于索引访问，这个转换在 32 位及
    // 以上平台是安全且零开销的，但在 16 位及以下平台上可能发生
    // 截断，此时程序不健全，应退而求其次，使用 usize 类型作为参
    // 数和返回值。
    let n = n as usize;

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
pub fn climbing_stairs_dp_comp(n: u32) -> u32 {
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
