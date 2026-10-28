/**
 * File: recursion.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.recursion

import java.util.*

/* 재귀 */
fun recur(n: Int): Int {
    // 종료 조건
    if (n == 1)
        return 1
    // 내려가기: 재귀 호출
    val res = recur(n - 1)
    // 돌아오기: 결과 반환
    return n + res
}

/* 반복으로 재귀 구현 */
fun forLoopRecur(n: Int): Int {
    // 명시적인 스택을 사용하여 시스템 호출 스택을 모방한다
    val stack = Stack<Int>()
    var res = 0
    // 내려가기: 재귀 호출
    for (i in n downTo 0) {
        // 스택에 삽입하여 내려가는 과정을 모방한다
        stack.push(i)
    }
    // 돌아오기: 결과 반환
    while (stack.isNotEmpty()) {
        // 스택에서 꺼내어 돌아오는 과정을 모방한다
        res += stack.pop()
    }
    // res = 1+2+3+...+n
    return res
}

/* 꼬리 재귀 */
tailrec fun tailRecur(n: Int, res: Int): Int {
    // tailrec 키워드를 추가하여 꼬리 재귀 최적화를 활성화한다
    // 종료 조건
    if (n == 0)
        return res
    // 꼬리 재귀 호출
    return tailRecur(n - 1, res + n)
}

/* 피보나치 수열: 재귀 */
fun fib(n: Int): Int {
    // 종료 조건 f(1) = 0, f(2) = 1
    if (n == 1 || n == 2)
        return n - 1
    // 재귀 호출 f(n) = f(n-1) + f(n-2)
    val res = fib(n - 1) + fib(n - 2)
    // 결과 f(n)을 반환한다
    return res
}

/* 실행 코드 */
fun main() {
    val n = 5
    var res: Int

    res = recur(n)
    println("\n재귀 함수로 구한 합 res = $res")

    res = forLoopRecur(n)
    println("\n반복으로 재귀를 구현하여 구한 합 res = $res")

    res = tailRecur(n, 0)
    println("\n꼬리 재귀 함수로 구한 합 res = $res")

    res = fib(n)
    println("\n피보나치 수열의 항(n = $n) = $res")
}