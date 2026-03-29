/**
 * File: hash_map.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

import utils.printHashMap

/* Driver Code */
fun main() {
    /* ハッシュテーブルを初期化 */
    val map = HashMap<Int, String>()

    /* 追加操作 */
    // ハッシュテーブルにキーと値のペア (key, value) を追加
    map[12836] = "シャオハー"
    map[15937] = "シャオルオ"
    map[16750] = "シャオスワン"
    map[13276] = "シャオファー"
    map[10583] = "シャオヤ"
    println("\n追加完了後、ハッシュテーブルは\nKey -> Value")
    printHashMap(map)

    /* 検索操作 */
    // キー key をハッシュテーブルに渡し、値 value を取得
    val name = map[15937]
    println("\n学籍番号 15937 を入力すると、名前 $name が見つかりました")

    /* 削除操作 */
    // ハッシュテーブルからキーと値のペア (key, value) を削除
    map.remove(10583)
    println("\n10583 を削除した後、ハッシュテーブルは\nKey -> Value")
    printHashMap(map)

    /* ハッシュテーブルを走査 */
    println("\nキーと値のペアを走査 Key->Value")
    for ((key, value) in map) {
        println("$key -> $value")
    }
    println("\nキー Key を個別に走査")
    for (key in map.keys) {
        println(key)
    }
    println("\n値 Value を個別に走査")
    for (_val in map.values) {
        println(_val)
    }
}