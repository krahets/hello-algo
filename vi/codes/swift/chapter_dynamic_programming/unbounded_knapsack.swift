/**
 * File: unbounded_knapsack.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Unbounded knapsack: Dynamic programming */
func unboundedKnapsackDP(wgt: [Int], val: [Int], cap: Int) -> Int {
    let n = wgt.count
    // Initialize dp table
    var dp = Array(repeating: Array(repeating: 0, count: cap + 1), count: n + 1)
    // State transition
    for i in 1 ... n {
        for c in 1 ... cap {
            if wgt[i - 1] > c {
                // If exceeds knapsack capacity, don't select item i
                dp[i][c] = dp[i - 1][c]
            } else {
                // The larger value between not selecting and selecting item i
                dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1])
            }
        }
    }
    return dp[n][cap]
}

/* Unbounded knapsack: Space-optimized dynamic programming */
func unboundedKnapsackDPComp(wgt: [Int], val: [Int], cap: Int) -> Int {
    let n = wgt.count
    // Initialize dp table
    var dp = Array(repeating: 0, count: cap + 1)
    // State transition
    for i in 1 ... n {
        for c in 1 ... cap {
            if wgt[i - 1] > c {
                // If exceeds knapsack capacity, don't select item i
                dp[c] = dp[c]
            } else {
                // The larger value between not selecting and selecting item i
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

        // Dynamic programming
        var res = unboundedKnapsackDP(wgt: wgt, val: val, cap: cap)
        print("Maximum item value not exceeding knapsack capacity is \(res)")

        // Space-optimized dynamic programming
        res = unboundedKnapsackDPComp(wgt: wgt, val: val, cap: cap)
        print("Maximum item value not exceeding knapsack capacity is \(res)")
    }
}
