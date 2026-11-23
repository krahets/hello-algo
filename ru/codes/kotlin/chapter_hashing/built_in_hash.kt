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
    println("Хеш-значение целого числа $num = $hashNum")

    val bol = true
    val hashBol = bol.hashCode()
    println("Хеш-значение булева значения $bol = $hashBol")

    val dec = 3.14159
    val hashDec = dec.hashCode()
    println("Хеш-значение десятичного числа $dec = $hashDec")

    val str = "Hello Algo"
    val hashStr = str.hashCode()
    println("Хеш-значение строки $str = $hashStr")

    val arr = arrayOf<Any>(12836, "Сяо Ха")
    val hashTup = arr.contentHashCode()
    println("Хеш-значение массива ${arr.contentToString()} = $hashTup")

    val obj = ListNode(0)
    val hashObj = obj.hashCode()
    println("Хеш-значение объекта узла $obj = $hashObj")
}