/*
 * File: climbing_stairs_dfs_mem.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Memoization search */
fn dfs(i: usize, mem: &mut [i32]) -> i32 {
    // Known dp[1] and dp[2], return them
    if i == 1 || i == 2 {
        return i as i32;
    }
    // If record dp[i] exists, return it directly
    if mem[i] != -1 {
        return mem[i];
    }
    // dp[i] = dp[i-1] + dp[i-2]
    let count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // Record dp[i]
    mem[i] = count;
    count
}

/* Climbing stairs: Memoization search */
fn climbing_stairs_dfs_mem(n: usize) -> i32 {
    // mem[i] records the total number of solutions to climb to the i-th stair, -1 means no record
    let mut mem = vec![-1; n + 1];
    dfs(n, &mut mem)
}

/* Driver Code */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_dfs_mem(n);
    println!("Climbing {n} stairs has {res} solutions");
}
