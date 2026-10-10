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
    println("整数 $num のハッシュ値は $hashNum")

    val bol = true
    val hashBol = bol.hashCode()
    println("真偽値 $bol のハッシュ値は $hashBol")

    val dec = 3.14159
    val hashDec = dec.hashCode()
    println("小数 $dec のハッシュ値は $hashDec")

    val str = "Hello アルゴリズム"
    val hashStr = str.hashCode()
    println("文字列 $str のハッシュ値は $hashStr")

    val arr = arrayOf<Any>(12836, "シャオハー")
    val hashTup = arr.contentHashCode()
    println("配列 ${arr.contentToString()} のハッシュ値は $hashTup")

    val obj = ListNode(0)
    val hashObj = obj.hashCode()
    println("ノードオブジェクト $obj のハッシュ値は $hashObj")
}