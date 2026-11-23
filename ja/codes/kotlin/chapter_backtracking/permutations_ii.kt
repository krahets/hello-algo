/**
 * File: permutations_ii.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.permutations_ii

/* バックトラッキング：すべての順列 II */
fun backtrack(
    state: MutableList<Int>,
    choices: IntArray,
    selected: BooleanArray,
    res: MutableList<MutableList<Int>?>
) {
    // 状態の長さが要素数と等しくなったら、解を記録する
    if (state.size == choices.size) {
        res.add(state.toMutableList())
        return
    }
    // すべての選択肢を走査する
    val duplicated = HashSet<Int>()
    for (i in choices.indices) {
        val choice = choices[i]
        // 枝刈り：同じ要素の再選択も、等しい値を持つ要素の重複選択も許可しない
        if (!selected[i] && !duplicated.contains(choice)) {
            // 試行：選択を行い、状態を更新する
            duplicated.add(choice) // 選択済みの要素の値を記録する
            selected[i] = true
            state.add(choice)
            // 次の選択に進む
            backtrack(state, choices, selected, res)
            // 復元：選択を取り消し、以前の状態に戻す
            selected[i] = false
            state.removeAt(state.size - 1)
        }
    }
}

/* すべての順列 II */
fun permutationsII(nums: IntArray): MutableList<MutableList<Int>?> {
    val res = mutableListOf<MutableList<Int>?>()
    backtrack(mutableListOf(), nums, BooleanArray(nums.size), res)
    return res
}

/* 実行用コード */
fun main() {
    val nums = intArrayOf(1, 2, 2)
    val res = permutationsII(nums)

    println("入力配列 nums = ${nums.contentToString()}")
    println("すべての順列 res = $res")
}