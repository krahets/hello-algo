/**
 * File: built_in_hash.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

import utils.ListNode

/* Демонстрационный код */
fun main() {
    val num = 3
    val hashNum = num.hashCode()
    println("Целое число $num имеет хеш $hashNum")

    val bol = true
    val hashBol = bol.hashCode()
    println("Логическое значение $bol имеет хеш $hashBol")

    val dec = 3.14159
    val hashDec = dec.hashCode()
    println("Вещественное число $dec имеет хеш $hashDec")

    val str = "Hello 算法"
    val hashStr = str.hashCode()
    println("Строка $str имеет хеш $hashStr")

    val arr = arrayOf<Any>(12836, "小哈")
    val hashTup = arr.contentHashCode()
    println("Массив ${arr.contentToString()} имеет хеш $hashTup")

    val obj = ListNode(0)
    val hashObj = obj.hashCode()
    println("Объект узла $obj имеет хеш $hashObj")
}