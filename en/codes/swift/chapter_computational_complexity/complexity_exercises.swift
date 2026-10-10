/**
 File: complexity_exercises.swift
 Created Time: 2026-08-18
 Author: Hello Algo Team
 */

/* Iterative summation */
func sumIter(n: Int) -> Int {
    var res = 0
    for i in 1 ... n {
        res += i
    }
    return res
}

/* Recursive summation */
func sumRecur(n: Int) -> Int {
    if n == 1 {
        return 1
    }
    return n + sumRecur(n: n - 1)
}

/* Linear loop */
func linearLoop(n: Int) -> Int {
    var res = 0
    for i in 0 ..< n {
        res += i
    }
    return res
}

/* Quadratic loop */
func quadraticLoop(n: Int) -> Int {
    var res = 0
    for i in 0 ..< n {
        for j in i ..< n {
            res += j
        }
    }
    return res
}

/* Logarithmic loop */
func logarithmicLoop(n: Int) -> Int {
    var n = n
    while n > 1 {
        n /= 2
    }
    return n
}

@main
enum ComplexityExercises {
    static func main() {
        assert(sumIter(n: 1) == 1 && sumRecur(n: 1) == 1)
        assert(sumIter(n: 4) == 10 && sumRecur(n: 4) == 10)
        assert(linearLoop(n: 4) == 6)
        assert(quadraticLoop(n: 4) == 20)
        assert(logarithmicLoop(n: 4) == 1 && logarithmicLoop(n: 5) == 1)
    }
}
