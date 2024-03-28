/**
 * File: climbing_stairs_dfs_mem.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 記憶化搜尋 */
func dfs(i: Int, mem: inout [Int]) -> Int {
    // 已知 dp[1] 和 dp[2] ，返回之
    if i == 1 || i == 2 {
        return i
    }
    // 若存在記錄 dp[i] ，則直接返回之
    if mem[i] != -1 {
        return mem[i]
    }
    // dp[i] = dp[i-1] + dp[i-2]
    let count = dfs(i: i - 1, mem: &mem) + dfs(i: i - 2, mem: &mem)
    // 記錄 dp[i]
    mem[i] = count
    return count
}

/* 爬樓梯：記憶化搜尋 */
func climbingStairsDFSMem(n: Int) -> Int {
    // mem[i] 記錄爬到第 i 階的方案總數，-1 代表無記錄
    var mem = Array(repeating: -1, count: n + 1)
    return dfs(i: n, mem: &mem)
}

@main
enum ClimbingStairsDFSMem {
    /* Driver Code */
    static func main() {
        let n = 9

        let res = climbingStairsDFSMem(n: n)
        print("爬 \(n) 階樓梯共有 \(res) 種方案")
    }
}
