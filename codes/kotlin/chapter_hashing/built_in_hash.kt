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
    println("整数 $num 的哈希值为 $hashNum")
    // 整数 3 的哈希值为 3

    val bol = true
    val hashBol = bol.hashCode()
    println("布尔量 $bol 的哈希值为 $hashBol")
    // 布尔量 true 的哈希值为 1231

    val dec = 3.14159
    val hashDec = dec.hashCode()
    println("小数 $dec 的哈希值为 $hashDec")
    // 小数 3.14159 的哈希值为 -1340954729

    val str = "Hello 算法"
    val hashStr = str.hashCode()
    println("字符串“$str”的哈希值为 $hashStr")
    // 字符串“Hello 算法”的哈希值为 -727081396

    val arr = arrayOf<Any>(12836, "小哈")
    val hashArr = arr.contentHashCode()
    println("数组 ${arr.contentToString()} 的哈希值为 $hashArr")
    // 数组 [12836, 小哈] 的哈希值为 1151158

    val obj = ListNode(0)
    val hashObj = obj.hashCode()
    println("节点对象 $obj 的哈希值为 $hashObj")
    // 节点对象 utils.ListNode@1d81eb93 的哈希值为 495053715
    // [endregion]{builtin_hash}
}