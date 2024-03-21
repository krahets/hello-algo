/**
 * File: climbing_stairs_dp.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 爬楼梯：动态规划 */
func climbingStairsDP(n: Int) -> Int {
    if n == 1 || n == 2 {
        return n
    }
    // 初始化 dp 表，用于存储子问题的解
    var dp = Array(repeating: 0, count: n + 1)
    // 初始状态：预设最小子问题的解
    dp[1] = 1
    dp[2] = 2
    // 状态转移：从较小子问题逐步求解较大子问题
    for i in 3 ... n {
        dp[i] = dp[i - 1] + dp[i - 2]
    }
    return dp[n]
}

/* 爬楼梯：空间优化后的动态规划 */
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
        print("爬 \(n) 阶楼梯共有 \(res) 种方案")

        res = climbingStairsDPComp(n: n)
        print("爬 \(n) 阶楼梯共有 \(res) 种方案")
    }
}
