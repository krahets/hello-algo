/**
 * File: knapsack.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 0-1 knapsack with brute-force search */
func knapsackDFS(wgt: [Int], val: [Int], i: Int, c: Int) -> Int {
    // Return a value of 0 if all items have been considered or no capacity remains
    if i == 0 || c == 0 {
        return 0
    }
    // If the item exceeds the remaining capacity, we can only skip it
    if wgt[i - 1] > c {
        return knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c)
    }
    // Compute the maximum values for skipping and taking item i
    let no = knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c)
    let yes = knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c - wgt[i - 1]) + val[i - 1]
    // Return the larger of the two values
    return max(no, yes)
}

/* 0-1 knapsack with memoized search */
func knapsackDFSMem(wgt: [Int], val: [Int], mem: inout [[Int]], i: Int, c: Int) -> Int {
    // Return a value of 0 if all items have been considered or no capacity remains
    if i == 0 || c == 0 {
        return 0
    }
    // Return the cached result if available
    if mem[i][c] != -1 {
        return mem[i][c]
    }
    // If the item exceeds the remaining capacity, we can only skip it
    if wgt[i - 1] > c {
        return knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c)
    }
    // Compute the maximum values for skipping and taking item i
    let no = knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c)
    let yes = knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c - wgt[i - 1]) + val[i - 1]
    // Cache and return the larger of the two values
    mem[i][c] = max(no, yes)
    return mem[i][c]
}

/* 0-1 knapsack with dynamic programming */
func knapsackDP(wgt: [Int], val: [Int], cap: Int) -> Int {
    let n = wgt.count
    // Initialize the dp table
    var dp = Array(repeating: Array(repeating: 0, count: cap + 1), count: n + 1)
    // State transition
    for i in 1 ... n {
        for c in 1 ... cap {
            if wgt[i - 1] > c {
                // Skip item i if its weight exceeds the capacity
                dp[i][c] = dp[i - 1][c]
            } else {
                // Take the larger value from skipping or taking item i
                dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1])
            }
        }
    }
    return dp[n][cap]
}

/* 0-1 knapsack with space-optimized dynamic programming */
func knapsackDPComp(wgt: [Int], val: [Int], cap: Int) -> Int {
    let n = wgt.count
    // Initialize the dp table
    var dp = Array(repeating: 0, count: cap + 1)
    // State transition
    for i in 1 ... n {
        // Iterate in descending order
        for c in (1 ... cap).reversed() {
            if wgt[i - 1] <= c {
                // Take the larger value from skipping or taking item i
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
            }
        }
    }
    return dp[cap]
}

@main
enum Knapsack {
    /* Driver code */
    static func main() {
        let wgt = [10, 20, 30, 40, 50]
        let val = [50, 120, 150, 210, 240]
        let cap = 50
        let n = wgt.count

        // Brute-force search
        var res = knapsackDFS(wgt: wgt, val: val, i: n, c: cap)
        print("Maximum total item value within the weight limit: \(res)")

        // Memoized search
        var mem = Array(repeating: Array(repeating: -1, count: cap + 1), count: n + 1)
        res = knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: n, c: cap)
        print("Maximum total item value within the weight limit: \(res)")

        // Dynamic programming
        res = knapsackDP(wgt: wgt, val: val, cap: cap)
        print("Maximum total item value within the weight limit: \(res)")

        // Space-optimized dynamic programming
        res = knapsackDPComp(wgt: wgt, val: val, cap: cap)
        print("Maximum total item value within the weight limit: \(res)")
    }
}
