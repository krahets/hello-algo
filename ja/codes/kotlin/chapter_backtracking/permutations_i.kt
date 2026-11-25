/**
 * File: permutations_i.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.permutations_i

/* バックトラッキングによる全順列 I */
fun backtrack(
    state: MutableList<Int>,
    choices: IntArray,
    selected: BooleanArray,
    res: MutableList<MutableList<Int>?>
) {
    // 状態の長さが要素数に達したら解を記録する
    if (state.size == choices.size) {
        res.add(state.toMutableList())
        return
    }
    // すべての選択肢を調べる
    for (i in choices.indices) {
        val choice = choices[i]
        // 枝刈り：同じ要素は二度選ばない
        if (!selected[i]) {
            // 試行：選択して状態を更新する
            selected[i] = true
            state.add(choice)
            // 次の選択に進む
            backtrack(state, choices, selected, res)
            // 後戻り：選択を取り消し、元の状態に戻す
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

/* 実行例 */
fun main() {
    val nums = intArrayOf(1, 2, 3)

    val res = permutationsI(nums)

    println("入力配列 nums = ${nums.contentToString()}")
    println("すべての順列 res = $res")
}