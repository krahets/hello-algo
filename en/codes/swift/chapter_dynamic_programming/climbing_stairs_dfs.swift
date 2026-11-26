/**
 * File: climbing_stairs_dfs.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Search */
func dfs(i: Int) -> Int {
    // Return the known value for dp[1] or dp[2]
    if i == 1 || i == 2 {
        return i
    }
    // dp[i] = dp[i-1] + dp[i-2]
    let count = dfs(i: i - 1) + dfs(i: i - 2)
    return count
}

/* Climbing stairs with search */
func climbingStairsDFS(n: Int) -> Int {
    dfs(i: n)
}

@main
enum ClimbingStairsDFS {
    /* Driver code */
    static func main() {
        let n = 9

        let res = climbingStairsDFS(n: n)
        print("Climbing \(n) stairs: \(res) ways")
    }
}
