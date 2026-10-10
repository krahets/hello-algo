/**
 * File: iteration.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* for loop */
func forLoop(n: Int) -> Int {
    var res = 0
    // Sum 1, 2, ..., n-1, n
    for i in 1 ... n {
        res += i
    }
    return res
}

/* while loop */
func whileLoop(n: Int) -> Int {
    var res = 0
    var i = 1 // Initialize condition variable
    // Sum 1, 2, ..., n-1, n
    while i <= n {
        res += i
        i += 1 // Update condition variable
    }
    return res
}

/* while loop (two updates) */
func whileLoopII(n: Int) -> Int {
    var res = 0
    var i = 1 // Initialize condition variable
    // Sum 1, 4, 10, ...
    while i <= n {
        res += i
        // Update condition variable
        i += 1
        i *= 2
    }
    return res
}

/* Nested for loop */
func nestedForLoop(n: Int) -> String {
    var res = ""
    // Loop i = 1, 2, ..., n-1, n
    for i in 1 ... n {
        // Loop j = 1, 2, ..., n-1, n
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
        print("\nFor loop sum result res = \(res)")

        res = whileLoop(n: n)
        print("\nWhile loop sum result res = \(res)")

        res = whileLoopII(n: n)
        print("\nWhile loop (two updates) sum result res = \(res)")

        let resStr = nestedForLoop(n: n)
        print("\nNested for loop traversal result \(resStr)")
    }
}
