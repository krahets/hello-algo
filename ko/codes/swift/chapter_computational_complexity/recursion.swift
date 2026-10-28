/**
 * File: recursion.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 재귀 */
func recur(n: Int) -> Int {
    // 종료 조건
    if n == 1 {
        return 1
    }
    // 내려가기: 재귀 호출
    let res = recur(n: n - 1)
    // 돌아오기: 결과 반환
    return n + res
}

/* 반복으로 재귀 구현 */
func forLoopRecur(n: Int) -> Int {
    // 명시적인 스택을 사용하여 시스템 호출 스택을 모방한다
    var stack: [Int] = []
    var res = 0
    // 내려가기: 재귀 호출
    for i in (1 ... n).reversed() {
        // 스택에 삽입하여 내려가는 과정을 모방한다
        stack.append(i)
    }
    // 돌아오기: 결과 반환
    while !stack.isEmpty {
        // 스택에서 꺼내어 돌아오는 과정을 모방한다
        res += stack.removeLast()
    }
    // res = 1+2+3+...+n
    return res
}

/* 꼬리 재귀 */
func tailRecur(n: Int, res: Int) -> Int {
    // 종료 조건
    if n == 0 {
        return res
    }
    // 꼬리 재귀 호출
    return tailRecur(n: n - 1, res: res + n)
}

/* 피보나치 수열: 재귀 */
func fib(n: Int) -> Int {
    // 종료 조건 f(1) = 0, f(2) = 1
    if n == 1 || n == 2 {
        return n - 1
    }
    // 재귀 호출 f(n) = f(n-1) + f(n-2)
    let res = fib(n: n - 1) + fib(n: n - 2)
    // 결과 f(n)을 반환한다
    return res
}

@main
enum Recursion {
    /* 실행 코드 */
    static func main() {
        let n = 5
        var res = 0

        res = recursion.recur(n: n)
        print("\n재귀 함수로 구한 합 res = \(res)")

        res = recursion.forLoopRecur(n: n)
        print("\n반복으로 재귀를 구현하여 구한 합 res = \(res)")

        res = recursion.tailRecur(n: n, res: 0)
        print("\n꼬리 재귀 함수로 구한 합 res = \(res)")

        res = recursion.fib(n: n)
        print("\n피보나치 수열의 \(n)번째 항 = \(res)")
    }
}
