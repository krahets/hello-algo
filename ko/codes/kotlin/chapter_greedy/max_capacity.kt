/**
 * File: max_capacity.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

import kotlin.math.max
import kotlin.math.min

/* 최대 용량: 탐욕 */
fun maxCapacity(ht: IntArray): Int {
    // i와 j가 각각 배열의 양 끝을 가리키도록 초기화한다
    var i = 0
    var j = ht.size - 1
    // 최대 용량의 초깃값은 0이다
    var res = 0
    // 두 칸막이가 만날 때까지 탐욕적 선택을 반복한다
    while (i < j) {
        // 최대 용량을 갱신한다
        val cap = min(ht[i], ht[j]) * (j - i)
        res = max(res, cap)
        // 낮은 칸막이를 안쪽으로 이동한다
        if (ht[i] < ht[j]) {
            i++
        } else {
            j--
        }
    }
    return res
}

/* 실행 코드 */
fun main() {
    val ht = intArrayOf(3, 8, 5, 2, 7, 7, 3, 4)

    // 탐욕 알고리즘
    val res = maxCapacity(ht)
    println("최대 용량 = $res")
}