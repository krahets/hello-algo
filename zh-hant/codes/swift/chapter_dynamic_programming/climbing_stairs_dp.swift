/**
 * File: climbing_stairs_dp.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 爬樓梯：動態規劃 */
func climbingStairsDP(n: Int) -> Int {
    if n == 1 || n == 2 {
        return n
    }
    // 初始化 dp 表，用於儲存子問題的解
    var dp = Array(repeating: 0, count: n + 1)
    // 初始狀態：預設最小子問題的解
    dp[1] = 1
    dp[2] = 2
    // 狀態轉移：從較小子問題逐步求解較大子問題
    for i in 3 ... n {
        dp[i] = dp[i - 1] + dp[i - 2]
    }
    return dp[n]
}

/* 爬樓梯：空間最佳化後的動態規劃 */
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
        print("爬 \(n) 階樓梯共有 \(res) 種方案")

        res = climbingStairsDPComp(n: n)
        print("爬 \(n) 階樓梯共有 \(res) 種方案")
    }
}
