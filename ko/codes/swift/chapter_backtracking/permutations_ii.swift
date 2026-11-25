/**
 * File: permutations_ii.swift
 * Created Time: 2023-04-30
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 백트래킹: 순열 II */
func backtrack(state: inout [Int], choices: [Int], selected: inout [Bool], res: inout [[Int]]) {
    // 상태의 길이가 원소 개수와 같으면 해를 기록한다
    if state.count == choices.count {
        res.append(state)
        return
    }
    // 모든 선택지를 순회한다
    var duplicated: Set<Int> = []
    for (i, choice) in choices.enumerated() {
        // 가지치기: 이미 선택한 원소를 다시 고르거나 같은 층에서 값이 같은 원소를 다시 고르지 않는다
        if !selected[i], !duplicated.contains(choice) {
            // 시도: 하나를 선택하고 상태를 갱신한다
            duplicated.insert(choice) // 선택한 원소의 값을 기록한다
            selected[i] = true
            state.append(choice)
            // 다음 선택을 진행한다
            backtrack(state: &state, choices: choices, selected: &selected, res: &res)
            // 되돌리기: 선택을 취소하고 이전 상태를 복원한다
            selected[i] = false
            state.removeLast()
        }
    }
}

/* 순열 II */
func permutationsII(nums: [Int]) -> [[Int]] {
    var state: [Int] = []
    var selected = Array(repeating: false, count: nums.count)
    var res: [[Int]] = []
    backtrack(state: &state, choices: nums, selected: &selected, res: &res)
    return res
}

@main
enum PermutationsII {
    /* 실행 코드 */
    static func main() {
        let nums = [1, 2, 3]

        let res = permutationsII(nums: nums)

        print("입력 배열 nums = \(nums)")
        print("모든 순열 res = \(res)")
    }
}
