/**
 * File: subset_sum_i_naive.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 백트래킹: 부분집합의 합 I */
func backtrack(state: inout [Int], target: Int, total: Int, choices: [Int], res: inout [[Int]]) {
    // 부분집합의 합이 target과 같으면 해를 기록한다
    if total == target {
        res.append(state)
        return
    }
    // 모든 선택지를 순회한다
    for i in choices.indices {
        // 가지치기: 부분집합의 합이 target을 초과하면 이 선택을 건너뛴다
        if total + choices[i] > target {
            continue
        }
        // 시도: 원소를 선택하고 원소의 합 total을 갱신한다
        state.append(choices[i])
        // 다음 선택을 진행한다
        backtrack(state: &state, target: target, total: total + choices[i], choices: choices, res: &res)
        // 되돌리기: 선택을 취소하고 이전 상태를 복원한다
        state.removeLast()
    }
}

/* 부분집합의 합 I 풀기(중복 부분집합 포함) */
func subsetSumINaive(nums: [Int], target: Int) -> [[Int]] {
    var state: [Int] = [] // 상태(부분집합)
    let total = 0 // 부분집합의 합
    var res: [[Int]] = [] // 결과 리스트(부분집합의 리스트)
    backtrack(state: &state, target: target, total: total, choices: nums, res: &res)
    return res
}

@main
enum SubsetSumINaive {
    /* 실행 코드 */
    static func main() {
        let nums = [3, 4, 5]
        let target = 9

        let res = subsetSumINaive(nums: nums, target: target)

        print("입력 배열 nums = \(nums), target = \(target)")
        print("목표 합 \(target)에 맞는 모든 부분집합 res = \(res)")
        print("이 방법의 결과에는 중복된 집합이 포함된다")
    }
}
