/**
 * File: subset_sum_i_native.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.subset_sum_i_naive

/* バックトラッキングによる部分和問題 I */
fun backtrack(
    state: MutableList<Int>,
    target: Int,
    total: Int,
    choices: IntArray,
    res: MutableList<MutableList<Int>?>
) {
    // 部分集合の要素の和が target に等しくなったら解を記録する
    if (total == target) {
        res.add(state.toMutableList())
        return
    }
    // すべての選択肢を調べる
    for (i in choices.indices) {
        // 枝刈り：部分集合の要素の和が target を超えるなら、その選択を飛ばす
        if (total + choices[i] > target) {
            continue
        }
        // 試行：選択して要素の和 total を更新する
        state.add(choices[i])
        // 次の選択に進む
        backtrack(state, target, total + choices[i], choices, res)
        // 後戻り：選択を取り消し、元の状態に戻す
        state.removeAt(state.size - 1)
    }
}

/* 部分和問題 I を解く（重複する部分集合を含む） */
fun subsetSumINaive(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
    val state = mutableListOf<Int>() // 状態（部分集合）
    val total = 0 // 部分和
    val res = mutableListOf<MutableList<Int>?>() // 結果のリスト（部分集合のリスト）
    backtrack(state, target, total, nums, res)
    return res
}

/* 実行例 */
fun main() {
    val nums = intArrayOf(3, 4, 5)
    val target = 9
    val res = subsetSumINaive(nums, target)

    println("入力配列 nums = ${nums.contentToString()}, target = $target")
    println("要素の和が $target となるすべての部分集合 res = $res")
    println("この方法の出力には重複する集合が含まれる点に注意")
}