/**
 * File: iteration.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* for 循环 */
func forLoop(n: Int) -> Int {
    var res = 0
    // 循环求和 1, 2, ..., n-1, n
    for i in 1 ... n {
        res += i
    }
    return res
}

/* while 循环 */
func whileLoop(n: Int) -> Int {
    var res = 0
    var i = 1 // 初始化条件变量
    // 循环求和 1, 2, ..., n-1, n
    while i <= n {
        res += i
        i += 1 // 更新条件变量
    }
    return res
}

/* while 循环（两次更新） */
func whileLoopII(n: Int) -> Int {
    var res = 0
    var i = 1 // 初始化条件变量
    // 循环求和 1, 4, 10, ...
    while i <= n {
        res += i
        // 更新条件变量
        i += 1
        i *= 2
    }
    return res
}

/* 双层 for 循环 */
func nestedForLoop(n: Int) -> String {
    var res = ""
    // 循环 i = 1, 2, ..., n-1, n
    for i in 1 ... n {
        // 循环 j = 1, 2, ..., n-1, n
        for j in 1 ... n {
            res.append("(\(i), \(j)), ")
        }
    }
    return res
}

@main
enum Iteration {
    /* Driver Code */
    static func main() {
        let n = 5
        var res = 0

        res = forLoop(n: n)
        print("\nfor 循环的求和结果 res = \(res)")

        res = whileLoop(n: n)
        print("\nwhile 循环的求和结果 res = \(res)")

        res = whileLoopII(n: n)
        print("\nwhile 循环（两次更新）求和结果 res = \(res)")

        let resStr = nestedForLoop(n: n)
        print("\n双层 for 循环的遍历结果 \(resStr)")
    }
}
