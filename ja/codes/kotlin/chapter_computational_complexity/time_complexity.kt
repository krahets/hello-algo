/**
 * File: time_complexity.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.time_complexity

/* 定数階 */
fun constant(n: Int): Int {
    var count = 0
    val size = 100000
    for (i in 0..<size)
        count++
    return count
}

/* 線形階 */
fun linear(n: Int): Int {
    var count = 0
    for (i in 0..<n)
        count++
    return count
}

/* 線形時間（配列を走査） */
fun arrayTraversal(nums: IntArray): Int {
    var count = 0
    // ループ回数は配列長に比例する
    for (num in nums) {
        count++
    }
    return count
}

/* 二乗階 */
fun quadratic(n: Int): Int {
    var count = 0
    // ループ回数はデータサイズ n の二乗に比例する
    for (i in 0..<n) {
        for (j in 0..<n) {
            count++
        }
    }
    return count
}

/* 二次時間（バブルソート） */
fun bubbleSort(nums: IntArray): Int {
    var count = 0 // カウンタ
    // 外側のループ：未ソート区間は [0, i]
    for (i in nums.size - 1 downTo 1) {
        // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
        for (j in 0..<i) {
            if (nums[j] > nums[j + 1]) {
                // nums[j] と nums[j + 1] を交換
                val temp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = temp
                count += 3 // 要素交換には 3 回の単位操作が含まれる
            }
        }
    }
    return count
}

/* 指数時間（ループ実装） */
fun exponential(n: Int): Int {
    var count = 0
    var base = 1
    // 細胞は各ラウンドで 2 つに分裂し、数列 1, 2, 4, 8, ..., 2^(n-1) を形成する
    for (i in 0..<n) {
        for (j in 0..<base) {
            count++
        }
        base *= 2
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count
}

/* 指数時間（再帰実装） */
fun expRecur(n: Int): Int {
    if (n == 1) {
        return 1
    }
    return expRecur(n - 1) + expRecur(n - 1) + 1
}

/* 対数時間（ループ実装） */
fun logarithmic(n: Int): Int {
    var n1 = n
    var count = 0
    while (n1 > 1) {
        n1 /= 2
        count++
    }
    return count
}

/* 対数時間（再帰実装） */
fun logRecur(n: Int): Int {
    if (n <= 1)
        return 0
    return logRecur(n / 2) + 1
}

/* 線形対数時間 */
fun linearLogRecur(n: Int): Int {
    if (n <= 1)
        return 1
    var count = linearLogRecur(n / 2) + linearLogRecur(n / 2)
    for (i in 0..<n) {
        count++
    }
    return count
}

/* 階乗時間（再帰実装） */
fun factorialRecur(n: Int): Int {
    if (n == 0)
        return 1
    var count = 0
    // 1個から n 個に分裂
    for (i in 0..<n) {
        count += factorialRecur(n - 1)
    }
    return count
}

/* Driver Code */
fun main() {
    // n を変えて実行し、各計算量で操作回数がどう変化するかを確認できる
    val n = 8
    println("入力データサイズ n = $n")

    var count = constant(n)
    println("定数時間の操作回数 = $count")

    count = linear(n)
    println("線形時間の操作回数 = $count")
    count = arrayTraversal(IntArray(n))
    println("線形時間（配列走査）の操作回数 = $count")

    count = quadratic(n)
    println("二乗時間の操作回数 = $count")
    val nums = IntArray(n)
    for (i in 0..<n)
        nums[i] = n - i // [n,n-1,...,2,1]
    count = bubbleSort(nums)
    println("二乗時間（バブルソート）の操作回数 = $count")

    count = exponential(n)
    println("指数時間（ループ実装）の操作回数 = $count")
    count = expRecur(n)
    println("指数時間（再帰実装）の操作回数 = $count")

    count = logarithmic(n)
    println("対数時間（ループ実装）の操作回数 = $count")
    count = logRecur(n)
    println("対数階（再帰実装）の操作回数 = $count")

    count = linearLogRecur(n)
    println("線形対数階（再帰実装）の操作回数 = $count")

    count = factorialRecur(n)
    println("階乗階（再帰実装）の操作回数 = $count")
}