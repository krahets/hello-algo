/**
 * File: time_complexity.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.time_complexity

/* 定数オーダー */
fun constant(n: Int): Int {
    var count = 0
    val size = 100000
    for (i in 0..<size)
        count++
    return count
}

/* 線形オーダー */
fun linear(n: Int): Int {
    var count = 0
    for (i in 0..<n)
        count++
    return count
}

/* 線形オーダー（配列の走査） */
fun arrayTraversal(nums: IntArray): Int {
    var count = 0
    // ループの回数は配列の長さに比例する
    for (num in nums) {
        count++
    }
    return count
}

/* 二次オーダー */
fun quadratic(n: Int): Int {
    var count = 0
    // ループの回数はデータの大きさ n の二乗に比例する
    for (i in 0..<n) {
        for (j in 0..<n) {
            count++
        }
    }
    return count
}

/* 二次オーダー（バブルソート） */
fun bubbleSort(nums: IntArray): Int {
    var count = 0 // カウンタ
    // 外側のループ：未ソート区間は [0, i]
    for (i in nums.size - 1 downTo 1) {
        // 内側のループ：未ソート区間 [0, i] の最大要素を区間の右端に移す
        for (j in 0..<i) {
            if (nums[j] > nums[j + 1]) {
                // nums[j] と nums[j + 1] を交換する
                val temp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = temp
                count += 3 // 要素の交換は 3 回の単位操作からなる
            }
        }
    }
    return count
}

/* 指数オーダー（ループによる実装） */
fun exponential(n: Int): Int {
    var count = 0
    var base = 1
    // 各回で細胞が 2 つに分裂し、数列 1, 2, 4, 8, ..., 2^(n-1) を形成する
    for (i in 0..<n) {
        for (j in 0..<base) {
            count++
        }
        base *= 2
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count
}

/* 指数オーダー（再帰による実装） */
fun expRecur(n: Int): Int {
    if (n == 1) {
        return 1
    }
    return expRecur(n - 1) + expRecur(n - 1) + 1
}

/* 対数オーダー（ループによる実装） */
fun logarithmic(n: Int): Int {
    var n1 = n
    var count = 0
    while (n1 > 1) {
        n1 /= 2
        count++
    }
    return count
}

/* 対数オーダー（再帰による実装） */
fun logRecur(n: Int): Int {
    if (n <= 1)
        return 0
    return logRecur(n / 2) + 1
}

/* 線形対数オーダー */
fun linearLogRecur(n: Int): Int {
    if (n <= 1)
        return 1
    var count = linearLogRecur(n / 2) + linearLogRecur(n / 2)
    for (i in 0..<n) {
        count++
    }
    return count
}

/* 階乗オーダー（再帰による実装） */
fun factorialRecur(n: Int): Int {
    if (n == 0)
        return 1
    var count = 0
    // 1 個から n 個に分裂する
    for (i in 0..<n) {
        count += factorialRecur(n - 1)
    }
    return count
}

/* 実行用コード */
fun main() {
    // n を変更して実行し、各計算量で操作回数がどのように変化するか確かめられる
    val n = 8
    println("入力データの大きさ n = $n")

    var count = constant(n)
    println("定数オーダーの操作回数 = $count")

    count = linear(n)
    println("線形オーダーの操作回数 = $count")
    count = arrayTraversal(IntArray(n))
    println("線形オーダー（配列の走査）の操作回数 = $count")

    count = quadratic(n)
    println("二次オーダーの操作回数 = $count")
    val nums = IntArray(n)
    for (i in 0..<n)
        nums[i] = n - i // [n,n-1,...,2,1]
    count = bubbleSort(nums)
    println("二次オーダー（バブルソート）の操作回数 = $count")

    count = exponential(n)
    println("指数オーダー（ループによる実装）の操作回数 = $count")
    count = expRecur(n)
    println("指数オーダー（再帰による実装）の操作回数 = $count")

    count = logarithmic(n)
    println("対数オーダー（ループによる実装）の操作回数 = $count")
    count = logRecur(n)
    println("対数オーダー（再帰による実装）の操作回数 = $count")

    count = linearLogRecur(n)
    println("線形対数オーダー（再帰による実装）の操作回数 = $count")

    count = factorialRecur(n)
    println("階乗オーダー（再帰による実装）の操作回数 = $count")
}