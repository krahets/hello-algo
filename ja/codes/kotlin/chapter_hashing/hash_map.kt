/**
 * File: hash_map.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

import utils.printHashMap

/* 実行用コード */
fun main() {
    /* ハッシュテーブルを初期化する */
    val map = HashMap<Int, String>()

    /* 追加操作 */
    // ハッシュテーブルにキーと値のペア (key, value) を追加する
    map[12836] = "小哈"
    map[15937] = "小啰"
    map[16750] = "小算"
    map[13276] = "小法"
    map[10583] = "小鸭"
    println("\n追加後のハッシュテーブル\nKey -> Value")
    printHashMap(map)

    /* 取得操作 */
    // ハッシュテーブルにキー key を渡し、値 value を取得する
    val name = map[15937]
    println("\n学生番号 15937 に対応する氏名は $name")

    /* 削除操作 */
    // ハッシュテーブルからキーと値のペア (key, value) を削除する
    map.remove(10583)
    println("\n10583 を削除した後のハッシュテーブル\nKey -> Value")
    printHashMap(map)

    /* ハッシュテーブルを走査する */
    println("\nキーと値のペア Key->Value を走査する")
    for ((key, value) in map) {
        println("$key -> $value")
    }
    println("\nキー Key だけを走査する")
    for (key in map.keys) {
        println(key)
    }
    println("\n値 Value だけを走査する")
    for (_val in map.values) {
        println(_val)
    }
}