/**
 * File: permutations_ii.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.permutations_ii

/* バックトラッキングによる全順列 II */
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
    val duplicated = HashSet<Int>()
    for (i in choices.indices) {
        val choice = choices[i]
        // 枝刈り：同じ要素は二度選ばず、この段階で同じ値の要素も繰り返し試さない
        if (!selected[i] && !duplicated.contains(choice)) {
            // 試行：選択して状態を更新する
            duplicated.add(choice) // 選んだ要素の値を記録する
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

/* 全順列 II */
fun permutationsII(nums: IntArray): MutableList<MutableList<Int>?> {
    val res = mutableListOf<MutableList<Int>?>()
    backtrack(mutableListOf(), nums, BooleanArray(nums.size), res)
    return res
}

/* 実行例 */
fun main() {
    val nums = intArrayOf(1, 2, 2)
    val res = permutationsII(nums)

    println("入力配列 nums = ${nums.contentToString()}")
    println("すべての順列 res = $res")
}