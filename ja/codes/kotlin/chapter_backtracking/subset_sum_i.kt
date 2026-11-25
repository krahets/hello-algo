/**
 * File: subset_sum_i.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.subset_sum_i

/* バックトラッキングによる部分和問題 I */
fun backtrack(
    state: MutableList<Int>,
    target: Int,
    choices: IntArray,
    start: Int,
    res: MutableList<MutableList<Int>?>
) {
    // 部分集合の要素の和が target に等しくなったら解を記録する
    if (target == 0) {
        res.add(state.toMutableList())
        return
    }
    // すべての選択肢を調べる
    // 枝刈り 2：start から調べて部分集合の重複を防ぐ
    for (i in start..<choices.size) {
        // 枝刈り 1：部分集合の要素の和が target を超えたらループを終了する
        // 配列はソート済みで、後の要素ほど大きく、和は必ず target を超えるため
        if (target - choices[i] < 0) {
            break
        }
        // 試行：選択して target と start を更新する
        state.add(choices[i])
        // 次の選択に進む
        backtrack(state, target - choices[i], choices, i, res)
        // 後戻り：選択を取り消し、元の状態に戻す
        state.removeAt(state.size - 1)
    }
}

/* 部分和問題 I を解く */
fun subsetSumI(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
    val state = mutableListOf<Int>() // 状態（部分集合）
    nums.sort() // nums をソートする
    val start = 0 // 走査の開始位置
    val res = mutableListOf<MutableList<Int>?>() // 結果のリスト（部分集合のリスト）
    backtrack(state, target, nums, start, res)
    return res
}

/* 実行例 */
fun main() {
    val nums = intArrayOf(3, 4, 5)
    val target = 9

    val res = subsetSumI(nums, target)

    println("入力配列 nums = ${nums.contentToString()}, target = $target")
    println("要素の和が $target となるすべての部分集合 res = $res")
}