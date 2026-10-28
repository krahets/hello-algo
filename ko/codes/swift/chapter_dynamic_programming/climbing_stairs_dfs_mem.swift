/**
 * File: climbing_stairs_dfs_mem.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 메모이제이션을 이용한 탐색 */
func dfs(i: Int, mem: inout [Int]) -> Int {
    // dp[1]과 dp[2]는 이미 알고 있으므로 해당 값을 반환한다
    if i == 1 || i == 2 {
        return i
    }
    // dp[i]의 기록이 있으면 해당 값을 바로 반환한다
    if mem[i] != -1 {
        return mem[i]
    }
    // dp[i] = dp[i-1] + dp[i-2]
    let count = dfs(i: i - 1, mem: &mem) + dfs(i: i - 2, mem: &mem)
    // dp[i]를 기록한다
    mem[i] = count
    return count
}

/* 계단 오르기: 메모이제이션을 이용한 탐색 */
func climbingStairsDFSMem(n: Int) -> Int {
    // mem[i]는 i번째 계단까지 오르는 전체 방법의 수를 기록하며, -1은 기록이 없음을 나타낸다
    var mem = Array(repeating: -1, count: n + 1)
    return dfs(i: n, mem: &mem)
}

@main
enum ClimbingStairsDFSMem {
    /* 실행 코드 */
    static func main() {
        let n = 9

        let res = climbingStairsDFSMem(n: n)
        print("\(n)개 계단을 오르는 방법은 총 \(res)가지이다")
    }
}
