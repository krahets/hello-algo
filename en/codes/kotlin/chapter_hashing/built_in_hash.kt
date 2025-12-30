/**
 * File: built_in_hash.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

import utils.ListNode

/* Driver Code */
fun main() {
    val num = 3
    val hashNum = num.hashCode()
    println("Hash value of integer $num is $hashNum")

    val bol = true
    val hashBol = bol.hashCode()
    println("Hash value of boolean $bol is $hashBol")

    val dec = 3.14159
    val hashDec = dec.hashCode()
    println("Hash value of decimal $dec is $hashDec")

    val str = "Hello Algo"
    val hashStr = str.hashCode()
    println("Hash value of string $str is $hashStr")

    val arr = arrayOf<Any>(12836, "Xiao Ha")
    val hashTup = arr.contentHashCode()
    println("Hash value of array ${arr.contentToString()} is $hashTup")

    val obj = ListNode(0)
    val hashObj = obj.hashCode()
    println("Hash value of node object $obj is $hashObj")
}