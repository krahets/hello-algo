/**
 * File: built_in_hash.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

import utils.ListNode

/* Driver code */
fun main() {
    // [region]{builtin_hash}
    val num = 3
    val hashNum = num.hashCode()
    println("Integer $num has hash value $hashNum")
    // Integer 3 has hash value 3

    val bol = true
    val hashBol = bol.hashCode()
    println("Boolean $bol has hash value $hashBol")
    // Boolean true has hash value 1231

    val dec = 3.14159
    val hashDec = dec.hashCode()
    println("Floating-point number $dec has hash value $hashDec")
    // Floating-point number 3.14159 has hash value -1340954729

    val str = "Hello 算法"
    val hashStr = str.hashCode()
    println("String '$str' has hash value $hashStr")
    // String 'Hello 算法' has hash value -727081396

    val arr = arrayOf<Any>(12836, "小哈")
    val hashArr = arr.contentHashCode()
    println("Array ${arr.contentToString()} has hash value $hashArr")
    // Array [12836, 小哈] has hash value 1151158

    val obj = ListNode(0)
    val hashObj = obj.hashCode()
    println("Node object $obj has hash value $hashObj")
    // Node object utils.ListNode@1d81eb93 has hash value 495053715
    // [endregion]{builtin_hash}
}