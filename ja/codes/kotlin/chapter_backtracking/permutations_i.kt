/**
 * File: permutations_i.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.permutations_i

/* バックトラッキング：順列 I */
fun backtrack(
    state: MutableList<Int>,
    choices: IntArray,
    selected: BooleanArray,
    res: MutableList<MutableList<Int>?>
) {
    // 状態の長さが要素数に等しければ、解を記録
    if (state.size == choices.size) {
        res.add(state.toMutableList())
        return
    }
    // すべての選択肢を走査
    for (i in choices.indices) {
        val choice = choices[i]
        // 枝刈り：要素の重複選択を許可しない
        if (!selected[i]) {
            // 試行: 選択を行い、状態を更新
            selected[i] = true
            state.add(choice)
            // 次の選択へ進む
            backtrack(state, choices, selected, res)
            // バックトラック：選択を取り消し、前の状態に戻す
            selected[i] = false
            state.removeAt(state.size - 1)
        }
    }
}

/* 全順列 I */
fun permutationsI(nums: IntArray): MutableList<MutableList<Int>?> {
    val res = mutableListOf<MutableList<Int>?>()
    backtrack(mutableListOf(), nums, BooleanArray(nums.size), res)
    return res
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(1, 2, 3)

    val res = permutationsI(nums)

    println("入力配列 nums = ${nums.contentToString()}")
    println("すべての順列 res = $res")
}