/**
 * File: unbounded_knapsack.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 무한 배낭: 동적 계획법 */
func unboundedKnapsackDP(wgt: [Int], val: [Int], cap: Int) -> Int {
    let n = wgt.count
    // dp 테이블 초기화
    var dp = Array(repeating: Array(repeating: 0, count: cap + 1), count: n + 1)
    // 상태 전이
    for i in 1 ... n {
        for c in 1 ... cap {
            if wgt[i - 1] > c {
                // 배낭 용량을 넘으면 물건 i를 선택하지 않는다
                dp[i][c] = dp[i - 1][c]
            } else {
                // 물건 i를 선택하지 않을 때와 선택할 때 중 큰 값
                dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1])
            }
        }
    }
    return dp[n][cap]
}

/* 무한 배낭: 공간 최적화 동적 계획법 */
func unboundedKnapsackDPComp(wgt: [Int], val: [Int], cap: Int) -> Int {
    let n = wgt.count
    // dp 테이블 초기화
    var dp = Array(repeating: 0, count: cap + 1)
    // 상태 전이
    for i in 1 ... n {
        for c in 1 ... cap {
            if wgt[i - 1] > c {
                // 배낭 용량을 넘으면 물건 i를 선택하지 않는다
                dp[c] = dp[c]
            } else {
                // 물건 i를 선택하지 않을 때와 선택할 때 중 큰 값
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
            }
        }
    }
    return dp[cap]
}

@main
enum UnboundedKnapsack {
    /* 실행 예제 */
    static func main() {
        let wgt = [1, 2, 3]
        let val = [5, 11, 15]
        let cap = 4

        // 동적 계획법
        var res = unboundedKnapsackDP(wgt: wgt, val: val, cap: cap)
        print("배낭 용량 내에서 얻는 최대 가치: \(res)")

        // 공간 최적화 동적 계획법
        res = unboundedKnapsackDPComp(wgt: wgt, val: val, cap: cap)
        print("배낭 용량 내에서 얻는 최대 가치: \(res)")
    }
}
