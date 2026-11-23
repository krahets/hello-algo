/**
 * File: climbing_stairs_dfs_mem.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Memoized search */
func dfs(i: Int, mem: inout [Int]) -> Int {
    // The values of dp[1] and dp[2] are known; return them
    if i == 1 || i == 2 {
        return i
    }
    // If dp[i] has been recorded, return it directly
    if mem[i] != -1 {
        return mem[i]
    }
    // dp[i] = dp[i-1] + dp[i-2]
    let count = dfs(i: i - 1, mem: &mem) + dfs(i: i - 2, mem: &mem)
    // Record dp[i]
    mem[i] = count
    return count
}

/* Climbing stairs: memoized search */
func climbingStairsDFSMem(n: Int) -> Int {
    // mem[i] stores the number of ways to reach step i; -1 means no result has been recorded
    var mem = Array(repeating: -1, count: n + 1)
    return dfs(i: n, mem: &mem)
}

@main
enum ClimbingStairsDFSMem {
    /* Driver code */
    static func main() {
        let n = 9

        let res = climbingStairsDFSMem(n: n)
        print("Number of ways to climb \(n) steps: \(res)")
    }
}
