/**
 * File: built_in_hash.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

import utils.ListNode

/* Driver Code */
fun main() {
    // [region]{builtin_hash}
    val num = 3
    val hashNum = num.hashCode()
    println("整數 $num 的雜湊值為 $hashNum")
    // 整數 3 的雜湊值為 3

    val bol = true
    val hashBol = bol.hashCode()
    println("布林量 $bol 的雜湊值為 $hashBol")
    // 布林量 true 的雜湊值為 1231

    val dec = 3.14159
    val hashDec = dec.hashCode()
    println("小數 $dec 的雜湊值為 $hashDec")
    // 小數 3.14159 的雜湊值為 -1340954729

    val str = "Hello 演算法"
    val hashStr = str.hashCode()
    println("字串“$str”的雜湊值為 $hashStr")
    // 字串“Hello 演算法”的雜湊值為 -727081396

    val arr = arrayOf<Any>(12836, "小哈")
    val hashArr = arr.contentHashCode()
    println("陣列 ${arr.contentToString()} 的雜湊值為 $hashArr")
    // 陣列 [12836, 小哈] 的雜湊值為 1151158

    val obj = ListNode(0)
    val hashObj = obj.hashCode()
    println("節點物件 $obj 的雜湊值為 $hashObj")
    // 節點物件 utils.ListNode@1d81eb93 的雜湊值為 495053715
    // [endregion]{builtin_hash}
}