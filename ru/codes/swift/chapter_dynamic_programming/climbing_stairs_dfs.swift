/**
 * File: climbing_stairs_dfs.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Поиск */
func dfs(i: Int) -> Int {
    // dp[1] и dp[2] уже известны, вернуть их
    if i == 1 || i == 2 {
        return i
    }
    // dp[i] = dp[i-1] + dp[i-2]
    let count = dfs(i: i - 1) + dfs(i: i - 2)
    return count
}

/* Подъем по лестнице: поиск */
func climbingStairsDFS(n: Int) -> Int {
    dfs(i: n)
}

@main
enum ClimbingStairsDFS {
    /* Driver Code */
    static func main() {
        let n = 9

        let res = climbingStairsDFS(n: n)
        print("Количество способов подняться по лестнице из \(n) ступеней = \(res)")
    }
}
