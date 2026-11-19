/**
 * File: hash_map.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

import utils.printHashMap

/* 実行用コード */
fun main() {
    // [region]{init_hash_map}
    /* ハッシュテーブルを初期化する */
    val map = HashMap<Int, String>()
    // [endregion]{init_hash_map}

    // [region]{add_pairs}
    /* 追加操作 */
    // ハッシュテーブルにキーと値のペア (key, value) を追加する
    map[12836] = "小哈"
    map[15937] = "小啰"
    map[16750] = "小算"
    map[13276] = "小法"
    map[10583] = "小鸭"
    // [endregion]{add_pairs}
    println("\n追加後のハッシュテーブル\nKey -> Value")
    printHashMap(map)

    // [region]{get_value}
    /* 取得操作 */
    // ハッシュテーブルにキー key を渡し、値 value を取得する
    val name = map[15937]
    // [endregion]{get_value}
    println("\n学生番号 15937 に対応する氏名は $name")

    // [region]{remove_pair}
    /* 削除操作 */
    // ハッシュテーブルからキーと値のペア (key, value) を削除する
    map.remove(10583)
    // [endregion]{remove_pair}
    println("\n10583 を削除した後のハッシュテーブル\nKey -> Value")
    printHashMap(map)

    println("\nキーと値のペア Key->Value を走査する")
    // [region]{iterate_pairs}
    /* ハッシュテーブルを走査する */
    // キーと値のペア key->value を走査する
    for ((key, value) in map) {
        println("$key -> $value")
    }
    // [endregion]{iterate_pairs}

    println("\nキー Key だけを走査する")
    // [region]{iterate_keys}
    // キー key だけを走査する
    for (key in map.keys) {
        println(key)
    }
    // [endregion]{iterate_keys}

    println("\n値 Value だけを走査する")
    // [region]{iterate_values}
    // 値 value だけを走査する
    for (_val in map.values) {
        println(_val)
    }
    // [endregion]{iterate_values}
}