/**
 * File: knapsack.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 0-1 背包：暴力搜索 */
func knapsackDFS(wgt: [Int], val: [Int], i: Int, c: Int) -> Int {
    // 若已选完所有物品或背包无剩余容量，则返回价值 0
    if i == 0 || c == 0 {
        return 0
    }
    // 若超过背包容量，则只能选择不放入背包
    if wgt[i - 1] > c {
        return knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c)
    }
    // 计算不放入和放入物品 i 的最大价值
    let no = knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c)
    let yes = knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c - wgt[i - 1]) + val[i - 1]
    // 返回两种方案中价值更大的那一个
    return max(no, yes)
}

/* 0-1 背包：记忆化搜索 */
func knapsackDFSMem(wgt: [Int], val: [Int], mem: inout [[Int]], i: Int, c: Int) -> Int {
    // 若已选完所有物品或背包无剩余容量，则返回价值 0
    if i == 0 || c == 0 {
        return 0
    }
    // 若已有记录，则直接返回
    if mem[i][c] != -1 {
        return mem[i][c]
    }
    // 若超过背包容量，则只能选择不放入背包
    if wgt[i - 1] > c {
        return knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c)
    }
    // 计算不放入和放入物品 i 的最大价值
    let no = knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c)
    let yes = knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c - wgt[i - 1]) + val[i - 1]
    // 记录并返回两种方案中价值更大的那一个
    mem[i][c] = max(no, yes)
    return mem[i][c]
}

/* 0-1 背包：动态规划 */
func knapsackDP(wgt: [Int], val: [Int], cap: Int) -> Int {
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
                dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1])
            }
        }
    }
    return dp[n][cap]
}

/* 0-1 背包：空间优化后的动态规划 */
func knapsackDPComp(wgt: [Int], val: [Int], cap: Int) -> Int {
    let n = wgt.count
    // 初始化 dp 表
    var dp = Array(repeating: 0, count: cap + 1)
    // 状态转移
    for i in 1 ... n {
        // 倒序遍历
        for c in (1 ... cap).reversed() {
            if wgt[i - 1] <= c {
                // 不选和选物品 i 这两种方案的较大值
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

        // 暴力搜索
        var res = knapsackDFS(wgt: wgt, val: val, i: n, c: cap)
        print("不超过背包容量的最大物品价值为 \(res)")

        // 记忆化搜索
        var mem = Array(repeating: Array(repeating: -1, count: cap + 1), count: n + 1)
        res = knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: n, c: cap)
        print("不超过背包容量的最大物品价值为 \(res)")

        // 动态规划
        res = knapsackDP(wgt: wgt, val: val, cap: cap)
        print("不超过背包容量的最大物品价值为 \(res)")

        // 空间优化后的动态规划
        res = knapsackDPComp(wgt: wgt, val: val, cap: cap)
        print("不超过背包容量的最大物品价值为 \(res)")
    }
}
