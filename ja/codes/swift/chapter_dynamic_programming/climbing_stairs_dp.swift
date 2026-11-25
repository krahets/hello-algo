/**
 * File: climbing_stairs_dp.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 階段の登り方：動的計画法 */
func climbingStairsDP(n: Int) -> Int {
    if n == 1 || n == 2 {
        return n
    }
    // 部分問題の解を格納する dp テーブルを初期化する
    var dp = Array(repeating: 0, count: n + 1)
    // 初期状態：最小の部分問題の解を設定する
    dp[1] = 1
    dp[2] = 2
    // 状態遷移：小さな部分問題から順に大きな部分問題を解く
    for i in 3 ... n {
        dp[i] = dp[i - 1] + dp[i - 2]
    }
    return dp[n]
}

/* 階段の登り方：使用メモリを削減した動的計画法 */
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
    /* 実行例 */
    static func main() {
        let n = 9

        var res = climbingStairsDP(n: n)
        print("全 \(n) 段の階段の登り方は \(res) 通り")

        res = climbingStairsDPComp(n: n)
        print("全 \(n) 段の階段の登り方は \(res) 通り")
    }
}
