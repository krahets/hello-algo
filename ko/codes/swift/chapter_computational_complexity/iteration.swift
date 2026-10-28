/**
 * File: iteration.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* for 반복문 */
func forLoop(n: Int) -> Int {
    var res = 0
    // 반복문으로 1, 2, ..., n-1, n의 합을 구한다
    for i in 1 ... n {
        res += i
    }
    return res
}

/* while 반복문 */
func whileLoop(n: Int) -> Int {
    var res = 0
    var i = 1 // 조건 변수를 초기화한다
    // 반복문으로 1, 2, ..., n-1, n의 합을 구한다
    while i <= n {
        res += i
        i += 1 // 조건 변수를 갱신한다
    }
    return res
}

/* while 반복문(두 번 갱신) */
func whileLoopII(n: Int) -> Int {
    var res = 0
    var i = 1 // 조건 변수를 초기화한다
    // 반복문으로 1, 4, 10, ...의 합을 구한다
    while i <= n {
        res += i
        // 조건 변수를 갱신한다
        i += 1
        i *= 2
    }
    return res
}

/* 이중 for 반복문 */
func nestedForLoop(n: Int) -> String {
    var res = ""
    // i = 1, 2, ..., n-1, n을 반복한다
    for i in 1 ... n {
        // j = 1, 2, ..., n-1, n을 반복한다
        for j in 1 ... n {
            res.append("(\(i), \(j)), ")
        }
    }
    return res
}

@main
enum Iteration {
    /* 실행 코드 */
    static func main() {
        let n = 5
        var res = 0

        res = forLoop(n: n)
        print("\nfor 반복문으로 구한 합 res = \(res)")

        res = whileLoop(n: n)
        print("\nwhile 반복문으로 구한 합 res = \(res)")

        res = whileLoopII(n: n)
        print("\nwhile 반복문(두 번 갱신)으로 구한 합 res = \(res)")

        let resStr = nestedForLoop(n: n)
        print("\n이중 for 반복문의 순회 결과 \(resStr)")
    }
}
