/**
 * File: permutations_ii.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.permutations_ii

/* 백트래킹: 순열 II */
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
    val duplicated = HashSet<Int>()
    for (i in choices.indices) {
        val choice = choices[i]
        // 가지치기: 이미 선택한 원소를 다시 고르거나 같은 층에서 값이 같은 원소를 다시 고르지 않는다
        if (!selected[i] && !duplicated.contains(choice)) {
            // 시도: 하나를 선택하고 상태를 갱신한다
            duplicated.add(choice) // 선택한 원소의 값을 기록한다
            selected[i] = true
            state.add(choice)
            // 다음 선택을 진행한다
            backtrack(state, choices, selected, res)
            // 되돌리기: 선택을 취소하고 이전 상태를 복원한다
            selected[i] = false
            state.removeAt(state.size - 1)
        }
    }
}

/* 순열 II */
fun permutationsII(nums: IntArray): MutableList<MutableList<Int>?> {
    val res = mutableListOf<MutableList<Int>?>()
    backtrack(mutableListOf(), nums, BooleanArray(nums.size), res)
    return res
}

/* 실행 코드 */
fun main() {
    val nums = intArrayOf(1, 2, 2)
    val res = permutationsII(nums)

    println("입력 배열 nums = ${nums.contentToString()}")
    println("모든 순열 res = $res")
}