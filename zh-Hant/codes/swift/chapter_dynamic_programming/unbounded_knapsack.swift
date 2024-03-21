/**
 * File: unbounded_knapsack.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 完全背包：動態規劃 */
func unboundedKnapsackDP(wgt: [Int], val: [Int], cap: Int) -> Int {
    let n = wgt.count
    // 初始化 dp 表
    var dp = Array(repeating: Array(repeating: 0, count: cap + 1), count: n + 1)
    // 狀態轉移
    for i in 1 ... n {
        for c in 1 ... cap {
            if wgt[i - 1] > c {
                // 若超過背包容量，則不選物品 i
                dp[i][c] = dp[i - 1][c]
            } else {
                // 不選和選物品 i 這兩種方案的較大值
                dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1])
            }
        }
    }
    return dp[n][cap]
}

/* 完全背包：空間最佳化後的動態規劃 */
func unboundedKnapsackDPComp(wgt: [Int], val: [Int], cap: Int) -> Int {
    let n = wgt.count
    // 初始化 dp 表
    var dp = Array(repeating: 0, count: cap + 1)
    // 狀態轉移
    for i in 1 ... n {
        for c in 1 ... cap {
            if wgt[i - 1] > c {
                // 若超過背包容量，則不選物品 i
                dp[c] = dp[c]
            } else {
                // 不選和選物品 i 這兩種方案的較大值
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

        // 動態規劃
        var res = unboundedKnapsackDP(wgt: wgt, val: val, cap: cap)
        print("不超過背包容量的最大物品價值為 \(res)")

        // 空間最佳化後的動態規劃
        res = unboundedKnapsackDPComp(wgt: wgt, val: val, cap: cap)
        print("不超過背包容量的最大物品價值為 \(res)")
    }
}
