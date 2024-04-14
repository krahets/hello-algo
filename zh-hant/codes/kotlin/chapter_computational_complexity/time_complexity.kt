/**
 * File: time_complexity.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.time_complexity

/* 常數階 */
fun constant(n: Int): Int {
    var count = 0
    val size = 100000
    for (i in 0..<size)
        count++
    return count
}

/* 線性階 */
fun linear(n: Int): Int {
    var count = 0
    for (i in 0..<n)
        count++
    return count
}

/* 線性階（走訪陣列） */
fun arrayTraversal(nums: IntArray): Int {
    var count = 0
    // 迴圈次數與陣列長度成正比
    for (num in nums) {
        count++
    }
    return count
}

/* 平方階 */
fun quadratic(n: Int): Int {
    var count = 0
    // 迴圈次數與資料大小 n 成平方關係
    for (i in 0..<n) {
        for (j in 0..<n) {
            count++
        }
    }
    return count
}

/* 平方階（泡沫排序） */
fun bubbleSort(nums: IntArray): Int {
    var count = 0 // 計數器
    // 外迴圈：未排序區間為 [0, i]
    for (i in nums.size - 1 downTo 1) {
        // 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
        for (j in 0..<i) {
            if (nums[j] > nums[j + 1]) {
                // 交換 nums[j] 與 nums[j + 1]
                val temp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = temp
                count += 3 // 元素交換包含 3 個單元操作
            }
        }
    }
    return count
}

/* 指數階（迴圈實現） */
fun exponential(n: Int): Int {
    var count = 0
    var base = 1
    // 細胞每輪一分為二，形成數列 1, 2, 4, 8, ..., 2^(n-1)
    for (i in 0..<n) {
        for (j in 0..<base) {
            count++
        }
        base *= 2
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count
}

/* 指數階（遞迴實現） */
fun expRecur(n: Int): Int {
    if (n == 1) {
        return 1
    }
    return expRecur(n - 1) + expRecur(n - 1) + 1
}

/* 對數階（迴圈實現） */
fun logarithmic(n: Int): Int {
    var n1 = n
    var count = 0
    while (n1 > 1) {
        n1 /= 2
        count++
    }
    return count
}

/* 對數階（遞迴實現） */
fun logRecur(n: Int): Int {
    if (n <= 1)
        return 0
    return logRecur(n / 2) + 1
}

/* 線性對數階 */
fun linearLogRecur(n: Int): Int {
    if (n <= 1)
        return 1
    var count = linearLogRecur(n / 2) + linearLogRecur(n / 2)
    for (i in 0..<n) {
        count++
    }
    return count
}

/* 階乘階（遞迴實現） */
fun factorialRecur(n: Int): Int {
    if (n == 0)
        return 1
    var count = 0
    // 從 1 個分裂出 n 個
    for (i in 0..<n) {
        count += factorialRecur(n - 1)
    }
    return count
}

/* Driver Code */
fun main() {
    // 可以修改 n 執行，體會一下各種複雜度的操作數量變化趨勢
    val n = 8
    println("輸入資料大小 n = $n")

    var count = constant(n)
    println("常數階的操作數量 = $count")

    count = linear(n)
    println("線性階的操作數量 = $count")
    count = arrayTraversal(IntArray(n))
    println("線性階（走訪陣列）的操作數量 = $count")

    count = quadratic(n)
    println("平方階的操作數量 = $count")
    val nums = IntArray(n)
    for (i in 0..<n)
        nums[i] = n - i // [n,n-1,...,2,1]
    count = bubbleSort(nums)
    println("平方階（泡沫排序）的操作數量 = $count")

    count = exponential(n)
    println("指數階（迴圈實現）的操作數量 = $count")
    count = expRecur(n)
    println("指數階（遞迴實現）的操作數量 = $count")

    count = logarithmic(n)
    println("對數階（迴圈實現）的操作數量 = $count")
    count = logRecur(n)
    println("對數階（遞迴實現）的操作數量 = $count")

    count = linearLogRecur(n)
    println("線性對數階（遞迴實現）的操作數量 = $count")

    count = factorialRecur(n)
    println("階乘階（遞迴實現）的操作數量 = $count")
}