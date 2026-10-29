/**
 * File: hash_map_open_addressing.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

/* オープンアドレス法のハッシュテーブル */
class HashMapOpenAddressing {
    private var size: Int               // キーと値のペアの数
    private var capacity: Int           // ハッシュテーブルの容量
    private val loadThres: Double       // 容量の拡張を開始する負荷率のしきい値
    private val extendRatio: Int        // 容量の拡張倍率
    private var buckets: Array<Pair?>   // バケット配列
    private val TOMBSTONE: Pair         // 削除マーカー

    /* コンストラクタ */
    init {
        size = 0
        capacity = 4
        loadThres = 2.0 / 3.0
        extendRatio = 2
        buckets = arrayOfNulls(capacity)
        TOMBSTONE = Pair(-1, "-1")
    }

    /* ハッシュ関数 */
    fun hashFunc(key: Int): Int {
        return key % capacity
    }

    /* 負荷率 */
    fun loadFactor(): Double {
        return (size / capacity).toDouble()
    }

    /* key に対応するバケットのインデックスを探索する */
    fun findBucket(key: Int): Int {
        var index = hashFunc(key)
        var firstTombstone = -1
        // 線形探索法で探索し、空のバケットに到達したら終了する
        while (buckets[index] != null) {
            // key が見つかった場合、対応するバケットのインデックスを返す
            if (buckets[index]?.key == key) {
                // それ以前に削除マーカーが見つかっていれば、そのインデックスにキーと値のペアを移す
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index]
                    buckets[index] = TOMBSTONE
                    return firstTombstone // 移動後のバケットのインデックスを返す
                }
                return index // バケットのインデックスを返す
            }
            // 最初に見つかった削除マーカーを記録する
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index
            }
            // バケットのインデックスを計算し、末尾を越えたら先頭に戻る
            index = (index + 1) % capacity
        }
        // key が存在しない場合、追加位置のインデックスを返す
        return if (firstTombstone == -1) index else firstTombstone
    }

    /* 取得操作 */
    fun get(key: Int): String? {
        // key に対応するバケットのインデックスを探索する
        val index = findBucket(key)
        // キーと値のペアが見つかった場合、対応する val を返す
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index]?._val
        }
        // キーと値のペアが存在しない場合、null を返す
        return null
    }

    /* 追加操作 */
    fun put(key: Int, _val: String) {
        // 負荷率がしきい値を超えた場合、容量を拡張する
        if (loadFactor() > loadThres) {
            extend()
        }
        // key に対応するバケットのインデックスを探索する
        val index = findBucket(key)
        // キーと値のペアが見つかった場合、val を上書きして戻る
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index]!!._val = _val
            return
        }
        // キーと値のペアが存在しない場合、そのペアを追加する
        buckets[index] = Pair(key, _val)
        size++
    }

    /* 削除操作 */
    fun remove(key: Int) {
        // key に対応するバケットのインデックスを探索する
        val index = findBucket(key)
        // キーと値のペアが見つかった場合、削除マーカーで上書きする
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE
            size--
        }
    }

    /* ハッシュテーブルの容量を拡張する */
    fun extend() {
        // 元のハッシュテーブルを一時保存する
        val bucketsTmp = buckets
        // 拡張後の新しいハッシュテーブルを初期化する
        capacity *= extendRatio
        buckets = arrayOfNulls(capacity)
        size = 0
        // キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルに移す
        for (pair in bucketsTmp) {
            if (pair != null && pair != TOMBSTONE) {
                put(pair.key, pair._val)
            }
        }
    }

    /* ハッシュテーブルを表示する */
    fun print() {
        for (pair in buckets) {
            if (pair == null) {
                println("null")
            } else if (pair == TOMBSTONE) {
                println("TOMESTOME")
            } else {
                println("${pair.key} -> ${pair._val}")
            }
        }
    }
}

/* 実行用コード */
fun main() {
    // ハッシュテーブルを初期化する
    val hashmap = HashMapOpenAddressing()

    // 追加操作
    // ハッシュテーブルにキーと値のペア (key, val) を追加する
    hashmap.put(12836, "小哈")
    hashmap.put(15937, "小啰")
    hashmap.put(16750, "小算")
    hashmap.put(13276, "小法")
    hashmap.put(10583, "小鸭")
    println("\n追加後のハッシュテーブル\nKey -> Value")
    hashmap.print()

    // 取得操作
    // ハッシュテーブルにキー key を渡し、値 val を取得する
    val name = hashmap.get(13276)
    println("\n学生番号 13276 に対応する氏名は $name")

    // 削除操作
    // ハッシュテーブルからキーと値のペア (key, val) を削除する
    hashmap.remove(16750)
    println("\n16750 を削除した後のハッシュテーブル\nKey -> Value")
    hashmap.print()
}