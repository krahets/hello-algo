/*
 * File: climbing_stairs_dfs_mem.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* メモ化探索 */
fn dfs(i: usize, mem: &mut [i32]) -> i32 {
    // dp[1] と dp[2] は既知なので返す
    if i == 1 || i == 2 {
        return i as i32;
    }
    // dp[i] の記録があれば、それをそのまま返す
    if mem[i] != -1 {
        return mem[i];
    }
    // dp[i] = dp[i-1] + dp[i-2]
    let count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // dp[i] を記録する
    mem[i] = count;
    count
}

/* 階段登り：メモ化探索 */
fn climbing_stairs_dfs_mem(n: usize) -> i32 {
    // mem[i] は第 i 段まで上る方法の総数を記録し、-1 は未記録を表す
    let mut mem = vec![-1; n + 1];
    dfs(n, &mut mem)
}

/* Driver Code */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_dfs_mem(n);
    println!("{n} 段の階段を上る方法は全部で {res} 通り");
}
