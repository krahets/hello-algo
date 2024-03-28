/*
 * File: climbing_stairs_dp.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 爬樓梯：動態規劃 */
fn climbing_stairs_dp(n: usize) -> i32 {
    // 已知 dp[1] 和 dp[2] ，返回之
    if n == 1 || n == 2 {
        return n as i32;
    }
    // 初始化 dp 表，用於儲存子問題的解
    let mut dp = vec![-1; n + 1];
    // 初始狀態：預設最小子問題的解
    dp[1] = 1;
    dp[2] = 2;
    // 狀態轉移：從較小子問題逐步求解較大子問題
    for i in 3..=n {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    dp[n]
}

/* 爬樓梯：空間最佳化後的動態規劃 */
fn climbing_stairs_dp_comp(n: usize) -> i32 {
    if n == 1 || n == 2 {
        return n as i32;
    }
    let (mut a, mut b) = (1, 2);
    for _ in 3..=n {
        let tmp = b;
        b = a + b;
        a = tmp;
    }
    b
}

/* Driver Code */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_dp(n);
    println!("爬 {n} 階樓梯共有 {res} 種方案");

    let res = climbing_stairs_dp_comp(n);
    println!("爬 {n} 階樓梯共有 {res} 種方案");
}
