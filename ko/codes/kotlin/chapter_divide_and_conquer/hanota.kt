/**
 * File: hanota.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_divide_and_conquer.hanota

/* 원판 하나 이동 */
fun move(src: MutableList<Int>, tar: MutableList<Int>) {
    // src의 맨 위에서 원판 하나를 꺼낸다
    val pan = src.removeAt(src.size - 1)
    // 원판을 tar의 맨 위에 놓는다
    tar.add(pan)
}

/* 하노이의 탑 문제 f(i) 풀기 */
fun dfs(i: Int, src: MutableList<Int>, buf: MutableList<Int>, tar: MutableList<Int>) {
    // src에 원판이 하나만 남아 있으면 바로 tar로 옮긴다
    if (i == 1) {
        move(src, tar)
        return
    }
    // 부분 문제 f(i-1): tar를 이용하여 src의 맨 위 원판 i-1개를 buf로 옮긴다
    dfs(i - 1, src, tar, buf)
    // 부분 문제 f(1): src에 남은 원판 하나를 tar로 옮긴다
    move(src, tar)
    // 부분 문제 f(i-1): src를 이용하여 buf의 맨 위 원판 i-1개를 tar로 옮긴다
    dfs(i - 1, buf, src, tar)
}

/* 하노이의 탑 문제 풀기 */
fun solveHanota(A: MutableList<Int>, B: MutableList<Int>, C: MutableList<Int>) {
    val n = A.size
    // B를 이용하여 A의 맨 위 원판 n개를 C로 옮긴다
    dfs(n, A, B, C)
}

/* 실행 코드 */
fun main() {
    // 리스트의 맨 뒤가 기둥의 맨 위이다
    val A = mutableListOf(5, 4, 3, 2, 1)
    val B = mutableListOf<Int>()
    val C = mutableListOf<Int>()
    println("초기 상태:")
    println("A = $A")
    println("B = $B")
    println("C = $C")

    solveHanota(A, B, C)

    println("원판 이동을 마친 후:")
    println("A = $A")
    println("B = $B")
    println("C = $C")
}