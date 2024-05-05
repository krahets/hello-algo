/**
 * File: climbing_stairs_dfs_mem.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Memoized search */
func dfs(i: Int, mem: inout [Int]) -> Int {
    // Known dp[1] and dp[2], return them
    if i == 1 || i == 2 {
        return i
    }
    // If there is a record for dp[i], return it
    if mem[i] != -1 {
        return mem[i]
    }
    // dp[i] = dp[i-1] + dp[i-2]
    let count = dfs(i: i - 1, mem: &mem) + dfs(i: i - 2, mem: &mem)
    // Record dp[i]
    mem[i] = count
    return count
}

/* Climbing stairs: Memoized search */
func climbingStairsDFSMem(n: Int) -> Int {
    // mem[i] records the total number of solutions for climbing to the ith step, -1 means no record
    var mem = Array(repeating: -1, count: n + 1)
    return dfs(i: n, mem: &mem)
}

@main
enum ClimbingStairsDFSMem {
    /* Driver Code */
    static func main() {
        let n = 9

        let res = climbingStairsDFSMem(n: n)
        print("Climbing \(n) stairs, there are \(res) different solutions")
    }
}
