/**
 * File: permutations_i.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.permutations_i

/* 백트래킹 알고리즘: 모든 순열 I */
fun backtrack(
    state: MutableList<Int>,
    choices: IntArray,
    selected: BooleanArray,
    res: MutableList<MutableList<Int>?>
) {
    // 상태의 길이가 원소 개수와 같으면 해를 기록한다
    if (state.size == choices.size) {
        res.add(state.toMutableList())
        return
    }
    // 모든 선택지를 순회한다
    for (i in choices.indices) {
        val choice = choices[i]
        // 가지치기: 원소를 중복하여 선택할 수 없다
        if (!selected[i]) {
            // 시도: 선택하고 상태를 갱신한다
            selected[i] = true
            state.add(choice)
            // 다음 선택을 진행한다
            backtrack(state, choices, selected, res)
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            selected[i] = false
            state.removeAt(state.size - 1)
        }
    }
}

/* 모든 순열 I */
fun permutationsI(nums: IntArray): MutableList<MutableList<Int>?> {
    val res = mutableListOf<MutableList<Int>?>()
    backtrack(mutableListOf(), nums, BooleanArray(nums.size), res)
    return res
}

/* 실행 코드 */
fun main() {
    val nums = intArrayOf(1, 2, 3)

    val res = permutationsI(nums)

    println("입력 배열 nums = ${nums.contentToString()}")
    println("모든 순열 res = $res")
}