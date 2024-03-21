/**
 * File: climbing_stairs_dfs.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 搜尋 */
func dfs(i: Int) -> Int {
    // 已知 dp[1] 和 dp[2] ，返回之
    if i == 1 || i == 2 {
        return i
    }
    // dp[i] = dp[i-1] + dp[i-2]
    let count = dfs(i: i - 1) + dfs(i: i - 2)
    return count
}

/* 爬樓梯：搜尋 */
func climbingStairsDFS(n: Int) -> Int {
    dfs(i: n)
}

@main
enum ClimbingStairsDFS {
    /* Driver Code */
    static func main() {
        let n = 9

        let res = climbingStairsDFS(n: n)
        print("爬 \(n) 階樓梯共有 \(res) 種方案")
    }
}
