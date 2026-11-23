/**
 * File: coin_change.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 동전 교환: 동적 계획법 */
func coinChangeDP(coins: [Int], amt: Int) -> Int {
    let n = coins.count
    let MAX = amt + 1
    // dp 테이블을 초기화한다
    var dp = Array(repeating: Array(repeating: 0, count: amt + 1), count: n + 1)
    // 상태 전이: 첫 번째 행과 첫 번째 열
    for a in 1 ... amt {
        dp[0][a] = MAX
    }
    // 상태 전이: 나머지 행과 열
    for i in 1 ... n {
        for a in 1 ... amt {
            if coins[i - 1] > a {
                // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                dp[i][a] = dp[i - 1][a]
            } else {
                // 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
                dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
            }
        }
    }
    return dp[n][amt] != MAX ? dp[n][amt] : -1
}

/* 동전 교환: 공간을 최적화한 동적 계획법 */
func coinChangeDPComp(coins: [Int], amt: Int) -> Int {
    let n = coins.count
    let MAX = amt + 1
    // dp 테이블을 초기화한다
    var dp = Array(repeating: MAX, count: amt + 1)
    dp[0] = 0
    // 상태 전이
    for i in 1 ... n {
        for a in 1 ... amt {
            if coins[i - 1] > a {
                // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                dp[a] = dp[a]
            } else {
                // 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
                dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
            }
        }
    }
    return dp[amt] != MAX ? dp[amt] : -1
}

@main
enum CoinChange {
    /* 실행 코드 */
    static func main() {
        let coins = [1, 2, 5]
        let amt = 4

        // 동적 계획법
        var res = coinChangeDP(coins: coins, amt: amt)
        print("목표 금액을 만드는 데 필요한 최소 동전 개수 = \(res)")

        // 공간을 최적화한 동적 계획법
        res = coinChangeDPComp(coins: coins, amt: amt)
        print("목표 금액을 만드는 데 필요한 최소 동전 개수 = \(res)")
    }
}
