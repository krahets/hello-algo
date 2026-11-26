/**
 * File: climbing_stairs_dfs_mem.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 記憶化搜尋 */
func dfs(i: Int, mem: inout [Int]) -> Int {
    // 已知 dp[1] 和 dp[2]，直接回傳對應的值
    if i == 1 || i == 2 {
        return i
    }
    // 若已有 dp[i] 的紀錄，就直接回傳該值
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
    // mem[i] 記錄爬到第 i 階的走法總數，-1 表示尚無紀錄
    var mem = Array(repeating: -1, count: n + 1)
    return dfs(i: n, mem: &mem)
}

@main
enum ClimbingStairsDFSMem {
    /* 主程式 */
    static func main() {
        let n = 9

        let res = climbingStairsDFSMem(n: n)
        print("爬 \(n) 階樓梯共有 \(res) 種走法")
    }
}
