/**
 * File: knapsack.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 0-1 배낭: 완전 탐색 */
func knapsackDFS(wgt: [Int], val: [Int], i: Int, c: Int) -> Int {
    // 모든 물건을 검토했거나 남은 용량이 없으면 가치 0을 반환한다
    if i == 0 || c == 0 {
        return 0
    }
    // 배낭 용량을 넘으면 물건을 넣지 않는 선택만 가능하다
    if wgt[i - 1] > c {
        return knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c)
    }
    // 물건 i를 넣지 않을 때와 넣을 때 각각의 최대 가치를 구한다
    let no = knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c)
    let yes = knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c - wgt[i - 1]) + val[i - 1]
    // 두 경우 중 큰 가치를 반환한다
    return max(no, yes)
}

/* 0-1 배낭: 메모이제이션 탐색 */
func knapsackDFSMem(wgt: [Int], val: [Int], mem: inout [[Int]], i: Int, c: Int) -> Int {
    // 모든 물건을 검토했거나 남은 용량이 없으면 가치 0을 반환한다
    if i == 0 || c == 0 {
        return 0
    }
    // 기록이 있으면 바로 반환한다
    if mem[i][c] != -1 {
        return mem[i][c]
    }
    // 배낭 용량을 넘으면 물건을 넣지 않는 선택만 가능하다
    if wgt[i - 1] > c {
        return knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c)
    }
    // 물건 i를 넣지 않을 때와 넣을 때 각각의 최대 가치를 구한다
    let no = knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c)
    let yes = knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c - wgt[i - 1]) + val[i - 1]
    // 두 경우 중 큰 가치를 기록하고 반환한다
    mem[i][c] = max(no, yes)
    return mem[i][c]
}

/* 0-1 배낭: 동적 계획법 */
func knapsackDP(wgt: [Int], val: [Int], cap: Int) -> Int {
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
                dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1])
            }
        }
    }
    return dp[n][cap]
}

/* 0-1 배낭: 공간 최적화 동적 계획법 */
func knapsackDPComp(wgt: [Int], val: [Int], cap: Int) -> Int {
    let n = wgt.count
    // dp 테이블 초기화
    var dp = Array(repeating: 0, count: cap + 1)
    // 상태 전이
    for i in 1 ... n {
        // 역순으로 순회
        for c in (1 ... cap).reversed() {
            if wgt[i - 1] <= c {
                // 물건 i를 선택하지 않을 때와 선택할 때 중 큰 값
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
            }
        }
    }
    return dp[cap]
}

@main
enum Knapsack {
    /* 실행 예제 */
    static func main() {
        let wgt = [10, 20, 30, 40, 50]
        let val = [50, 120, 150, 210, 240]
        let cap = 50
        let n = wgt.count

        // 완전 탐색
        var res = knapsackDFS(wgt: wgt, val: val, i: n, c: cap)
        print("배낭 용량 내에서 얻는 최대 가치: \(res)")

        // 메모이제이션 탐색
        var mem = Array(repeating: Array(repeating: -1, count: cap + 1), count: n + 1)
        res = knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: n, c: cap)
        print("배낭 용량 내에서 얻는 최대 가치: \(res)")

        // 동적 계획법
        res = knapsackDP(wgt: wgt, val: val, cap: cap)
        print("배낭 용량 내에서 얻는 최대 가치: \(res)")

        // 공간 최적화 동적 계획법
        res = knapsackDPComp(wgt: wgt, val: val, cap: cap)
        print("배낭 용량 내에서 얻는 최대 가치: \(res)")
    }
}
