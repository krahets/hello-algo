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
    // 迴圈次數正比於資料大小 n 的平方
    for (i in 0..<n) {
        for (j in 0..<n) {
            count++
        }
    }
    return count
}

/* 平方階（氣泡排序） */
fun bubbleSort(nums: IntArray): Int {
    var count = 0 // 計數器
    // 外層迴圈：未排序區間為 [0, i]
    for (i in nums.size - 1 downTo 1) {
        // 內層迴圈：藉由交換，將未排序區間 [0, i] 的最大元素移至最右端
        for (j in 0..<i) {
            if (nums[j] > nums[j + 1]) {
                // 交換 nums[j] 與 nums[j + 1]
                val temp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = temp
                count += 3 // 交換元素需 3 個基本操作
            }
        }
    }
    return count
}

/* 指數階（迴圈實作） */
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

/* 指數階（遞迴實作） */
fun expRecur(n: Int): Int {
    if (n == 1) {
        return 1
    }
    return expRecur(n - 1) + expRecur(n - 1) + 1
}

/* 對數階（迴圈實作） */
fun logarithmic(n: Int): Int {
    var n1 = n
    var count = 0
    while (n1 > 1) {
        n1 /= 2
        count++
    }
    return count
}

/* 對數階（遞迴實作） */
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

/* 階乘階（遞迴實作） */
fun factorialRecur(n: Int): Int {
    if (n == 0)
        return 1
    var count = 0
    // 1 個呼叫分為 n 個
    for (i in 0..<n) {
        count += factorialRecur(n - 1)
    }
    return count
}

/* 主程式 */
fun main() {
    // 試著修改 n 再執行，觀察各種複雜度的操作次數如何變化
    val n = 8
    println("輸入規模 n = $n")

    var count = constant(n)
    println("常數階的操作次數 = $count")

    count = linear(n)
    println("線性階的操作次數 = $count")
    count = arrayTraversal(IntArray(n))
    println("線性階（走訪陣列）的操作次數 = $count")

    count = quadratic(n)
    println("平方階的操作次數 = $count")
    val nums = IntArray(n)
    for (i in 0..<n)
        nums[i] = n - i // [n,n-1,...,2,1]
    count = bubbleSort(nums)
    println("平方階（氣泡排序）的操作次數 = $count")

    count = exponential(n)
    println("指數階（迴圈實作）的操作次數 = $count")
    count = expRecur(n)
    println("指數階（遞迴實作）的操作次數 = $count")

    count = logarithmic(n)
    println("對數階（迴圈實作）的操作次數 = $count")
    count = logRecur(n)
    println("對數階（遞迴實作）的操作次數 = $count")

    count = linearLogRecur(n)
    println("線性對數階（遞迴實作）的操作次數 = $count")

    count = factorialRecur(n)
    println("階乘階（遞迴實作）的操作次數 = $count")
}