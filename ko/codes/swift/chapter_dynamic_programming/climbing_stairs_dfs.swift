/**
 * File: climbing_stairs_dfs.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 탐색 */
func dfs(i: Int) -> Int {
    // dp[1]과 dp[2]는 이미 알고 있으므로 해당 값을 반환한다
    if i == 1 || i == 2 {
        return i
    }
    // dp[i] = dp[i-1] + dp[i-2]
    let count = dfs(i: i - 1) + dfs(i: i - 2)
    return count
}

/* 계단 오르기: 탐색 */
func climbingStairsDFS(n: Int) -> Int {
    dfs(i: n)
}

@main
enum ClimbingStairsDFS {
    /* 실행 코드 */
    static func main() {
        let n = 9

        let res = climbingStairsDFS(n: n)
        print("\(n)개 계단을 오르는 방법은 총 \(res)가지이다")
    }
}
