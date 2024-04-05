/**
 * File: iteration.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* for 迴圈 */
func forLoop(n: Int) -> Int {
    var res = 0
    // 迴圈求和 1, 2, ..., n-1, n
    for i in 1 ... n {
        res += i
    }
    return res
}

/* while 迴圈 */
func whileLoop(n: Int) -> Int {
    var res = 0
    var i = 1 // 初始化條件變數
    // 迴圈求和 1, 2, ..., n-1, n
    while i <= n {
        res += i
        i += 1 // 更新條件變數
    }
    return res
}

/* while 迴圈（兩次更新） */
func whileLoopII(n: Int) -> Int {
    var res = 0
    var i = 1 // 初始化條件變數
    // 迴圈求和 1, 4, 10, ...
    while i <= n {
        res += i
        // 更新條件變數
        i += 1
        i *= 2
    }
    return res
}

/* 雙層 for 迴圈 */
func nestedForLoop(n: Int) -> String {
    var res = ""
    // 迴圈 i = 1, 2, ..., n-1, n
    for i in 1 ... n {
        // 迴圈 j = 1, 2, ..., n-1, n
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
        print("\nfor 迴圈的求和結果 res = \(res)")

        res = whileLoop(n: n)
        print("\nwhile 迴圈的求和結果 res = \(res)")

        res = whileLoopII(n: n)
        print("\nwhile 迴圈（兩次更新）求和結果 res = \(res)")

        let resStr = nestedForLoop(n: n)
        print("\n雙層 for 迴圈的走訪結果 \(resStr)")
    }
}
