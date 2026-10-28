/**
 * File: subset_sum_ii.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.subset_sum_ii

/* 백트래킹 알고리즘: 부분 집합 합 II */
fun backtrack(
    state: MutableList<Int>,
    target: Int,
    choices: IntArray,
    start: Int,
    res: MutableList<MutableList<Int>?>
) {
    // 부분 집합의 합이 target과 같으면 해를 기록한다
    if (target == 0) {
        res.add(state.toMutableList())
        return
    }
    // 모든 선택지를 순회한다
    // 가지치기 2: start부터 순회하여 중복 부분 집합 생성을 방지한다
    // 가지치기 3: start부터 순회하여 같은 원소의 중복 선택을 방지한다
    for (i in start..<choices.size) {
        // 가지치기 1: 부분 집합의 합이 target을 초과하면 즉시 반복문을 종료한다
        // 배열이 정렬되어 있어 뒤의 원소가 더 크므로, 부분 집합의 합이 반드시 target을 초과하기 때문이다
        if (target - choices[i] < 0) {
            break
        }
        // 가지치기 4: 해당 원소가 왼쪽 원소와 같으면 탐색 분기가 중복되므로 바로 건너뛴다
        if (i > start && choices[i] == choices[i - 1]) {
            continue
        }
        // 시도: 선택하고 target, start를 갱신한다
        state.add(choices[i])
        // 다음 선택을 진행한다
        backtrack(state, target - choices[i], choices, i + 1, res)
        // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
        state.removeAt(state.size - 1)
    }
}

/* 부분 집합 합 II 풀기 */
fun subsetSumII(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
    val state = mutableListOf<Int>() // 상태(부분 집합)
    nums.sort() // nums를 정렬한다
    val start = 0 // 순회 시작 위치
    val res = mutableListOf<MutableList<Int>?>() // 결과 리스트(부분 집합 리스트)
    backtrack(state, target, nums, start, res)
    return res
}

/* 실행 코드 */
fun main() {
    val nums = intArrayOf(4, 4, 5)
    val target = 9
    val res = subsetSumII(nums, target)

    println("입력 배열 nums = ${nums.contentToString()}, target = $target")
    println("합이 목표값($target)과 같은 모든 부분 집합 res = $res")
}