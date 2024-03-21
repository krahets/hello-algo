/**
 * File: climbing_stairs_dfs_mem.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 记忆化搜索 */
func dfs(i: Int, mem: inout [Int]) -> Int {
    // 已知 dp[1] 和 dp[2] ，返回之
    if i == 1 || i == 2 {
        return i
    }
    // 若存在记录 dp[i] ，则直接返回之
    if mem[i] != -1 {
        return mem[i]
    }
    // dp[i] = dp[i-1] + dp[i-2]
    let count = dfs(i: i - 1, mem: &mem) + dfs(i: i - 2, mem: &mem)
    // 记录 dp[i]
    mem[i] = count
    return count
}

/* 爬楼梯：记忆化搜索 */
func climbingStairsDFSMem(n: Int) -> Int {
    // mem[i] 记录爬到第 i 阶的方案总数，-1 代表无记录
    var mem = Array(repeating: -1, count: n + 1)
    return dfs(i: n, mem: &mem)
}

@main
enum ClimbingStairsDFSMem {
    /* Driver Code */
    static func main() {
        let n = 9

        let res = climbingStairsDFSMem(n: n)
        print("爬 \(n) 阶楼梯共有 \(res) 种方案")
    }
}
