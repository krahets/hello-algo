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
    // 第 n 段に到達したら、方法数を 1 増やす
    if (state == n)
        res[0] = res[0] + 1
    // すべての選択肢を走査
    for (choice in choices) {
        // 枝刈り: 第 n 段を超えないようにする
        if (state + choice > n) continue
        // 試行: 選択を行い、状態を更新
        backtrack(choices, state + choice, n, res)
        // バックトラック
    }
}

/* 階段登り：バックトラッキング */
fun climbingStairsBacktrack(n: Int): Int {
    val choices = mutableListOf(1, 2) // 1 段または 2 段上ることを選べる
    val state = 0 // 第 0 段から上り始める
    val res = mutableListOf<Int>()
    res.add(0) // res[0] を使って方法数を記録する
    backtrack(choices, state, n, res)
    return res[0]
}

/* Driver Code */
fun main() {
    val n = 9

    val res = climbingStairsBacktrack(n)
    println("$n 段の階段の登り方は全部で $res 通り")
}