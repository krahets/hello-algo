/**
 * File: subset_sum_i.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.subset_sum_i

/* バックトラッキング：部分和 I */
fun backtrack(
    state: MutableList<Int>,
    target: Int,
    choices: IntArray,
    start: Int,
    res: MutableList<MutableList<Int>?>
) {
    // 部分集合の和が target に等しければ、解を記録
    if (target == 0) {
        res.add(state.toMutableList())
        return
    }
    // すべての選択肢を走査
    // 枝刈り 2: start から走査し、重複する部分集合の生成を避ける
    for (i in start..<choices.size) {
        // 枝刈り1：部分集合の和が target を超えたら、直ちにループを終了する
        // 配列はソート済みで後続要素のほうが大きく、部分集合の和は必ず target を超えるため
        if (target - choices[i] < 0) {
            break
        }
        // 試す：選択を行い、target と start を更新
        state.add(choices[i])
        // 次の選択へ進む
        backtrack(state, target - choices[i], choices, i, res)
        // バックトラック：選択を取り消し、前の状態に戻す
        state.removeAt(state.size - 1)
    }
}

/* 部分和 I を解く */
fun subsetSumI(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
    val state = mutableListOf<Int>() // 状態（部分集合）
    nums.sort() // nums をソート
    val start = 0 // 開始点を走査
    val res = mutableListOf<MutableList<Int>?>() // 結果リスト（部分集合のリスト）
    backtrack(state, target, nums, start, res)
    return res
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(3, 4, 5)
    val target = 9

    val res = subsetSumI(nums, target)

    println("入力配列 nums = ${nums.contentToString()}, target = $target")
    println("和が $target に等しいすべての部分集合 res = $res")
}