/*
 * File: climbing_stairs_dfs.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 搜尋 */
fn dfs(i: usize) -> i32 {
    // 已知 dp[1] 和 dp[2] ，返回之
    if i == 1 || i == 2 {
        return i as i32;
    }
    // dp[i] = dp[i-1] + dp[i-2]
    let count = dfs(i - 1) + dfs(i - 2);
    count
}

/* 爬樓梯：搜尋 */
fn climbing_stairs_dfs(n: usize) -> i32 {
    dfs(n)
}

/* Driver Code */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_dfs(n);
    println!("爬 {n} 階樓梯共有 {res} 種方案");
}
