/**
 * File: hash_map_chaining.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

/* チェイン法ハッシュテーブル */
class HashMapChaining {
    var size: Int // キーと値のペア数
    var capacity: Int // ハッシュテーブル容量
    val loadThres: Double // リサイズを発動する負荷率のしきい値
    val extendRatio: Int // 拡張倍率
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

    /* 検索操作 */
    fun get(key: Int): String? {
        val index = hashFunc(key)
        val bucket = buckets[index]
        // バケットを走査し、key が見つかれば対応する val を返す
        for (pair in bucket) {
            if (pair.key == key) return pair._val
        }
        // key が見つからない場合は null を返す
        return null
    }

    /* 追加操作 */
    fun put(key: Int, _val: String) {
        // 負荷率がしきい値を超えたら、リサイズを実行
        if (loadFactor() > loadThres) {
            extend()
        }
        val index = hashFunc(key)
        val bucket = buckets[index]
        // バケットを走査し、指定した key が見つかれば対応する val を更新して返す
        for (pair in bucket) {
            if (pair.key == key) {
                pair._val = _val
                return
            }
        }
        // その key が存在しなければ、キーと値のペアを末尾に追加
        val pair = Pair(key, _val)
        bucket.add(pair)
        size++
    }

    /* 削除操作 */
    fun remove(key: Int) {
        val index = hashFunc(key)
        val bucket = buckets[index]
        // バケットを走査してキーと値のペアを削除
        for (pair in bucket) {
            if (pair.key == key) {
                bucket.remove(pair)
                size--
                break
            }
        }
    }

    /* ハッシュテーブルを拡張 */
    fun extend() {
        // 元のハッシュテーブルを一時保存
        val bucketsTmp = buckets
        // リサイズ後の新しいハッシュテーブルを初期化
        capacity *= extendRatio
        // mutablelist には固定サイズがない
        buckets = mutableListOf()
        for (i in 0..<capacity) {
            buckets.add(mutableListOf())
        }
        size = 0
        // キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルへ移す
        for (bucket in bucketsTmp) {
            for (pair in bucket) {
                put(pair.key, pair._val)
            }
        }
    }

    /* ハッシュテーブルを出力 */
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

/* Driver Code */
fun main() {
    /* ハッシュテーブルを初期化 */
    val map = HashMapChaining()

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
    val name = map.get(13276)
    println("\n学籍番号 13276 を入力すると、名前 $name が見つかりました")

    /* 削除操作 */
    // ハッシュテーブルからキーと値のペア (key, value) を削除
    map.remove(12836)
    println("\n12836 を削除した後、ハッシュテーブルは\nKey -> Value")
    map.print()
}