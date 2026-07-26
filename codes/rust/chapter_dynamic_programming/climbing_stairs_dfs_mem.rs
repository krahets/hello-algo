/*
 * File: climbing_stairs_dfs_mem.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 记忆化搜索 */
fn dfs(i: u32, mem: &mut [Option<u32>]) -> u32 {
    // 已知 dp[1] 和 dp[2]，返回之
    // 实际上，这一处理会导致 mem 的前三个元素永远是 None，可以考虑
    // 将 mem 的大小设为 n - 2 并通过偏移索引来访问以节省空间；然而，
    // 索引偏移本身存在时间开销，一般我们认为应该用空间换时间，所以这
    // 种优化并不值得。此外，Option<u32> 因为对齐原因占据 8 个字节，
    // 可以考虑用 u32::MAX 来代表无记录，但这会带来可读性的下降。
    if i == 1 || i == 2 {
        return i;
    }

    // 若存在记录 dp[i]，则直接返回之
    if let Some(count) = mem[i as usize] {
        return count;
    }

    // dp[i] = dp[i - 1] + dp[i - 2]
    let count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // 记录 dp[i]
    mem[i as usize] = Some(count);
    count
}

/* 爬楼梯：记忆化搜索 */
pub fn climbing_stairs_dfs_mem(n: u32) -> u32 {
    // mem[i] 记录爬到第 i 阶的方案总数，None 代表无记录
    let mut mem = vec![None; n as usize + 1];
    dfs(n, &mut mem)
}

/* Driver Code */
fn main() {
    let n = 9;

    let res = climbing_stairs_dfs_mem(n);
    println!("爬 {n} 阶楼梯共有 {res} 种方案");
}
