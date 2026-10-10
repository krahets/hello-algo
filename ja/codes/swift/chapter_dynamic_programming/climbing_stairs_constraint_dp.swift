/**
 * File: climbing_stairs_constraint_dp.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 制約付き階段登り：動的計画法 */
func climbingStairsConstraintDP(n: Int) -> Int {
    if n == 1 || n == 2 {
        return 1
    }
    // 部分問題の解を保存するために dp テーブルを初期化
    var dp = Array(repeating: Array(repeating: 0, count: 3), count: n + 1)
    // 初期状態：最小部分問題の解をあらかじめ設定
    dp[1][1] = 1
    dp[1][2] = 0
    dp[2][1] = 0
    dp[2][2] = 1
    // 状態遷移：小さい部分問題から大きい部分問題へ順に解く
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
        print("\(n) 段の階段を上る方法は全部で \(res) 通り")
    }
}
