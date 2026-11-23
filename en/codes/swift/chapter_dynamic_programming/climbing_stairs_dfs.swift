/**
 * File: climbing_stairs_dfs.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Search */
func dfs(i: Int) -> Int {
    // The values of dp[1] and dp[2] are known; return them
    if i == 1 || i == 2 {
        return i
    }
    // dp[i] = dp[i-1] + dp[i-2]
    let count = dfs(i: i - 1) + dfs(i: i - 2)
    return count
}

/* Climbing stairs: search */
func climbingStairsDFS(n: Int) -> Int {
    dfs(i: n)
}

@main
enum ClimbingStairsDFS {
    /* Driver code */
    static func main() {
        let n = 9

        let res = climbingStairsDFS(n: n)
        print("Number of ways to climb \(n) steps: \(res)")
    }
}
