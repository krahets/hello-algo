/**
 * File: climbing_stairs_backtrack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* バックトラック */
fun backtrack(
    choices: MutableList<Int>,
    state: Int,
    n: Int,
    res: MutableList<Int>
) {
    // n 段目に着いたら、登り方の数を 1 増やす
    if (state == n)
        res[0] = res[0] + 1
    // すべての選択肢を調べる
    for (choice in choices) {
        // 枝刈り：n 段目を越えないようにする
        if (state + choice > n) continue
        // 選択肢を試し、状態を更新する
        backtrack(choices, state + choice, n, res)
        // 選択を取り消す
    }
}

/* 階段の登り方：バックトラック */
fun climbingStairsBacktrack(n: Int): Int {
    val choices = mutableListOf(1, 2) // 1 段または 2 段登れる
    val state = 0 // 0 段目から登り始める
    val res = mutableListOf<Int>()
    res.add(0) // res[0] に登り方の数を記録する
    backtrack(choices, state, n, res)
    return res[0]
}

/* 実行例 */
fun main() {
    val n = 9

    val res = climbingStairsBacktrack(n)
    println("全 $n 段の階段の登り方は $res 通り")
}