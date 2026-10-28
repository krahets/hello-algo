/**
 * File: climbing_stairs_constraint_dp.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 제약 조건이 있는 계단 오르기: 동적 계획법 */
func climbingStairsConstraintDP(n: Int) -> Int {
    if n == 1 || n == 2 {
        return 1
    }
    // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
    var dp = Array(repeating: Array(repeating: 0, count: 3), count: n + 1)
    // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
    dp[1][1] = 1
    dp[1][2] = 0
    dp[2][1] = 0
    dp[2][2] = 1
    // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
    for i in 3 ... n {
        dp[i][1] = dp[i - 1][2]
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
    }
    return dp[n][1] + dp[n][2]
}

@main
enum ClimbingStairsConstraintDP {
    /* 실행 코드 */
    static func main() {
        let n = 9

        let res = climbingStairsConstraintDP(n: n)
        print("\(n)개 계단을 오르는 방법은 총 \(res)가지이다")
    }
}
