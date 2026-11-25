/**
 * File: max_product_cutting.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

import kotlin.math.pow

/* 탐욕 알고리즘으로 정수 분할의 최대 곱 구하기 */
fun maxProductCutting(n: Int): Int {
    // n <= 3이면 반드시 1을 하나 떼어 낸다
    if (n <= 3) {
        return 1 * (n - 1)
    }
    // 탐욕적으로 3씩 떼어 낸다. a는 3의 개수이고 b는 나머지이다
    val a = n / 3
    val b = n % 3
    if (b == 1) {
        // 나머지가 1이면 1 * 3 한 쌍을 2 * 2로 바꾼다
        return 3.0.pow((a - 1)).toInt() * 2 * 2
    }
    if (b == 2) {
        // 나머지가 2이면 그대로 둔다
        return 3.0.pow(a).toInt() * 2 * 2
    }
    // 나머지가 0이면 그대로 둔다
    return 3.0.pow(a).toInt()
}

/* 실행 예제 */
fun main() {
    val n = 58

    // 탐욕 알고리즘
    val res = maxProductCutting(n)
    println("분할한 수들의 최대 곱: $res")
}