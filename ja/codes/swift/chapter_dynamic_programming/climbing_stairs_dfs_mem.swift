/**
 * File: climbing_stairs_dfs_mem.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* メモ化探索 */
func dfs(i: Int, mem: inout [Int]) -> Int {
    // dp[1] と dp[2] は既知なので返す
    if i == 1 || i == 2 {
        return i
    }
    // dp[i] の記録があれば、それをそのまま返す
    if mem[i] != -1 {
        return mem[i]
    }
    // dp[i] = dp[i-1] + dp[i-2]
    let count = dfs(i: i - 1, mem: &mem) + dfs(i: i - 2, mem: &mem)
    // dp[i] を記録する
    mem[i] = count
    return count
}

/* 階段登り：メモ化探索 */
func climbingStairsDFSMem(n: Int) -> Int {
    // mem[i] は第 i 段まで上る方法の総数を記録し、-1 は未記録を表す
    var mem = Array(repeating: -1, count: n + 1)
    return dfs(i: n, mem: &mem)
}

@main
enum ClimbingStairsDFSMem {
    /* Driver Code */
    static func main() {
        let n = 9

        let res = climbingStairsDFSMem(n: n)
        print("\(n) 段の階段を上る方法は全部で \(res) 通り")
    }
}
