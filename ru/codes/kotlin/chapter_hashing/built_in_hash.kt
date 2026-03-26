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
    println("Хеш-значение целого числа $num равно $hashNum")

    val bol = true
    val hashBol = bol.hashCode()
    println("Хеш-значение логического значения $bol равно $hashBol")

    val dec = 3.14159
    val hashDec = dec.hashCode()
    println("Хеш-значение десятичного числа $dec равно $hashDec")

    val str = "Hello Algo"
    val hashStr = str.hashCode()
    println("Хеш-значение строки $str равно $hashStr")

    val arr = arrayOf<Any>(12836, "Сяо Ха")
    val hashTup = arr.contentHashCode()
    println("массив ${arr.contentToString()} равно $hashTup")

    val obj = ListNode(0)
    val hashObj = obj.hashCode()
    println("объект узла $obj равно $hashObj")
}
