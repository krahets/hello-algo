/*
 * File: climbing_stairs_dfs_mem.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Memoized search */
fn dfs(i: usize, mem: &mut [i32]) -> i32 {
    // The values of dp[1] and dp[2] are known; return them
    if i == 1 || i == 2 {
        return i as i32;
    }
    // If dp[i] has been recorded, return it directly
    if mem[i] != -1 {
        return mem[i];
    }
    // dp[i] = dp[i-1] + dp[i-2]
    let count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // Record dp[i]
    mem[i] = count;
    count
}

/* Climbing stairs: memoized search */
fn climbing_stairs_dfs_mem(n: usize) -> i32 {
    // mem[i] stores the number of ways to reach step i; -1 means no result has been recorded
    let mut mem = vec![-1; n + 1];
    dfs(n, &mut mem)
}

/* Driver code */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_dfs_mem(n);
    println!("Number of ways to climb {n} stairs: {res}");
}
