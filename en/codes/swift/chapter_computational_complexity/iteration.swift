/**
 * File: iteration.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* for loop */
func forLoop(n: Int) -> Int {
    var res = 0
    // Sum 1, 2, ..., n-1, n in a loop
    for i in 1 ... n {
        res += i
    }
    return res
}

/* while loop */
func whileLoop(n: Int) -> Int {
    var res = 0
    var i = 1 // Initialize the loop control variable
    // Sum 1, 2, ..., n-1, n in a loop
    while i <= n {
        res += i
        i += 1 // Update the loop control variable
    }
    return res
}

/* while loop (two updates) */
func whileLoopII(n: Int) -> Int {
    var res = 0
    var i = 1 // Initialize the loop control variable
    // Sum 1, 4, 10, ... in a loop
    while i <= n {
        res += i
        // Update the loop control variable
        i += 1
        i *= 2
    }
    return res
}

/* Nested for loops */
func nestedForLoop(n: Int) -> String {
    var res = ""
    // Loop over i = 1, 2, ..., n-1, n
    for i in 1 ... n {
        // Loop over j = 1, 2, ..., n-1, n
        for j in 1 ... n {
            res.append("(\(i), \(j)), ")
        }
    }
    return res
}

@main
enum Iteration {
    /* Driver code */
    static func main() {
        let n = 5
        var res = 0

        res = forLoop(n: n)
        print("\nSum from the for loop: res = \(res)")

        res = whileLoop(n: n)
        print("\nSum from the while loop: res = \(res)")

        res = whileLoopII(n: n)
        print("\nSum from the while loop (two updates): res = \(res)")

        let resStr = nestedForLoop(n: n)
        print("\nTraversal result from nested for loops: \(resStr)")
    }
}
