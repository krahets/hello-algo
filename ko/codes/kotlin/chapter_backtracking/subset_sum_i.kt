/**
 * File: subset_sum_i.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.subset_sum_i

/* 백트래킹 알고리즘: 부분 집합 합 I */
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
    for (i in start..<choices.size) {
        // 가지치기 1: 부분 집합의 합이 target을 초과하면 즉시 반복문을 종료한다
        // 배열이 정렬되어 있어 뒤의 원소가 더 크므로, 부분 집합의 합이 반드시 target을 초과하기 때문이다
        if (target - choices[i] < 0) {
            break
        }
        // 시도: 선택하고 target, start를 갱신한다
        state.add(choices[i])
        // 다음 선택을 진행한다
        backtrack(state, target - choices[i], choices, i, res)
        // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
        state.removeAt(state.size - 1)
    }
}

/* 부분 집합 합 I 풀기 */
fun subsetSumI(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
    val state = mutableListOf<Int>() // 상태(부분 집합)
    nums.sort() // nums를 정렬한다
    val start = 0 // 순회 시작 위치
    val res = mutableListOf<MutableList<Int>?>() // 결과 리스트(부분 집합 리스트)
    backtrack(state, target, nums, start, res)
    return res
}

/* 실행 코드 */
fun main() {
    val nums = intArrayOf(3, 4, 5)
    val target = 9

    val res = subsetSumI(nums, target)

    println("입력 배열 nums = ${nums.contentToString()}, target = $target")
    println("합이 목표값($target)과 같은 모든 부분 집합 res = $res")
}