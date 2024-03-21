/**
 * File: climbing_stairs_constraint_dp.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 帶約束爬樓梯：動態規劃 */
func climbingStairsConstraintDP(n: Int) -> Int {
    if n == 1 || n == 2 {
        return 1
    }
    // 初始化 dp 表，用於儲存子問題的解
    var dp = Array(repeating: Array(repeating: 0, count: 3), count: n + 1)
    // 初始狀態：預設最小子問題的解
    dp[1][1] = 1
    dp[1][2] = 0
    dp[2][1] = 0
    dp[2][2] = 1
    // 狀態轉移：從較小子問題逐步求解較大子問題
    for i in 3 ... n {
        dp[i][1] = dp[i - 1][2]
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
    }
    return dp[n][1] + dp[n][2]
}

@main
enum ClimbingStairsConstraintDP {
    /* Driver Code */
    static func main() {
        let n = 9

        let res = climbingStairsConstraintDP(n: n)
        print("爬 \(n) 階樓梯共有 \(res) 種方案")
    }
}
