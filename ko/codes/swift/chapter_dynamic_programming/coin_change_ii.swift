/**
 * File: coin_change_ii.swift
 * Created Time: 2023-07-16
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 동전 교환 II: 동적 계획법 */
func coinChangeIIDP(coins: [Int], amt: Int) -> Int {
    let n = coins.count
    // dp 테이블을 초기화한다
    var dp = Array(repeating: Array(repeating: 0, count: amt + 1), count: n + 1)
    // 첫 번째 열을 초기화한다
    for i in 0 ... n {
        dp[i][0] = 1
    }
    // 상태 전이
    for i in 1 ... n {
        for a in 1 ... amt {
            if coins[i - 1] > a {
                // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                dp[i][a] = dp[i - 1][a]
            } else {
                // 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
            }
        }
    }
    return dp[n][amt]
}

/* 동전 교환 II: 공간을 최적화한 동적 계획법 */
func coinChangeIIDPComp(coins: [Int], amt: Int) -> Int {
    let n = coins.count
    // dp 테이블을 초기화한다
    var dp = Array(repeating: 0, count: amt + 1)
    dp[0] = 1
    // 상태 전이
    for i in 1 ... n {
        for a in 1 ... amt {
            if coins[i - 1] > a {
                // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                dp[a] = dp[a]
            } else {
                // 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
                dp[a] = dp[a] + dp[a - coins[i - 1]]
            }
        }
    }
    return dp[amt]
}

@main
enum CoinChangeII {
    /* 실행 코드 */
    static func main() {
        let coins = [1, 2, 5]
        let amt = 5

        // 동적 계획법
        var res = coinChangeIIDP(coins: coins, amt: amt)
        print("목표 금액을 만드는 동전 조합의 수 = \(res)")

        // 공간을 최적화한 동적 계획법
        res = coinChangeIIDPComp(coins: coins, amt: amt)
        print("목표 금액을 만드는 동전 조합의 수 = \(res)")
    }
}
