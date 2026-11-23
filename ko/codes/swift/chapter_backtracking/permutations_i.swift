/**
 * File: permutations_i.swift
 * Created Time: 2023-04-30
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 백트래킹 알고리즘: 모든 순열 I */
func backtrack(state: inout [Int], choices: [Int], selected: inout [Bool], res: inout [[Int]]) {
    // 상태의 길이가 원소 개수와 같으면 해를 기록한다
    if state.count == choices.count {
        res.append(state)
        return
    }
    // 모든 선택지를 순회한다
    for (i, choice) in choices.enumerated() {
        // 가지치기: 원소를 중복하여 선택할 수 없다
        if !selected[i] {
            // 시도: 선택하고 상태를 갱신한다
            selected[i] = true
            state.append(choice)
            // 다음 선택을 진행한다
            backtrack(state: &state, choices: choices, selected: &selected, res: &res)
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            selected[i] = false
            state.removeLast()
        }
    }
}

/* 모든 순열 I */
func permutationsI(nums: [Int]) -> [[Int]] {
    var state: [Int] = []
    var selected = Array(repeating: false, count: nums.count)
    var res: [[Int]] = []
    backtrack(state: &state, choices: nums, selected: &selected, res: &res)
    return res
}

@main
enum PermutationsI {
    /* 실행 코드 */
    static func main() {
        let nums = [1, 2, 3]

        let res = permutationsI(nums: nums)

        print("입력 배열 nums = \(nums)")
        print("모든 순열 res = \(res)")
    }
}
