/**
 * File: climbing_stairs_dp.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 계단 오르기: 동적 계획법 */
func climbingStairsDP(n: Int) -> Int {
    if n == 1 || n == 2 {
        return n
    }
    // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
    var dp = Array(repeating: 0, count: n + 1)
    // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
    dp[1] = 1
    dp[2] = 2
    // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
    for i in 3 ... n {
        dp[i] = dp[i - 1] + dp[i - 2]
    }
    return dp[n]
}

/* 계단 오르기: 공간을 최적화한 동적 계획법 */
func climbingStairsDPComp(n: Int) -> Int {
    if n == 1 || n == 2 {
        return n
    }
    var a = 1
    var b = 2
    for _ in 3 ... n {
        (a, b) = (b, a + b)
    }
    return b
}

@main
enum ClimbingStairsDP {
    /* 실행 코드 */
    static func main() {
        let n = 9

        var res = climbingStairsDP(n: n)
        print("\(n)개 계단을 오르는 방법은 총 \(res)가지이다")

        res = climbingStairsDPComp(n: n)
        print("\(n)개 계단을 오르는 방법은 총 \(res)가지이다")
    }
}
