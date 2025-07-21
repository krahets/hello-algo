/**
 * File: iteration.cj
 * Created Time: 2025-06-21
 * Author: jan_huber (jan_huber@163.com)
 */

package cangjie.chapter_computational_complexity

/* for 循环 */
func forLoop(n: Int64): Int64 {
    var res = 0
    // 循环求和 1, 2, ..., n-1, n
    for (i in 1..=n) {
        res += i
    }
    return res
}

/* while 循环 */
func whileLoop(n: Int64): Int64 {
    var res = 0
    var i = 1 // 初始化条件变量

    // 循环求和 1, 2, ..., n-1, n
    while (i <= n) {
        res += i
        i++ // 更新条件变量
    }
    return res
}

/* while 循环（两次更新） */
func whileLoopII(n: Int64): Int64 {
    var res = 0
    var i = 1 // 初始化条件变量

    // 循环求和 1, 4, 10, ...
    while (i <= n) {
        res += i
        i++ // 更新条件变量
        i *= 2
    }
    return res
}

/* 双层 for 循环 */
func nestedForLoop(n: Int64): String {
    let res = StringBuilder()
    // 循环 i = 1, 2, ..., n-1, n
    for (i in 1..=n) {
        // 循环 j = 1, 2, ..., n-1, n
        for (j in 1..=n) {
            res.append("(${i},${j}),")
        }
    }
    return res.toString()
}
