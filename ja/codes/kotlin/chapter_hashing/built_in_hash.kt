/**
 * File: built_in_hash.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

import utils.ListNode

/* 実行用コード */
fun main() {
    // [region]{builtin_hash}
    val num = 3
    val hashNum = num.hashCode()
    println("整数 $num のハッシュ値は $hashNum")
    // 整数 3 のハッシュ値は 3

    val bol = true
    val hashBol = bol.hashCode()
    println("真偽値 $bol のハッシュ値は $hashBol")
    // 真偽値 true のハッシュ値は 1231

    val dec = 3.14159
    val hashDec = dec.hashCode()
    println("小数 $dec のハッシュ値は $hashDec")
    // 小数 3.14159 のハッシュ値は -1340954729

    val str = "Hello 算法"
    val hashStr = str.hashCode()
    println("文字列「$str」のハッシュ値は $hashStr")
    // 文字列「Hello 算法」のハッシュ値は -727081396

    val arr = arrayOf<Any>(12836, "小哈")
    val hashArr = arr.contentHashCode()
    println("配列 ${arr.contentToString()} のハッシュ値は $hashArr")
    // 配列 [12836, 小哈] のハッシュ値は 1151158

    val obj = ListNode(0)
    val hashObj = obj.hashCode()
    println("ノードオブジェクト $obj のハッシュ値は $hashObj")
    // ノードオブジェクト utils.ListNode@1d81eb93 のハッシュ値は 495053715
    // [endregion]{builtin_hash}
}