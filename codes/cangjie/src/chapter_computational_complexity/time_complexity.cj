/**
 * File: time_complexity.cj
 * Created Time: 2025-06-21
 * Author: jan_huber (jan_huber@163.com)
 */

package cangjie.chapter_computational_complexity

/* 常数阶 */
func constant(n: Int64): Int64 {
    var count = 0
    let size = 100000
    for (i in 0..size) {
        count++
    }
    return count
}

/* 线性阶 */
func linear(n: Int64): Int64 {
    var count = 0
    for (i in 0..n) {
        count++
    }
    return count
}

/* 线性阶（遍历数组） */
func arrayTraversal(nums: Array<Int64>): Int64 {
    var count = 0
    // 循环次数与数组长度成正比
    for (num in nums) {
        count++
    }
    return count
}

/* 平方阶 */
func quadratic(n: Int64): Int64 {
    var count = 0
    // 循环次数与数据大小 n 成平方关系
    for (i in 0..n) {
        for (j in 0..n) {
            count++
        }
    }
    return count
}

/* 平方阶（冒泡排序） */
func bubbleSort(nums: Array<Int64>): Int64 {
    var count = 0 // 计数器

    // 外循环：未排序区间为 [0, i]
    for (i in (nums.size - 1)..0 : -1) {
        // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
        for (j in 0..i) {
            if (nums[j] > nums[j + 1]) {
                // 交换 nums[j] 与 nums[j + 1]
                var tmp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = tmp
                count += 3 // 元素交换包含 3 个单元操作
            }
        }
    }
    return count
}

/* 指数阶（循环实现） */
func exponential(n: Int64) {
    var count = 0
    var base = 1
    // 细胞每轮一分为二，形成数列 1, 2, 4, 8, ..., 2^(n-1)
    for (i in 0..n) {
        for (j in 0..base) {
            count++
        }
        base *= 2
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count
}

/* 指数阶（递归实现） */
func expRecur(n: Int64): Int64 {
    if (n == 1) {
        return 1
    }
    return expRecur(n - 1) + expRecur(n - 1) + 1
}

/* 对数阶（循环实现） */
func logarithmic(n: Int64): Int64 {
    var t = n
    var count = 0
    while (t > 1) {
        t = t / 2
        count++
    }
    return count
}

/* 对数阶（递归实现） */
func logRecur(n: Int64): Int64 {
    if (n <= 1) {
        return 0
    }

    return logRecur(n / 2) + 1
}

/* 线性对数阶 */
func linearLogRecur(n: Int64): Int64 {
    if (n <= 1) {
        return 1
    }

    var count = linearLogRecur(n / 2) + linearLogRecur(n / 2)
    for (i in 0..n) {
        count++
    }
    return count
}

/* 阶乘阶（递归实现） */
func factorialRecur(n: Int64): Int64 {
    if (n == 0) {
        return 1
    }

    var count = 0
    // 从 1 个分裂出 n 个
    for (i in 0..n) {
        count += factorialRecur(n - 1)
    }
    return count
}
