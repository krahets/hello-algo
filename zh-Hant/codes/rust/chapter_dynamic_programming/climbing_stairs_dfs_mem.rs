/*
 * File: climbing_stairs_dfs_mem.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 记忆化搜索 */
fn dfs(i: usize, mem: &mut [i32]) -> i32 {
    // 已知 dp[1] 和 dp[2] ，返回之
    if i == 1 || i == 2 {
        return i as i32;
    }
    // 若存在记录 dp[i] ，则直接返回之
    if mem[i] != -1 {
        return mem[i];
    }
    // dp[i] = dp[i-1] + dp[i-2]
    let count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // 记录 dp[i]
    mem[i] = count;
    count
}

/* 爬楼梯：记忆化搜索 */
fn climbing_stairs_dfs_mem(n: usize) -> i32 {
    // mem[i] 记录爬到第 i 阶的方案总数，-1 代表无记录
    let mut mem = vec![-1; n + 1];
    dfs(n, &mut mem)
}

/* Driver Code */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_dfs_mem(n);
    println!("爬 {n} 阶楼梯共有 {res} 种方案");
}
