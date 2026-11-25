/**
 * File: radix_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* 要素 num の下から k 桁目を取得。ここで exp = 10^(k-1) */
fun digit(num: Int, exp: Int): Int {
    // k ではなく exp を渡し、負荷の高いべき乗計算の繰り返しを避ける
    return (num / exp) % 10
}

/* カウントソート（nums の下から k 桁目でソート） */
fun countingSortDigit(nums: IntArray, exp: Int) {
    // 十進数の各桁は 0～9 なので、長さ 10 のバケット配列を用意
    val counter = IntArray(10)
    val n = nums.size
    // 0～9 の各数字の出現回数を数える
    for (i in 0..<n) {
        val d = digit(nums[i], exp) // nums[i] の下から k 桁目を d とする
        counter[d]++                // 数字 d の出現回数を数える
    }
    // 累積和を求め、出現回数を配列のインデックスに対応する値に変換
    for (i in 1..9) {
        counter[i] += counter[i - 1]
    }
    // 配列を逆順に走査し、バケットの集計値を使って各要素を res に書き込む
    val res = IntArray(n)
    for (i in n - 1 downTo 0) {
        val d = digit(nums[i], exp)
        val j = counter[d] - 1 // 配列内での d のインデックス j を求める
        res[j] = nums[i]       // 現在の要素をインデックス j に書き込む
        counter[d]--           // d の個数を 1 減らす
    }
    // 結果で元の配列 nums を上書き
    for (i in 0..<n)
        nums[i] = res[i]
}

/* 基数ソート */
fun radixSort(nums: IntArray) {
    // 配列の最大値から最大桁数を求める
    var m = Int.MIN_VALUE
    for (num in nums) if (num > m) m = num
    var exp = 1
    // 下位桁から上位桁へ順に走査
    while (exp <= m) {
        // 配列要素の下から k 桁目にカウントソートを適用
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // すなわち exp = 10^(k-1)
        countingSortDigit(nums, exp)
        exp *= 10
    }
}

/* 実行例 */
fun main() {
    // 基数ソート
    val nums = intArrayOf(
        10546151, 35663510, 42865989, 34862445, 81883077,
        88906420, 72429244, 30524779, 82060337, 63832996
    )
    radixSort(nums)
    println("基数ソート後の nums = ${nums.contentToString()}")
}