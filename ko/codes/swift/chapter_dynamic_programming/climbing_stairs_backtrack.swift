/**
 * File: climbing_stairs_backtrack.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 백트래킹 */
func backtrack(choices: [Int], state: Int, n: Int, res: inout [Int]) {
    // n번째 계단에 도달하면 방법의 수에 1을 더한다
    if state == n {
        res[0] += 1
    }
    // 모든 선택지를 순회한다
    for choice in choices {
        // 가지치기: n번째 계단을 넘어갈 수 없다
        if state + choice > n {
            continue
        }
        // 시도: 선택하고 상태를 갱신한다
        backtrack(choices: choices, state: state + choice, n: n, res: &res)
        // 되돌리기
    }
}

/* 계단 오르기: 백트래킹 */
func climbingStairsBacktrack(n: Int) -> Int {
    let choices = [1, 2] // 한 계단 또는 두 계단 오르기를 선택할 수 있다
    let state = 0 // 0번째 계단에서 오르기 시작한다
    var res: [Int] = []
    res.append(0) // res[0]에 방법의 수를 기록한다
    backtrack(choices: choices, state: state, n: n, res: &res)
    return res[0]
}

@main
enum ClimbingStairsBacktrack {
    /* 실행 코드 */
    static func main() {
        let n = 9

        let res = climbingStairsBacktrack(n: n)
        print("\(n)개 계단을 오르는 방법은 총 \(res)가지이다")
    }
}
