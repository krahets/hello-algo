/**
 * File: hash_map.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

import utils.printHashMap

/* 実行例 */
fun main() {
    /* ハッシュ表を初期化する */
    val map = HashMap<Int, String>()

    /* 追加 */
    // ハッシュ表にペア (key, value) を追加する
    map[12836] = "小哈"
    map[15937] = "小啰"
    map[16750] = "小算"
    map[13276] = "小法"
    map[10583] = "小鸭"
    println("\n追加後のハッシュ表\nKey -> Value")
    printHashMap(map)

    /* 検索 */
    // ハッシュ表でキー key に対応する値 value を取得する
    val name = map[15937]
    println("\n学籍番号 15937 に対応する名前は $name")

    /* 削除 */
    // ハッシュ表からペア (key, value) を削除する
    map.remove(10583)
    println("\n10583 を削除した後のハッシュ表\nKey -> Value")
    printHashMap(map)

    /* ハッシュ表を走査する */
    println("\nキーと値のペアを順に表示 Key->Value")
    for ((key, value) in map) {
        println("$key -> $value")
    }
    println("\nキーだけを順に表示 Key")
    for (key in map.keys) {
        println(key)
    }
    println("\n値だけを順に表示 Value")
    for (_val in map.values) {
        println(_val)
    }
}