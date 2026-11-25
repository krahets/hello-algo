/**
 * File: subset_sum_i_native.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.subset_sum_i_naive

/* 백트래킹: 부분집합의 합 I */
fun backtrack(
    state: MutableList<Int>,
    target: Int,
    total: Int,
    choices: IntArray,
    res: MutableList<MutableList<Int>?>
) {
    // 부분집합의 합이 target과 같으면 해를 기록한다
    if (total == target) {
        res.add(state.toMutableList())
        return
    }
    // 모든 선택지를 순회한다
    for (i in choices.indices) {
        // 가지치기: 부분집합의 합이 target을 초과하면 이 선택을 건너뛴다
        if (total + choices[i] > target) {
            continue
        }
        // 시도: 원소를 선택하고 원소의 합 total을 갱신한다
        state.add(choices[i])
        // 다음 선택을 진행한다
        backtrack(state, target, total + choices[i], choices, res)
        // 되돌리기: 선택을 취소하고 이전 상태를 복원한다
        state.removeAt(state.size - 1)
    }
}

/* 부분집합의 합 I 풀기(중복 부분집합 포함) */
fun subsetSumINaive(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
    val state = mutableListOf<Int>() // 상태(부분집합)
    val total = 0 // 부분집합의 합
    val res = mutableListOf<MutableList<Int>?>() // 결과 리스트(부분집합의 리스트)
    backtrack(state, target, total, nums, res)
    return res
}

/* 실행 코드 */
fun main() {
    val nums = intArrayOf(3, 4, 5)
    val target = 9
    val res = subsetSumINaive(nums, target)

    println("입력 배열 nums = ${nums.contentToString()}, target = $target")
    println("목표 합 = $target | 조건을 만족하는 모든 부분집합 res = $res")
    println("이 방법의 결과에는 중복된 집합이 포함된다")
}