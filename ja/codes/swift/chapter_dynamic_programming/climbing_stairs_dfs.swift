/**
 * File: climbing_stairs_dfs.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 検索 */
func dfs(i: Int) -> Int {
    // dp[1] と dp[2] は既知なので返す
    if i == 1 || i == 2 {
        return i
    }
    // dp[i] = dp[i-1] + dp[i-2]
    let count = dfs(i: i - 1) + dfs(i: i - 2)
    return count
}

/* 階段登り：探索 */
func climbingStairsDFS(n: Int) -> Int {
    dfs(i: n)
}

@main
enum ClimbingStairsDFS {
    /* Driver Code */
    static func main() {
        let n = 9

        let res = climbingStairsDFS(n: n)
        print("\(n) 段の階段を上る方法は全部で \(res) 通り")
    }
}
