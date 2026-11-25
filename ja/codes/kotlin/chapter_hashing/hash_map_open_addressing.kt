/**
 * File: hash_map_open_addressing.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

/* オープンアドレス法によるハッシュ表 */
class HashMapOpenAddressing {
    private var size: Int               // キーと値のペアの数
    private var capacity: Int           // ハッシュ表の容量
    private val loadThres: Double       // 表を拡張する負荷率のしきい値
    private val extendRatio: Int        // 容量の拡張倍率
    private var buckets: Array<Pair?>   // バケットの配列
    private val TOMBSTONE: Pair         // 削除済みマーカー

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

    /* key に対応するバケットのインデックスを探す */
    fun findBucket(key: Int): Int {
        var index = hashFunc(key)
        var firstTombstone = -1
        // 線形探索を行い、空のバケットに出会ったらループを抜ける
        while (buckets[index] != null) {
            // key が見つかったら、そのバケットのインデックスを返す
            if (buckets[index]?.key == key) {
                // それまでに削除済みマーカーが見つかっていれば、その位置にペアを移す
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index]
                    buckets[index] = TOMBSTONE
                    return firstTombstone // 移動先のバケットのインデックスを返す
                }
                return index // バケットのインデックスを返す
            }
            // 最初に見つかった削除済みマーカーの位置を記録する
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index
            }
            // 次のバケットのインデックスを計算し、末尾を越えたら先頭に戻る
            index = (index + 1) % capacity
        }
        // key がなければ挿入位置のインデックスを返す
        return if (firstTombstone == -1) index else firstTombstone
    }

    /* 検索 */
    fun get(key: Int): String? {
        // key に対応するバケットのインデックスを探す
        val index = findBucket(key)
        // ペアが見つかったら対応する val を返す
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index]?._val
        }
        // ペアがなければ null を返す
        return null
    }

    /* 追加 */
    fun put(key: Int, _val: String) {
        // 負荷率がしきい値を超えたら表を拡張する
        if (loadFactor() > loadThres) {
            extend()
        }
        // key に対応するバケットのインデックスを探す
        val index = findBucket(key)
        // ペアが見つかったら val を上書きして処理を終える
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index]!!._val = _val
            return
        }
        // ペアがなければ新しく追加する
        buckets[index] = Pair(key, _val)
        size++
    }

    /* 削除 */
    fun remove(key: Int) {
        // key に対応するバケットのインデックスを探す
        val index = findBucket(key)
        // ペアが見つかったら削除済みマーカーで置き換える
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE
            size--
        }
    }

    /* ハッシュ表を拡張する */
    fun extend() {
        // 元のハッシュ表を一時保存する
        val bucketsTmp = buckets
        // 拡張後の新しいハッシュ表を初期化する
        capacity *= extendRatio
        buckets = arrayOfNulls(capacity)
        size = 0
        // 元のハッシュ表から新しい表にペアを移す
        for (pair in bucketsTmp) {
            if (pair != null && pair != TOMBSTONE) {
                put(pair.key, pair._val)
            }
        }
    }

    /* ハッシュ表を表示する */
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

/* 実行例 */
fun main() {
    // ハッシュ表を初期化する
    val hashmap = HashMapOpenAddressing()

    // 追加
    // ハッシュ表にペア (key, val) を追加する
    hashmap.put(12836, "小哈")
    hashmap.put(15937, "小啰")
    hashmap.put(16750, "小算")
    hashmap.put(13276, "小法")
    hashmap.put(10583, "小鸭")
    println("\n追加後のハッシュ表\nKey -> Value")
    hashmap.print()

    // 検索
    // ハッシュ表でキー key に対応する値 val を取得する
    val name = hashmap.get(13276)
    println("\n学籍番号 13276 に対応する名前は $name")

    // 削除
    // ハッシュ表からペア (key, val) を削除する
    hashmap.remove(16750)
    println("\n16750 を削除した後のハッシュ表\nKey -> Value")
    hashmap.print()
}