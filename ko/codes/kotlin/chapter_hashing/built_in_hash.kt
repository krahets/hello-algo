/**
 * File: built_in_hash.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

import utils.ListNode

/* 실행 코드 */
fun main() {
    val num = 3
    val hashNum = num.hashCode()
    println("정수 = $num, 해시값 = $hashNum")

    val bol = true
    val hashBol = bol.hashCode()
    println("불리언 값 = $bol, 해시값 = $hashBol")

    val dec = 3.14159
    val hashDec = dec.hashCode()
    println("소수 = $dec, 해시값 = $hashDec")

    val str = "Hello 算法"
    val hashStr = str.hashCode()
    println("문자열 = $str, 해시값 = $hashStr")

    val arr = arrayOf<Any>(12836, "小哈")
    val hashTup = arr.contentHashCode()
    println("배열 = ${arr.contentToString()}, 해시값 = $hashTup")

    val obj = ListNode(0)
    val hashObj = obj.hashCode()
    println("노드 객체 = $obj, 해시값 = $hashObj")
}