/**
 * File: time_complexity.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.time_complexity

/* 常数阶 */
fun constant(n: Int): Int {
    var count = 0
    val size = 100000
    for (i in 0..<size)
        count++
    return count
}

/* 线性阶 */
fun linear(n: Int): Int {
    var count = 0
    for (i in 0..<n)
        count++
    return count
}

/* 线性阶（遍历数组） */
fun arrayTraversal(nums: IntArray): Int {
    var count = 0
    // 循环次数与数组长度成正比
    for (num in nums) {
        count++
    }
    return count
}

/* 平方阶 */
fun quadratic(n: Int): Int {
    var count = 0
    // 循环次数与数据大小 n 成平方关系
    for (i in 0..<n) {
        for (j in 0..<n) {
            count++
        }
    }
    return count
}

/* 平方阶（冒泡排序） */
fun bubbleSort(nums: IntArray): Int {
    var count = 0 // 计数器
    // 外循环：未排序区间为 [0, i]
    for (i in nums.size - 1 downTo 1) {
        // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
        for (j in 0..<i) {
            if (nums[j] > nums[j + 1]) {
                // 交换 nums[j] 与 nums[j + 1]
                val temp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = temp
                count += 3 // 元素交换包含 3 个单元操作
            }
        }
    }
    return count
}

/* 指数阶（循环实现） */
fun exponential(n: Int): Int {
    var count = 0
    var base = 1
    // 细胞每轮一分为二，形成数列 1, 2, 4, 8, ..., 2^(n-1)
    for (i in 0..<n) {
        for (j in 0..<base) {
            count++
        }
        base *= 2
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count
}

/* 指数阶（递归实现） */
fun expRecur(n: Int): Int {
    if (n == 1) {
        return 1
    }
    return expRecur(n - 1) + expRecur(n - 1) + 1
}

/* 对数阶（循环实现） */
fun logarithmic(n: Int): Int {
    var n1 = n
    var count = 0
    while (n1 > 1) {
        n1 /= 2
        count++
    }
    return count
}

/* 对数阶（递归实现） */
fun logRecur(n: Int): Int {
    if (n <= 1)
        return 0
    return logRecur(n / 2) + 1
}

/* 线性对数阶 */
fun linearLogRecur(n: Int): Int {
    if (n <= 1)
        return 1
    var count = linearLogRecur(n / 2) + linearLogRecur(n / 2)
    for (i in 0..<n) {
        count++
    }
    return count
}

/* 阶乘阶（递归实现） */
fun factorialRecur(n: Int): Int {
    if (n == 0)
        return 1
    var count = 0
    // 从 1 个分裂出 n 个
    for (i in 0..<n) {
        count += factorialRecur(n - 1)
    }
    return count
}

/* Driver Code */
fun main() {
    // 可以修改 n 运行，体会一下各种复杂度的操作数量变化趋势
    val n = 8
    println("输入数据大小 n = $n")

    var count = constant(n)
    println("常数阶的操作数量 = $count")

    count = linear(n)
    println("线性阶的操作数量 = $count")
    count = arrayTraversal(IntArray(n))
    println("线性阶（遍历数组）的操作数量 = $count")

    count = quadratic(n)
    println("平方阶的操作数量 = $count")
    val nums = IntArray(n)
    for (i in 0..<n)
        nums[i] = n - i // [n,n-1,...,2,1]
    count = bubbleSort(nums)
    println("平方阶（冒泡排序）的操作数量 = $count")

    count = exponential(n)
    println("指数阶（循环实现）的操作数量 = $count")
    count = expRecur(n)
    println("指数阶（递归实现）的操作数量 = $count")

    count = logarithmic(n)
    println("对数阶（循环实现）的操作数量 = $count")
    count = logRecur(n)
    println("对数阶（递归实现）的操作数量 = $count")

    count = linearLogRecur(n)
    println("线性对数阶（递归实现）的操作数量 = $count")

    count = factorialRecur(n)
    println("阶乘阶（递归实现）的操作数量 = $count")
}