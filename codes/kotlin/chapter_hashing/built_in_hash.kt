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
    println("整数 $num 的哈希值为 $hashNum")

    val bol = true
    val hashBol = bol.hashCode()
    println("布尔量 $bol 的哈希值为 $hashBol")

    val dec = 3.14159
    val hashDec = dec.hashCode()
    println("小数 $dec 的哈希值为 $hashDec")

    val str = "Hello 算法"
    val hashStr = str.hashCode()
    println("字符串 $str 的哈希值为 $hashStr")

    val arr = arrayOf<Any>(12836, "小哈")
    val hashTup = arr.contentHashCode()
    println("数组 ${arr.contentToString()} 的哈希值为 $hashTup")

    val obj = ListNode(0)
    val hashObj = obj.hashCode()
    println("节点对象 $obj 的哈希值为 $hashObj")
}