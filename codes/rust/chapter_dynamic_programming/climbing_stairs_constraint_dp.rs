/*
 * File: climbing_stairs_constraint_dp.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 带约束爬楼梯：动态规划 */
pub fn climbing_stairs_constraint_dp(n: u32) -> u32 {
    // 出于语义考虑，此处令参数和返回值的类型为 u32 而非 usize，
    // 因为 u32 是天然的非负整数类型，而 usize 则用于索引和内存
    // 分配，属于抽象层次更低的底层细节。

    if n == 1 || n == 2 {
        return 1;
    }

    // 这里转换为 usize 类型以便于索引访问，这个转换在 32 位及
    // 以上平台是安全且零开销的，但在 16 位及以下平台上可能发生
    // 截断，此时程序不健全，应退而求其次，使用 usize 类型作为参
    // 数和返回值。
    let n = n as usize;

    // 初始化 dp 表，用于存储子问题的解
    // 内层如果使用数组 [u32; 3] 会浪费 4 个字节的空间，如果使
    // 用 [u32; 2]，索引偏移虽然因为编译期求值而没有开销，但可
    // 读性会下降。这里使用元组并令字段 0 为零大小类型，可以节省
    // 空间并保持良好的可读性。
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
