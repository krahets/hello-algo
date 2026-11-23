/**
 * File: knapsack.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 0-1 knapsack: brute-force search */
func knapsackDFS(wgt: [Int], val: [Int], i: Int, c: Int) -> Int {
    // If all items have been considered or no capacity remains, return value 0
    if i == 0 || c == 0 {
        return 0
    }
    // If the item exceeds the remaining capacity, it must be excluded
    if wgt[i - 1] > c {
        return knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c)
    }
    // Calculate the maximum values obtained by excluding and including item i
    let no = knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c)
    let yes = knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c - wgt[i - 1]) + val[i - 1]
    // Return the larger value from the two choices
    return max(no, yes)
}

/* 0-1 knapsack: memoized search */
func knapsackDFSMem(wgt: [Int], val: [Int], mem: inout [[Int]], i: Int, c: Int) -> Int {
    // If all items have been considered or no capacity remains, return value 0
    if i == 0 || c == 0 {
        return 0
    }
    // If a result has already been recorded, return it directly
    if mem[i][c] != -1 {
        return mem[i][c]
    }
    // If the item exceeds the remaining capacity, it must be excluded
    if wgt[i - 1] > c {
        return knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c)
    }
    // Calculate the maximum values obtained by excluding and including item i
    let no = knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c)
    let yes = knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c - wgt[i - 1]) + val[i - 1]
    // Record and return the larger value from the two choices
    mem[i][c] = max(no, yes)
    return mem[i][c]
}

/* 0-1 knapsack: dynamic programming */
func knapsackDP(wgt: [Int], val: [Int], cap: Int) -> Int {
    let n = wgt.count
    // Initialize the dp table
    var dp = Array(repeating: Array(repeating: 0, count: cap + 1), count: n + 1)
    // State transitions
    for i in 1 ... n {
        for c in 1 ... cap {
            if wgt[i - 1] > c {
                // If item i exceeds the remaining capacity, do not choose it
                dp[i][c] = dp[i - 1][c]
            } else {
                // Take the larger value obtained by excluding and including item i
                dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1])
            }
        }
    }
    return dp[n][cap]
}

/* 0-1 knapsack: space-optimized dynamic programming */
func knapsackDPComp(wgt: [Int], val: [Int], cap: Int) -> Int {
    let n = wgt.count
    // Initialize the dp table
    var dp = Array(repeating: 0, count: cap + 1)
    // State transitions
    for i in 1 ... n {
        // Traverse in decreasing order
        for c in (1 ... cap).reversed() {
            if wgt[i - 1] <= c {
                // Take the larger value obtained by excluding and including item i
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
        print("Maximum total item value within the knapsack capacity: \(res)")

        // Memoized search
        var mem = Array(repeating: Array(repeating: -1, count: cap + 1), count: n + 1)
        res = knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: n, c: cap)
        print("Maximum total item value within the knapsack capacity: \(res)")

        // Dynamic programming
        res = knapsackDP(wgt: wgt, val: val, cap: cap)
        print("Maximum total item value within the knapsack capacity: \(res)")

        // Space-optimized dynamic programming
        res = knapsackDPComp(wgt: wgt, val: val, cap: cap)
        print("Maximum total item value within the knapsack capacity: \(res)")
    }
}
