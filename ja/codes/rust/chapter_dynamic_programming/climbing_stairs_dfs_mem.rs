/*
 * File: climbing_stairs_dfs_mem.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* メモ化探索 */
fn dfs(i: usize, mem: &mut [i32]) -> i32 {
    // 既知の値 dp[1] と dp[2] のうち、該当する方を返す
    if i == 1 || i == 2 {
        return i as i32;
    }
    // dp[i] が記録済みなら、その値を返す
    if mem[i] != -1 {
        return mem[i];
    }
    // dp[i] = dp[i-1] + dp[i-2]
    let count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // dp[i] を記録する
    mem[i] = count;
    count
}

/* 階段の登り方：メモ化探索 */
fn climbing_stairs_dfs_mem(n: usize) -> i32 {
    // mem[i] に i 段目までの登り方の総数を記録する。-1 は未記録を表す
    let mut mem = vec![-1; n + 1];
    dfs(n, &mut mem)
}

/* 実行例 */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_dfs_mem(n);
    println!("全 {n} 段の階段の登り方は {res} 通り");
}
