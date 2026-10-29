/**
 * File: hash_map_chaining.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

/* チェイン法のハッシュテーブル */
class HashMapChaining {
    var size: Int // キーと値のペアの数
    var capacity: Int // ハッシュテーブルの容量
    val loadThres: Double // 容量の拡張を開始する負荷率のしきい値
    val extendRatio: Int // 容量の拡張倍率
    var buckets: MutableList<MutableList<Pair>> // バケット配列

    /* コンストラクタ */
    init {
        size = 0
        capacity = 4
        loadThres = 2.0 / 3.0
        extendRatio = 2
        buckets = mutableListOf()
        for (i in 0..<capacity) {
            buckets.add(mutableListOf())
        }
    }

    /* ハッシュ関数 */
    fun hashFunc(key: Int): Int {
        return key % capacity
    }

    /* 負荷率 */
    fun loadFactor(): Double {
        return (size / capacity).toDouble()
    }

    /* 取得操作 */
    fun get(key: Int): String? {
        val index = hashFunc(key)
        val bucket = buckets[index]
        // バケットを走査し、key が見つかったら対応する val を返す
        for (pair in bucket) {
            if (pair.key == key) return pair._val
        }
        // key が見つからなかった場合、null を返す
        return null
    }

    /* 追加操作 */
    fun put(key: Int, _val: String) {
        // 負荷率がしきい値を超えた場合、容量を拡張する
        if (loadFactor() > loadThres) {
            extend()
        }
        val index = hashFunc(key)
        val bucket = buckets[index]
        // バケットを走査し、指定された key が見つかったら、対応する val を更新して戻る
        for (pair in bucket) {
            if (pair.key == key) {
                pair._val = _val
                return
            }
        }
        // key が存在しない場合、キーと値のペアを末尾に追加する
        val pair = Pair(key, _val)
        bucket.add(pair)
        size++
    }

    /* 削除操作 */
    fun remove(key: Int) {
        val index = hashFunc(key)
        val bucket = buckets[index]
        // バケットを走査し、キーと値のペアを削除する
        for (pair in bucket) {
            if (pair.key == key) {
                bucket.remove(pair)
                size--
                break
            }
        }
    }

    /* ハッシュテーブルの容量を拡張する */
    fun extend() {
        // 元のハッシュテーブルを一時保存する
        val bucketsTmp = buckets
        // 拡張後の新しいハッシュテーブルを初期化する
        capacity *= extendRatio
        // mutablelist のサイズは固定ではない
        buckets = mutableListOf()
        for (i in 0..<capacity) {
            buckets.add(mutableListOf())
        }
        size = 0
        // キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルに移す
        for (bucket in bucketsTmp) {
            for (pair in bucket) {
                put(pair.key, pair._val)
            }
        }
    }

    /* ハッシュテーブルを表示する */
    fun print() {
        for (bucket in buckets) {
            val res = mutableListOf<String>()
            for (pair in bucket) {
                val k = pair.key
                val v = pair._val
                res.add("$k -> $v")
            }
            println(res)
        }
    }
}

/* 実行用コード */
fun main() {
    /* ハッシュテーブルを初期化する */
    val map = HashMapChaining()

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
    val name = map.get(13276)
    println("\n学生番号 13276 に対応する氏名は $name")

    /* 削除操作 */
    // ハッシュテーブルからキーと値のペア (key, value) を削除する
    map.remove(12836)
    println("\n12836 を削除した後のハッシュテーブル\nKey -> Value")
    map.print()
}