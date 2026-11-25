/*
 * File: climbing_stairs_dfs.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Search */
fn dfs(i: usize) -> i32 {
    // Return the known value for dp[1] or dp[2]
    if i == 1 || i == 2 {
        return i as i32;
    }
    // dp[i] = dp[i-1] + dp[i-2]
    let count = dfs(i - 1) + dfs(i - 2);
    count
}

/* Climbing stairs with search */
fn climbing_stairs_dfs(n: usize) -> i32 {
    dfs(n)
}

/* Driver code */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_dfs(n);
    println!("Climbing {n} stairs: {res} ways");
}
