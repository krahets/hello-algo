/**
 * File: array_hash_map.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

/* キーと値のペア */
class Pair(
    var key: Int,
    var _val: String
)

/* 配列で実装したハッシュテーブル */
class ArrayHashMap {
    // 100 個のバケットを含む配列を初期化する
    private val buckets = arrayOfNulls<Pair>(100)

    /* ハッシュ関数 */
    fun hashFunc(key: Int): Int {
        val index = key % 100
        return index
    }

    /* 取得操作 */
    fun get(key: Int): String? {
        val index = hashFunc(key)
        val pair = buckets[index] ?: return null
        return pair._val
    }

    /* 追加操作 */
    fun put(key: Int, _val: String) {
        val pair = Pair(key, _val)
        val index = hashFunc(key)
        buckets[index] = pair
    }

    /* 削除操作 */
    fun remove(key: Int) {
        val index = hashFunc(key)
        // null に設定して、削除を表す
        buckets[index] = null
    }

    /* キーと値のペアをすべて取得する */
    fun pairSet(): MutableList<Pair> {
        val pairSet = mutableListOf<Pair>()
        for (pair in buckets) {
            if (pair != null)
                pairSet.add(pair)
        }
        return pairSet
    }

    /* すべてのキーを取得する */
    fun keySet(): MutableList<Int> {
        val keySet = mutableListOf<Int>()
        for (pair in buckets) {
            if (pair != null)
                keySet.add(pair.key)
        }
        return keySet
    }

    /* すべての値を取得する */
    fun valueSet(): MutableList<String> {
        val valueSet = mutableListOf<String>()
        for (pair in buckets) {
            if (pair != null)
                valueSet.add(pair._val)
        }
        return valueSet
    }

    /* ハッシュテーブルを表示する */
    fun print() {
        for (kv in pairSet()) {
            val key = kv.key
            val _val = kv._val
            println("$key -> $_val")
        }
    }
}

/* 実行用コード */
fun main() {
    /* ハッシュテーブルを初期化する */
    val map = ArrayHashMap()

    /* 追加操作 */
    // ハッシュテーブルにキーと値のペア (key, value) を追加する
    map.put(12836, "小哈")
    map.put(15937, "小啰")
    map.put(16750, "小算")
    map.put(13276, "小法")
    map.put(10583, "小鸭")
    println("\n追加後のハッシュテーブル\nKey -> Value")
    map.print()

    /* 取得操作 */
    // ハッシュテーブルにキー key を渡し、値 value を取得する
    val name = map.get(15937)
    println("\n学生番号 15937 に対応する氏名は $name")

    /* 削除操作 */
    // ハッシュテーブルからキーと値のペア (key, value) を削除する
    map.remove(10583)
    println("\n10583 を削除した後のハッシュテーブル\nKey -> Value")
    map.print()

    /* ハッシュテーブルを走査する */
    println("\nキーと値のペア Key -> Value を走査する")
    for (kv in map.pairSet()) {
        println("${kv.key} -> ${kv._val}")
    }
    println("\nキー Key だけを走査する")
    for (key in map.keySet()) {
        println(key)
    }
    println("\n値 Value だけを走査する")
    for (_val in map.valueSet()) {
        println(_val)
    }
}