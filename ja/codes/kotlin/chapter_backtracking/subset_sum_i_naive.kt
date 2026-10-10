/**
 * File: subset_sum_i_native.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.subset_sum_i_naive

/* バックトラッキング：部分和 I */
fun backtrack(
    state: MutableList<Int>,
    target: Int,
    total: Int,
    choices: IntArray,
    res: MutableList<MutableList<Int>?>
) {
    // 部分集合の和が target に等しければ、解を記録
    if (total == target) {
        res.add(state.toMutableList())
        return
    }
    // すべての選択肢を走査
    for (i in choices.indices) {
        // 枝刈り：部分和が target を超える場合はその選択をスキップする
        if (total + choices[i] > target) {
            continue
        }
        // 試行：選択を行い、要素と total を更新する
        state.add(choices[i])
        // 次の選択へ進む
        backtrack(state, target, total + choices[i], choices, res)
        // バックトラック：選択を取り消し、前の状態に戻す
        state.removeAt(state.size - 1)
    }
}

/* 部分和 I を解く（重複部分集合を含む） */
fun subsetSumINaive(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
    val state = mutableListOf<Int>() // 状態（部分集合）
    val total = 0 // 部分和
    val res = mutableListOf<MutableList<Int>?>() // 結果リスト（部分集合のリスト）
    backtrack(state, target, total, nums, res)
    return res
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(3, 4, 5)
    val target = 9
    val res = subsetSumINaive(nums, target)

    println("入力配列 nums = ${nums.contentToString()}, target = $target")
    println("和が $target に等しいすべての部分集合 res = $res")
    println("この方法の出力結果には重複した集合が含まれるので注意")
}