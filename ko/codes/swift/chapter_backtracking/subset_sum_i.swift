/**
 * File: subset_sum_i.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 백트래킹: 부분집합의 합 I */
func backtrack(state: inout [Int], target: Int, choices: [Int], start: Int, res: inout [[Int]]) {
    // 부분집합의 합이 target과 같으면 해를 기록한다
    if target == 0 {
        res.append(state)
        return
    }
    // 모든 선택지를 순회한다
    // 가지치기 2: start부터 순회하여 같은 부분집합이 중복 생성되는 것을 막는다
    for i in choices.indices.dropFirst(start) {
        // 가지치기 1: 부분집합의 합이 target을 초과하면 즉시 반복을 끝낸다
        // 배열이 정렬되어 뒤의 원소가 더 크므로 부분집합의 합이 반드시 target을 초과한다
        if target - choices[i] < 0 {
            break
        }
        // 시도: 원소를 선택하고 target과 start를 갱신한다
        state.append(choices[i])
        // 다음 선택을 진행한다
        backtrack(state: &state, target: target - choices[i], choices: choices, start: i, res: &res)
        // 되돌리기: 선택을 취소하고 이전 상태를 복원한다
        state.removeLast()
    }
}

/* 부분집합의 합 I 풀기 */
func subsetSumI(nums: [Int], target: Int) -> [[Int]] {
    var state: [Int] = [] // 상태(부분집합)
    let nums = nums.sorted() // nums를 정렬한다
    let start = 0 // 순회 시작점
    var res: [[Int]] = [] // 결과 리스트(부분집합의 리스트)
    backtrack(state: &state, target: target, choices: nums, start: start, res: &res)
    return res
}

@main
enum SubsetSumI {
    /* 실행 코드 */
    static func main() {
        let nums = [3, 4, 5]
        let target = 9

        let res = subsetSumI(nums: nums, target: target)

        print("입력 배열 nums = \(nums), target = \(target)")
        print("목표 합 \(target)에 맞는 모든 부분집합 res = \(res)")
    }
}
