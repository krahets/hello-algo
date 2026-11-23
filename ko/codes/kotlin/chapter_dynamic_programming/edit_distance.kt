/**
 * File: edit_distance.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.min

/* 편집 거리: 완전 탐색 */
fun editDistanceDFS(
    s: String,
    t: String,
    i: Int,
    j: Int
): Int {
    // s와 t가 모두 비어 있으면 0을 반환한다
    if (i == 0 && j == 0) return 0
    // s가 비어 있으면 t의 길이를 반환한다
    if (i == 0) return j
    // t가 비어 있으면 s의 길이를 반환한다
    if (j == 0) return i
    // 두 문자가 같으면 두 문자를 바로 건너뛴다
    if (s[i - 1] == t[j - 1]) return editDistanceDFS(s, t, i - 1, j - 1)
    // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
    val insert = editDistanceDFS(s, t, i, j - 1)
    val delete = editDistanceDFS(s, t, i - 1, j)
    val replace = editDistanceDFS(s, t, i - 1, j - 1)
    // 최소 편집 횟수를 반환한다
    return min(min(insert, delete), replace) + 1
}

/* 편집 거리: 메모이제이션을 이용한 탐색 */
fun editDistanceDFSMem(
    s: String,
    t: String,
    mem: Array<IntArray>,
    i: Int,
    j: Int
): Int {
    // s와 t가 모두 비어 있으면 0을 반환한다
    if (i == 0 && j == 0) return 0
    // s가 비어 있으면 t의 길이를 반환한다
    if (i == 0) return j
    // t가 비어 있으면 s의 길이를 반환한다
    if (j == 0) return i
    // 기록이 이미 있으면 해당 값을 바로 반환한다
    if (mem[i][j] != -1) return mem[i][j]
    // 두 문자가 같으면 두 문자를 바로 건너뛴다
    if (s[i - 1] == t[j - 1]) return editDistanceDFSMem(s, t, mem, i - 1, j - 1)
    // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
    val insert = editDistanceDFSMem(s, t, mem, i, j - 1)
    val delete = editDistanceDFSMem(s, t, mem, i - 1, j)
    val replace = editDistanceDFSMem(s, t, mem, i - 1, j - 1)
    // 최소 편집 횟수를 기록하고 반환한다
    mem[i][j] = min(min(insert, delete), replace) + 1
    return mem[i][j]
}

/* 편집 거리: 동적 계획법 */
fun editDistanceDP(s: String, t: String): Int {
    val n = s.length
    val m = t.length
    val dp = Array(n + 1) { IntArray(m + 1) }
    // 상태 전이: 첫 번째 행과 첫 번째 열
    for (i in 1..n) {
        dp[i][0] = i
    }
    for (j in 1..m) {
        dp[0][j] = j
    }
    // 상태 전이: 나머지 행과 열
    for (i in 1..n) {
        for (j in 1..m) {
            if (s[i - 1] == t[j - 1]) {
                // 두 문자가 같으면 두 문자를 바로 건너뛴다
                dp[i][j] = dp[i - 1][j - 1]
            } else {
                // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
                dp[i][j] = min(min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1
            }
        }
    }
    return dp[n][m]
}

/* 편집 거리: 공간을 최적화한 동적 계획법 */
fun editDistanceDPComp(s: String, t: String): Int {
    val n = s.length
    val m = t.length
    val dp = IntArray(m + 1)
    // 상태 전이: 첫 번째 행
    for (j in 1..m) {
        dp[j] = j
    }
    // 상태 전이: 나머지 행
    for (i in 1..n) {
        // 상태 전이: 첫 번째 열
        var leftup = dp[0] // dp[i-1, j-1]을 임시로 저장한다
        dp[0] = i
        // 상태 전이: 나머지 열
        for (j in 1..m) {
            val temp = dp[j]
            if (s[i - 1] == t[j - 1]) {
                // 두 문자가 같으면 두 문자를 바로 건너뛴다
                dp[j] = leftup
            } else {
                // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
                dp[j] = min(min(dp[j - 1], dp[j]), leftup) + 1
            }
            leftup = temp // 다음 반복의 dp[i-1, j-1]로 갱신한다
        }
    }
    return dp[m]
}

/* 실행 코드 */
fun main() {
    val s = "bag"
    val t = "pack"
    val n = s.length
    val m = t.length

    // 완전 탐색
    var res = editDistanceDFS(s, t, n, m)
    println("변경: $s → $t, 최소 편집 횟수 = $res")

    // 메모이제이션을 이용한 탐색
    val mem = Array(n + 1) { IntArray(m + 1) }
    for (row in mem)
        row.fill(-1)
    res = editDistanceDFSMem(s, t, mem, n, m)
    println("변경: $s → $t, 최소 편집 횟수 = $res")

    // 동적 계획법
    res = editDistanceDP(s, t)
    println("변경: $s → $t, 최소 편집 횟수 = $res")

    // 공간을 최적화한 동적 계획법
    res = editDistanceDPComp(s, t)
    println("변경: $s → $t, 최소 편집 횟수 = $res")
}