/**
 * File: built_in_hash.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

import utils.ListNode

/* Driver code */
fun main() {
    val num = 3
    val hashNum = num.hashCode()
    println("Integer $num has hash value $hashNum")

    val bol = true
    val hashBol = bol.hashCode()
    println("Boolean $bol has hash value $hashBol")

    val dec = 3.14159
    val hashDec = dec.hashCode()
    println("Floating-point number $dec has hash value $hashDec")

    val str = "Hello 算法"
    val hashStr = str.hashCode()
    println("String $str has hash value $hashStr")

    val arr = arrayOf<Any>(12836, "小哈")
    val hashTup = arr.contentHashCode()
    println("Array ${arr.contentToString()} has hash value $hashTup")

    val obj = ListNode(0)
    val hashObj = obj.hashCode()
    println("Node object $obj has hash value $hashObj")
}