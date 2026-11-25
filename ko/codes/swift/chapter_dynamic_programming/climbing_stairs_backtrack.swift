/**
 * File: climbing_stairs_backtrack.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 백트래킹 */
func backtrack(choices: [Int], state: Int, n: Int, res: inout [Int]) {
    // n번째 계단에 도달하면 방법 수를 1 늘린다
    if state == n {
        res[0] += 1
    }
    // 모든 선택지 순회
    for choice in choices {
        // 가지치기: n번째 계단을 넘지 않는다
        if state + choice > n {
            continue
        }
        // 시도: 선택한 뒤 상태를 갱신한다
        backtrack(choices: choices, state: state + choice, n: n, res: &res)
        // 선택 취소
    }
}

/* 계단 오르기: 백트래킹 */
func climbingStairsBacktrack(n: Int) -> Int {
    let choices = [1, 2] // 한 번에 한 계단 또는 두 계단을 오른다
    let state = 0 // 0번째 계단에서 출발한다
    var res: [Int] = []
    res.append(0) // res[0]에 방법 수를 기록한다
    backtrack(choices: choices, state: state, n: n, res: &res)
    return res[0]
}

@main
enum ClimbingStairsBacktrack {
    /* 실행 예제 */
    static func main() {
        let n = 9

        let res = climbingStairsBacktrack(n: n)
        print("계단 \(n)개를 오르는 방법은 \(res)가지")
    }
}
