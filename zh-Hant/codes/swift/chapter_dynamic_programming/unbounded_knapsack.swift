/**
 * File: unbounded_knapsack.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 完全背包：动态规划 */
func unboundedKnapsackDP(wgt: [Int], val: [Int], cap: Int) -> Int {
    let n = wgt.count
    // 初始化 dp 表
    var dp = Array(repeating: Array(repeating: 0, count: cap + 1), count: n + 1)
    // 状态转移
    for i in 1 ... n {
        for c in 1 ... cap {
            if wgt[i - 1] > c {
                // 若超过背包容量，则不选物品 i
                dp[i][c] = dp[i - 1][c]
            } else {
                // 不选和选物品 i 这两种方案的较大值
                dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1])
            }
        }
    }
    return dp[n][cap]
}

/* 完全背包：空间优化后的动态规划 */
func unboundedKnapsackDPComp(wgt: [Int], val: [Int], cap: Int) -> Int {
    let n = wgt.count
    // 初始化 dp 表
    var dp = Array(repeating: 0, count: cap + 1)
    // 状态转移
    for i in 1 ... n {
        for c in 1 ... cap {
            if wgt[i - 1] > c {
                // 若超过背包容量，则不选物品 i
                dp[c] = dp[c]
            } else {
                // 不选和选物品 i 这两种方案的较大值
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
            }
        }
    }
    return dp[cap]
}

@main
enum UnboundedKnapsack {
    /* Driver Code */
    static func main() {
        let wgt = [1, 2, 3]
        let val = [5, 11, 15]
        let cap = 4

        // 动态规划
        var res = unboundedKnapsackDP(wgt: wgt, val: val, cap: cap)
        print("不超过背包容量的最大物品价值为 \(res)")

        // 空间优化后的动态规划
        res = unboundedKnapsackDPComp(wgt: wgt, val: val, cap: cap)
        print("不超过背包容量的最大物品价值为 \(res)")
    }
}
