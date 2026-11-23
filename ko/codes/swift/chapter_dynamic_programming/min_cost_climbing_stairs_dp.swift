/**
 * File: min_cost_climbing_stairs_dp.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 계단 오르기의 최소 비용: 동적 계획법 */
func minCostClimbingStairsDP(cost: [Int]) -> Int {
    let n = cost.count - 1
    if n == 1 || n == 2 {
        return cost[n]
    }
    // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
    var dp = Array(repeating: 0, count: n + 1)
    // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
    dp[1] = cost[1]
    dp[2] = cost[2]
    // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
    for i in 3 ... n {
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
    }
    return dp[n]
}

/* 계단 오르기의 최소 비용: 공간을 최적화한 동적 계획법 */
func minCostClimbingStairsDPComp(cost: [Int]) -> Int {
    let n = cost.count - 1
    if n == 1 || n == 2 {
        return cost[n]
    }
    var (a, b) = (cost[1], cost[2])
    for i in 3 ... n {
        (a, b) = (b, min(a, b) + cost[i])
    }
    return b
}

@main
enum MinCostClimbingStairsDP {
    /* 실행 코드 */
    static func main() {
        let cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1]
        print("입력한 계단별 비용 리스트 = \(cost)")

        var res = minCostClimbingStairsDP(cost: cost)
        print("계단을 모두 오르는 최소 비용 = \(res)")

        res = minCostClimbingStairsDPComp(cost: cost)
        print("계단을 모두 오르는 최소 비용 = \(res)")
    }
}
