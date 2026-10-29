/*
 * File: climbing_stairs_dfs.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 探索 */
fn dfs(i: usize) -> i32 {
    // dp[1] と dp[2] は既知なので、その値を返す
    if i == 1 || i == 2 {
        return i as i32;
    }
    // dp[i] = dp[i-1] + dp[i-2]
    let count = dfs(i - 1) + dfs(i - 2);
    count
}

/* 階段の上り方：探索 */
fn climbing_stairs_dfs(n: usize) -> i32 {
    dfs(n)
}

/* 実行用コード */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_dfs(n);
    println!("{n} 段の階段を上る方法は全部で {res} 通り");
}
