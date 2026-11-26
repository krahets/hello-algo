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
    // 부분 문제의 해를 저장할 dp 테이블 초기화
    var dp = Array(repeating: 0, count: n + 1)
    // 초기 상태: 가장 작은 부분 문제의 해를 설정한다
    dp[1] = 1
    dp[2] = 2
    // 상태 전이: 작은 부분 문제부터 큰 부분 문제까지 차례로 푼다
    for i in 3 ... n {
        dp[i] = dp[i - 1] + dp[i - 2]
    }
    return dp[n]
}

/* 계단 오르기: 공간 최적화 동적 계획법 */
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
    /* 실행 예제 */
    static func main() {
        let n = 9

        var res = climbingStairsDP(n: n)
        print("계단 \(n)개를 오르는 방법은 \(res)가지")

        res = climbingStairsDPComp(n: n)
        print("계단 \(n)개를 오르는 방법은 \(res)가지")
    }
}
