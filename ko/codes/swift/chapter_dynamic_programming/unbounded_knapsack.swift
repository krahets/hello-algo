/**
 * File: unbounded_knapsack.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 무한 배낭: 동적 계획법 */
func unboundedKnapsackDP(wgt: [Int], val: [Int], cap: Int) -> Int {
    let n = wgt.count
    // dp 테이블을 초기화한다
    var dp = Array(repeating: Array(repeating: 0, count: cap + 1), count: n + 1)
    // 상태 전이
    for i in 1 ... n {
        for c in 1 ... cap {
            if wgt[i - 1] > c {
                // 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                dp[i][c] = dp[i - 1][c]
            } else {
                // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1])
            }
        }
    }
    return dp[n][cap]
}

/* 무한 배낭: 공간을 최적화한 동적 계획법 */
func unboundedKnapsackDPComp(wgt: [Int], val: [Int], cap: Int) -> Int {
    let n = wgt.count
    // dp 테이블을 초기화한다
    var dp = Array(repeating: 0, count: cap + 1)
    // 상태 전이
    for i in 1 ... n {
        for c in 1 ... cap {
            if wgt[i - 1] > c {
                // 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                dp[c] = dp[c]
            } else {
                // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
            }
        }
    }
    return dp[cap]
}

@main
enum UnboundedKnapsack {
    /* 실행 코드 */
    static func main() {
        let wgt = [1, 2, 3]
        let val = [5, 11, 15]
        let cap = 4

        // 동적 계획법
        var res = unboundedKnapsackDP(wgt: wgt, val: val, cap: cap)
        print("배낭 용량을 넘지 않게 담을 수 있는 물건의 최대 가치 = \(res)")

        // 공간을 최적화한 동적 계획법
        res = unboundedKnapsackDPComp(wgt: wgt, val: val, cap: cap)
        print("배낭 용량을 넘지 않게 담을 수 있는 물건의 최대 가치 = \(res)")
    }
}
