/**
 * File: hash_map_chaining.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

/* チェイン法によるハッシュ表 */
class HashMapChaining {
    var size: Int // キーと値のペアの数
    var capacity: Int // ハッシュ表の容量
    val loadThres: Double // 表を拡張する負荷率のしきい値
    val extendRatio: Int // 容量の拡張倍率
    var buckets: MutableList<MutableList<Pair>> // バケットの配列

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

    /* 検索 */
    fun get(key: Int): String? {
        val index = hashFunc(key)
        val bucket = buckets[index]
        // バケットを走査し、key が見つかったら対応する val を返す
        for (pair in bucket) {
            if (pair.key == key) return pair._val
        }
        // key が見つからなければ null を返す
        return null
    }

    /* 追加 */
    fun put(key: Int, _val: String) {
        // 負荷率がしきい値を超えたら表を拡張する
        if (loadFactor() > loadThres) {
            extend()
        }
        val index = hashFunc(key)
        val bucket = buckets[index]
        // バケットを走査し、指定の key が見つかったら対応する val を更新して処理を終える
        for (pair in bucket) {
            if (pair.key == key) {
                pair._val = _val
                return
            }
        }
        // key がなければ末尾にペアを追加する
        val pair = Pair(key, _val)
        bucket.add(pair)
        size++
    }

    /* 削除 */
    fun remove(key: Int) {
        val index = hashFunc(key)
        val bucket = buckets[index]
        // バケットを走査し、該当するペアを削除する
        for (pair in bucket) {
            if (pair.key == key) {
                bucket.remove(pair)
                size--
                break
            }
        }
    }

    /* ハッシュ表を拡張する */
    fun extend() {
        // 元のハッシュ表を一時保存する
        val bucketsTmp = buckets
        // 拡張後の新しいハッシュ表を初期化する
        capacity *= extendRatio
        // MutableList のサイズは可変
        buckets = mutableListOf()
        for (i in 0..<capacity) {
            buckets.add(mutableListOf())
        }
        size = 0
        // 元のハッシュ表から新しい表にペアを移す
        for (bucket in bucketsTmp) {
            for (pair in bucket) {
                put(pair.key, pair._val)
            }
        }
    }

    /* ハッシュ表を表示する */
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

/* 実行例 */
fun main() {
    /* ハッシュ表を初期化する */
    val map = HashMapChaining()

    /* 追加 */
    // ハッシュ表にペア (key, value) を追加する
    map.put(12836, "小哈")
    map.put(15937, "小啰")
    map.put(16750, "小算")
    map.put(13276, "小法")
    map.put(10583, "小鸭")
    println("\n追加後のハッシュ表\nKey -> Value")
    map.print()

    /* 検索 */
    // ハッシュ表でキー key に対応する値 value を取得する
    val name = map.get(13276)
    println("\n学籍番号 13276 に対応する名前は $name")

    /* 削除 */
    // ハッシュ表からペア (key, value) を削除する
    map.remove(12836)
    println("\n12836 を削除した後のハッシュ表\nKey -> Value")
    map.print()
}