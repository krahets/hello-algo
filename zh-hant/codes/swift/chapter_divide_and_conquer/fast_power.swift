/**
 File: fast_power.swift
 Created Time: 2026-08-18
 Author: Hello Algo Team
 */

/* 快速冪 */
func fastPow(x: Int, n: Int) -> Int {
    if n == 0 {
        return 1
    }
    let half = fastPow(x: x, n: n / 2)
    if n % 2 == 0 {
        return half * half
    }
    return half * half * x
}

@main
enum FastPower {
    static func main() {
        assert(fastPow(x: 7, n: 0) == 1)
        assert(fastPow(x: 3, n: 5) == 243)
        assert(fastPow(x: 2, n: 6) == 64)
    }
}
