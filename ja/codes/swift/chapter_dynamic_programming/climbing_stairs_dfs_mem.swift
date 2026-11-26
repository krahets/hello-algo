/**
 * File: climbing_stairs_dfs_mem.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* メモ化探索 */
func dfs(i: Int, mem: inout [Int]) -> Int {
    // 既知の値 dp[1] と dp[2] のうち、該当する方を返す
    if i == 1 || i == 2 {
        return i
    }
    // dp[i] が記録済みなら、その値を返す
    if mem[i] != -1 {
        return mem[i]
    }
    // dp[i] = dp[i-1] + dp[i-2]
    let count = dfs(i: i - 1, mem: &mem) + dfs(i: i - 2, mem: &mem)
    // dp[i] を記録する
    mem[i] = count
    return count
}

/* 階段の登り方：メモ化探索 */
func climbingStairsDFSMem(n: Int) -> Int {
    // mem[i] に i 段目までの登り方の総数を記録する。-1 は未記録を表す
    var mem = Array(repeating: -1, count: n + 1)
    return dfs(i: n, mem: &mem)
}

@main
enum ClimbingStairsDFSMem {
    /* 実行例 */
    static func main() {
        let n = 9

        let res = climbingStairsDFSMem(n: n)
        print("全 \(n) 段の階段の登り方は \(res) 通り")
    }
}
