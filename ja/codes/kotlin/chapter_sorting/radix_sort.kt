/**
 * File: radix_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* 要素 num の第 k 桁を取得する。exp = 10^(k-1) とする */
fun digit(num: Int, exp: Int): Int {
    // k ではなく exp を渡すことで、ここで高コストのべき乗計算を繰り返すのを避ける
    return (num / exp) % 10
}

/* カウントソート（nums の第 k 桁に基づくソート） */
fun countingSortDigit(nums: IntArray, exp: Int) {
    // 十進数の各桁の範囲は 0~9 なので、長さ 10 のバケット配列が必要
    val counter = IntArray(10)
    val n = nums.size
    // 0~9 の各数字の出現回数を数える
    for (i in 0..<n) {
        val d = digit(nums[i], exp) // nums[i] の第 k 桁を取得し、d とする
        counter[d]++                // 数字 d の出現回数を数える
    }
    // 累積和を求め、「出現回数」を「配列のインデックス」に変換する
    for (i in 1..9) {
        counter[i] += counter[i - 1]
    }
    // 逆順に走査し、バケット内の集計結果に基づいて各要素を res に入れる
    val res = IntArray(n)
    for (i in n - 1 downTo 0) {
        val d = digit(nums[i], exp)
        val j = counter[d] - 1 // 配列内での d のインデックス j を取得する
        res[j] = nums[i]       // 現在の要素をインデックス j に入れる
        counter[d]--           // d の個数を 1 減らす
    }
    // 結果で元の配列 nums を上書きする
    for (i in 0..<n)
        nums[i] = res[i]
}

/* 基数ソート */
fun radixSort(nums: IntArray) {
    // 最大桁数を判定するため、配列の最大要素を取得する
    var m = Int.MIN_VALUE
    for (num in nums) if (num > m) m = num
    var exp = 1
    // 下位の桁から上位の桁へ順に走査する
    while (exp <= m) {
        // 配列の要素の第 k 桁に対してカウントソートを行う
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // つまり exp = 10^(k-1)
        countingSortDigit(nums, exp)
        exp *= 10
    }
}

/* 実行用コード */
fun main() {
    // 基数ソート
    val nums = intArrayOf(
        10546151, 35663510, 42865989, 34862445, 81883077,
        88906420, 72429244, 30524779, 82060337, 63832996
    )
    radixSort(nums)
    println("基数ソート完了後 nums = ${nums.contentToString()}")
}