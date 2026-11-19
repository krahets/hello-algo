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
    println("Хеш-значение целого числа $num = $hashNum")
    // Хеш-значение целого числа 3 = 3

    val bol = true
    val hashBol = bol.hashCode()
    println("Хеш-значение булева значения $bol = $hashBol")
    // Хеш-значение булева значения true = 1231

    val dec = 3.14159
    val hashDec = dec.hashCode()
    println("Хеш-значение десятичного числа $dec = $hashDec")
    // Хеш-значение десятичного числа 3.14159 = -1340954729

    val str = "Hello Algo"
    val hashStr = str.hashCode()
    println("Хеш-значение строки «$str» = $hashStr")
    // Хеш-значение строки «Hello Algo» = 387159329

    val arr = arrayOf<Any>(12836, "Сяо Ха")
    val hashArr = arr.contentHashCode()
    println("Хеш-значение массива ${arr.contentToString()} = $hashArr")
    // Хеш-значение массива [12836, Сяо Ха] = 1247701816

    val obj = ListNode(0)
    val hashObj = obj.hashCode()
    println("Хеш-значение объекта узла $obj = $hashObj")
    // Хеш-значение объекта узла utils.ListNode@1d81eb93 = 495053715
    // [endregion]{builtin_hash}
}