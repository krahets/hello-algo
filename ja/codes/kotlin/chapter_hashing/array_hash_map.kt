/**
 * File: array_hash_map.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

/* キーと値の組 */
class Pair(
    var key: Int,
    var _val: String
)

/* 配列ベースのハッシュテーブル */
class ArrayHashMap {
    // 100 個のバケットを含む配列を初期化
    private val buckets = arrayOfNulls<Pair>(100)

    /* ハッシュ関数 */
    fun hashFunc(key: Int): Int {
        val index = key % 100
        return index
    }

    /* 検索操作 */
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
        // null に設定し、削除を表す
        buckets[index] = null
    }

    /* すべてのキーと値のペアを取得 */
    fun pairSet(): MutableList<Pair> {
        val pairSet = mutableListOf<Pair>()
        for (pair in buckets) {
            if (pair != null)
                pairSet.add(pair)
        }
        return pairSet
    }

    /* すべてのキーを取得 */
    fun keySet(): MutableList<Int> {
        val keySet = mutableListOf<Int>()
        for (pair in buckets) {
            if (pair != null)
                keySet.add(pair.key)
        }
        return keySet
    }

    /* すべての値を取得 */
    fun valueSet(): MutableList<String> {
        val valueSet = mutableListOf<String>()
        for (pair in buckets) {
            if (pair != null)
                valueSet.add(pair._val)
        }
        return valueSet
    }

    /* ハッシュテーブルを出力 */
    fun print() {
        for (kv in pairSet()) {
            val key = kv.key
            val _val = kv._val
            println("$key -> $_val")
        }
    }
}

/* Driver Code */
fun main() {
    /* ハッシュテーブルを初期化 */
    val map = ArrayHashMap()

    /* 追加操作 */
    // ハッシュテーブルにキーと値のペア (key, value) を追加
    map.put(12836, "シャオハー")
    map.put(15937, "シャオルオ")
    map.put(16750, "シャオスワン")
    map.put(13276, "シャオファー")
    map.put(10583, "シャオヤ")
    println("\n追加完了後、ハッシュテーブルは\nKey -> Value")
    map.print()

    /* 検索操作 */
    // キー key をハッシュテーブルに渡し、値 value を取得
    val name = map.get(15937)
    println("\n学籍番号 15937 を入力すると、名前 $name が見つかりました")

    /* 削除操作 */
    // ハッシュテーブルからキーと値のペア (key, value) を削除
    map.remove(10583)
    println("\n10583 を削除した後、ハッシュテーブルは\nKey -> Value")
    map.print()

    /* ハッシュテーブルを走査 */
    println("\nキーと値のペアを走査 Key -> Value")
    for (kv in map.pairSet()) {
        println("${kv.key} -> ${kv._val}")
    }
    println("\nキー Key を個別に走査")
    for (key in map.keySet()) {
        println(key)
    }
    println("\n値 Value を個別に走査")
    for (_val in map.valueSet()) {
        println(_val)
    }
}