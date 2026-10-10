/**
 * File: hash_map_open_addressing.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

/* オープンアドレス法ハッシュテーブル */
class HashMapOpenAddressing {
    private var size: Int               // キーと値のペア数
    private var capacity: Int           // ハッシュテーブル容量
    private val loadThres: Double       // リサイズを発動する負荷率のしきい値
    private val extendRatio: Int        // 拡張倍率
    private var buckets: Array<Pair?>   // バケット配列
    private val TOMBSTONE: Pair         // 削除済みマーク

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

    /* key に対応するバケットインデックスを探す */
    fun findBucket(key: Int): Int {
        var index = hashFunc(key)
        var firstTombstone = -1
        // 線形プロービングを行い、空バケットに達したら終了
        while (buckets[index] != null) {
            // key が見つかったら、対応するバケットのインデックスを返す
            if (buckets[index]?.key == key) {
                // 以前に削除マークが見つかっていれば、そのインデックスへキーと値のペアを移動
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index]
                    buckets[index] = TOMBSTONE
                    return firstTombstone // 移動後のバケットインデックスを返す
                }
                return index // バケットのインデックスを返す
            }
            // 最初に見つかった削除マークを記録
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index
            }
            // バケットのインデックスを計算し、末尾を越えたら先頭に戻る
            index = (index + 1) % capacity
        }
        // key が存在しない場合は追加位置のインデックスを返す
        return if (firstTombstone == -1) index else firstTombstone
    }

    /* 検索操作 */
    fun get(key: Int): String? {
        // key に対応するバケットインデックスを探す
        val index = findBucket(key)
        // キーと値の組が見つかったら、対応する val を返す
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index]?._val
        }
        // キーと値の組が存在しなければ null を返す
        return null
    }

    /* 追加操作 */
    fun put(key: Int, _val: String) {
        // 負荷率がしきい値を超えたら、リサイズを実行
        if (loadFactor() > loadThres) {
            extend()
        }
        // key に対応するバケットインデックスを探す
        val index = findBucket(key)
        // キーと値の組が見つかったら、val を上書きして返す
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index]!!._val = _val
            return
        }
        // キーと値の組が存在しない場合は、その組を追加する
        buckets[index] = Pair(key, _val)
        size++
    }

    /* 削除操作 */
    fun remove(key: Int) {
        // key に対応するバケットインデックスを探す
        val index = findBucket(key)
        // キーと値の組が見つかったら、削除マーカーで上書きする
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE
            size--
        }
    }

    /* ハッシュテーブルを拡張 */
    fun extend() {
        // 元のハッシュテーブルを一時保存
        val bucketsTmp = buckets
        // リサイズ後の新しいハッシュテーブルを初期化
        capacity *= extendRatio
        buckets = arrayOfNulls(capacity)
        size = 0
        // キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルへ移す
        for (pair in bucketsTmp) {
            if (pair != null && pair != TOMBSTONE) {
                put(pair.key, pair._val)
            }
        }
    }

    /* ハッシュテーブルを出力 */
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

/* Driver Code */
fun main() {
    // ハッシュテーブルを初期化
    val hashmap = HashMapOpenAddressing()

    // 追加操作
    // ハッシュテーブルにキーと値の組 (key, val) を追加する
    hashmap.put(12836, "シャオハー")
    hashmap.put(15937, "シャオルオ")
    hashmap.put(16750, "シャオスワン")
    hashmap.put(13276, "シャオファー")
    hashmap.put(10583, "シャオヤー")
    println("\n追加完了後、ハッシュテーブルは\nKey -> Value")
    hashmap.print()

    // 検索操作
    // ハッシュテーブルにキー key を入力し、値 val を得る
    val name = hashmap.get(13276)
    println("\n学籍番号 13276 を入力すると、名前 $name が見つかりました")

    // 削除操作
    // ハッシュテーブルからキーと値の組 (key, val) を削除する
    hashmap.remove(16750)
    println("\n16750 を削除した後、ハッシュテーブルは\nKey -> Value")
    hashmap.print()
}