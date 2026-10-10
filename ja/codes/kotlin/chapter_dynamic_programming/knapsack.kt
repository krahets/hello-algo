/**
 * File: knapsack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.max

/* 0-1 ナップサック：総当たり探索 */
fun knapsackDFS(
    wgt: IntArray,
    _val: IntArray,
    i: Int,
    c: Int
): Int {
    // すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
    if (i == 0 || c == 0) {
        return 0
    }
    // ナップサック容量を超える場合は、入れない選択しかできない
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, _val, i - 1, c)
    }
    // 品物 i を入れない場合と入れる場合の最大価値を計算する
    val no = knapsackDFS(wgt, _val, i - 1, c)
    val yes = knapsackDFS(wgt, _val, i - 1, c - wgt[i - 1]) + _val[i - 1]
    // 2つの案のうち価値が大きいほうを返す
    return max(no, yes)
}

/* 0-1 ナップサック：メモ化探索 */
fun knapsackDFSMem(
    wgt: IntArray,
    _val: IntArray,
    mem: Array<IntArray>,
    i: Int,
    c: Int
): Int {
    // すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
    if (i == 0 || c == 0) {
        return 0
    }
    // 既に記録があればそのまま返す
    if (mem[i][c] != -1) {
        return mem[i][c]
    }
    // ナップサック容量を超える場合は、入れない選択しかできない
    if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, _val, mem, i - 1, c)
    }
    // 品物 i を入れない場合と入れる場合の最大価値を計算する
    val no = knapsackDFSMem(wgt, _val, mem, i - 1, c)
    val yes = knapsackDFSMem(wgt, _val, mem, i - 1, c - wgt[i - 1]) + _val[i - 1]
    // 2 つの案のうち価値が大きい方を記録して返す
    mem[i][c] = max(no, yes)
    return mem[i][c]
}

/* 0-1 ナップサック：動的計画法 */
fun knapsackDP(wgt: IntArray, _val: IntArray, cap: Int): Int {
    val n = wgt.size
    // dp テーブルを初期化
    val dp = Array(n + 1) { IntArray(cap + 1) }
    // 状態遷移
    for (i in 1..n) {
        for (c in 1..cap) {
            if (wgt[i - 1] > c) {
                // ナップサック容量を超えるなら品物 i は選ばない
                dp[i][c] = dp[i - 1][c]
            } else {
                // 品物 i を選ばない場合と選ぶ場合の大きい方
                dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + _val[i - 1])
            }
        }
    }
    return dp[n][cap]
}

/* 0-1 ナップサック：空間最適化後の動的計画法 */
fun knapsackDPComp(wgt: IntArray, _val: IntArray, cap: Int): Int {
    val n = wgt.size
    // dp テーブルを初期化
    val dp = IntArray(cap + 1)
    // 状態遷移
    for (i in 1..n) {
        // 逆順に走査する
        for (c in cap downTo 1) {
            if (wgt[i - 1] <= c) {
                // 品物 i を選ばない場合と選ぶ場合の大きい方
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + _val[i - 1])
            }
        }
    }
    return dp[cap]
}

/* Driver Code */
fun main() {
    val wgt = intArrayOf(10, 20, 30, 40, 50)
    val _val = intArrayOf(50, 120, 150, 210, 240)
    val cap = 50
    val n = wgt.size

    // 全探索
    var res = knapsackDFS(wgt, _val, n, cap)
    println("ナップサック容量を超えない最大価値は $res")

    // メモ化探索
    val mem = Array(n + 1) { IntArray(cap + 1) }
    for (row in mem) {
        row.fill(-1)
    }
    res = knapsackDFSMem(wgt, _val, mem, n, cap)
    println("ナップサック容量を超えない最大価値は $res")

    // 動的計画法
    res = knapsackDP(wgt, _val, cap)
    println("ナップサック容量を超えない最大価値は $res")

    // 空間最適化後の動的計画法
    res = knapsackDPComp(wgt, _val, cap)
    println("ナップサック容量を超えない最大価値は $res")
}