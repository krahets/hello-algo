/**
 * File: climbing_stairs_backtrack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* バックトラッキング */
fun backtrack(
    choices: MutableList<Int>,
    state: Int,
    n: Int,
    res: MutableList<Int>
) {
    // n 段目に到達したら、方法の数を 1 増やす
    if (state == n)
        res[0] = res[0] + 1
    // すべての選択肢を走査する
    for (choice in choices) {
        // 枝刈り：n 段目を越えてはならない
        if (state + choice > n) continue
        // 試行：選択を行い、状態を更新する
        backtrack(choices, state + choice, n, res)
        // 復元
    }
}

/* 階段の上り方：バックトラッキング */
fun climbingStairsBacktrack(n: Int): Int {
    val choices = mutableListOf(1, 2) // 1 段または 2 段上ることを選択できる
    val state = 0 // 0 段目から上り始める
    val res = mutableListOf<Int>()
    res.add(0) // res[0] に方法の数を記録する
    backtrack(choices, state, n, res)
    return res[0]
}

/* 実行用コード */
fun main() {
    val n = 9

    val res = climbingStairsBacktrack(n)
    println("$n 段の階段を上る方法は全部で $res 通り")
}