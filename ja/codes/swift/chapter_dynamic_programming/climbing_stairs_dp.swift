/**
 * File: climbing_stairs_dp.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 階段登り：動的計画法 */
func climbingStairsDP(n: Int) -> Int {
    if n == 1 || n == 2 {
        return n
    }
    // 部分問題の解を保存するために dp テーブルを初期化
    var dp = Array(repeating: 0, count: n + 1)
    // 初期状態：最小部分問題の解をあらかじめ設定
    dp[1] = 1
    dp[2] = 2
    // 状態遷移：小さい部分問題から大きい部分問題へ順に解く
    for i in 3 ... n {
        dp[i] = dp[i - 1] + dp[i - 2]
    }
    return dp[n]
}

/* 階段登り：空間最適化した動的計画法 */
func climbingStairsDPComp(n: Int) -> Int {
    if n == 1 || n == 2 {
        return n
    }
    var a = 1
    var b = 2
    for _ in 3 ... n {
        (a, b) = (b, a + b)
    }
    return b
}

@main
enum ClimbingStairsDP {
    /* Driver Code */
    static func main() {
        let n = 9

        var res = climbingStairsDP(n: n)
        print("\(n) 段の階段を上る方法は全部で \(res) 通り")

        res = climbingStairsDPComp(n: n)
        print("\(n) 段の階段を上る方法は全部で \(res) 通り")
    }
}
