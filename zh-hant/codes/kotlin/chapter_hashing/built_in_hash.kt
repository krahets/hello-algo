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
    println("整數 $num 的雜湊值為 $hashNum")

    val bol = true
    val hashBol = bol.hashCode()
    println("布林量 $bol 的雜湊值為 $hashBol")

    val dec = 3.14159
    val hashDec = dec.hashCode()
    println("小數 $dec 的雜湊值為 $hashDec")

    val str = "Hello 演算法"
    val hashStr = str.hashCode()
    println("字串 $str 的雜湊值為 $hashStr")

    val arr = arrayOf<Any>(12836, "小哈")
    val hashTup = arr.contentHashCode()
    println("陣列 ${arr.contentToString()} 的雜湊值為 $hashTup")

    val obj = ListNode(0)
    val hashObj = obj.hashCode()
    println("節點物件 $obj 的雜湊值為 $hashObj")
}