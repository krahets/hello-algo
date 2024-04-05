/*
 * File: climbing_stairs_dfs_mem.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 記憶化搜尋 */
fn dfs(i: usize, mem: &mut [i32]) -> i32 {
    // 已知 dp[1] 和 dp[2] ，返回之
    if i == 1 || i == 2 {
        return i as i32;
    }
    // 若存在記錄 dp[i] ，則直接返回之
    if mem[i] != -1 {
        return mem[i];
    }
    // dp[i] = dp[i-1] + dp[i-2]
    let count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // 記錄 dp[i]
    mem[i] = count;
    count
}

/* 爬樓梯：記憶化搜尋 */
fn climbing_stairs_dfs_mem(n: usize) -> i32 {
    // mem[i] 記錄爬到第 i 階的方案總數，-1 代表無記錄
    let mut mem = vec![-1; n + 1];
    dfs(n, &mut mem)
}

/* Driver Code */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_dfs_mem(n);
    println!("爬 {n} 階樓梯共有 {res} 種方案");
}
