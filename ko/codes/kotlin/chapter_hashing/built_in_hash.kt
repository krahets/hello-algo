/**
 * File: built_in_hash.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

import utils.ListNode

/* 실행 코드 */
fun main() {
    // [region]{builtin_hash}
    val num = 3
    val hashNum = num.hashCode()
    println("정수 $num → 해시값: $hashNum")
    // 정수 3 → 해시값: 3

    val bol = true
    val hashBol = bol.hashCode()
    println("불리언 값 $bol → 해시값: $hashBol")
    // 불리언 값 true → 해시값: 1231

    val dec = 3.14159
    val hashDec = dec.hashCode()
    println("소수 $dec → 해시값: $hashDec")
    // 소수 3.14159 → 해시값: -1340954729

    val str = "Hello 算法"
    val hashStr = str.hashCode()
    println("문자열 ‘$str’ → 해시값: $hashStr")
    // 문자열 ‘Hello 算法’ → 해시값: -727081396

    val arr = arrayOf<Any>(12836, "小哈")
    val hashArr = arr.contentHashCode()
    println("배열 ${arr.contentToString()} → 해시값: $hashArr")
    // 배열 [12836, 小哈] → 해시값: 1151158

    val obj = ListNode(0)
    val hashObj = obj.hashCode()
    println("노드 객체 $obj → 해시값: $hashObj")
    // 노드 객체 utils.ListNode@1d81eb93 → 해시값: 495053715
    // [endregion]{builtin_hash}
}