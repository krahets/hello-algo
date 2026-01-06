/**
 * File: knapsack.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 0-1 knapsack: Brute-force search */
func knapsackDFS(wgt: [Int], val: [Int], i: Int, c: Int) -> Int {
    // If all items have been selected or knapsack has no remaining capacity, return value 0
    if i == 0 || c == 0 {
        return 0
    }
    // If exceeds knapsack capacity, can only choose not to put it in
    if wgt[i - 1] > c {
        return knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c)
    }
    // Calculate the maximum value of not putting in and putting in item i
    let no = knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c)
    let yes = knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c - wgt[i - 1]) + val[i - 1]
    // Return the larger value of the two options
    return max(no, yes)
}

/* 0-1 knapsack: Memoization search */
func knapsackDFSMem(wgt: [Int], val: [Int], mem: inout [[Int]], i: Int, c: Int) -> Int {
    // If all items have been selected or knapsack has no remaining capacity, return value 0
    if i == 0 || c == 0 {
        return 0
    }
    // If there's a record, return it directly
    if mem[i][c] != -1 {
        return mem[i][c]
    }
    // If exceeds knapsack capacity, can only choose not to put it in
    if wgt[i - 1] > c {
        return knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c)
    }
    // Calculate the maximum value of not putting in and putting in item i
    let no = knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c)
    let yes = knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c - wgt[i - 1]) + val[i - 1]
    // Record and return the larger value of the two options
    mem[i][c] = max(no, yes)
    return mem[i][c]
}

/* 0-1 knapsack: Dynamic programming */
func knapsackDP(wgt: [Int], val: [Int], cap: Int) -> Int {
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
                dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1])
            }
        }
    }
    return dp[n][cap]
}

/* 0-1 knapsack: Space-optimized dynamic programming */
func knapsackDPComp(wgt: [Int], val: [Int], cap: Int) -> Int {
    let n = wgt.count
    // Initialize dp table
    var dp = Array(repeating: 0, count: cap + 1)
    // State transition
    for i in 1 ... n {
        // Traverse in reverse order
        for c in (1 ... cap).reversed() {
            if wgt[i - 1] <= c {
                // The larger value between not selecting and selecting item i
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
            }
        }
    }
    return dp[cap]
}

@main
enum Knapsack {
    /* Driver Code */
    static func main() {
        let wgt = [10, 20, 30, 40, 50]
        let val = [50, 120, 150, 210, 240]
        let cap = 50
        let n = wgt.count

        // Brute-force search
        var res = knapsackDFS(wgt: wgt, val: val, i: n, c: cap)
        print("Maximum item value not exceeding knapsack capacity is \(res)")

        // Memoization search
        var mem = Array(repeating: Array(repeating: -1, count: cap + 1), count: n + 1)
        res = knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: n, c: cap)
        print("Maximum item value not exceeding knapsack capacity is \(res)")

        // Dynamic programming
        res = knapsackDP(wgt: wgt, val: val, cap: cap)
        print("Maximum item value not exceeding knapsack capacity is \(res)")

        // Space-optimized dynamic programming
        res = knapsackDPComp(wgt: wgt, val: val, cap: cap)
        print("Maximum item value not exceeding knapsack capacity is \(res)")
    }
}
