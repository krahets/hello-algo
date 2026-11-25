/**
 * File: hash_map_open_addressing.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

/* 採用開放定址法的雜湊表 */
class HashMapOpenAddressing {
    private var size: Int               // 鍵值對數量
    private var capacity: Int           // 雜湊表容量
    private val loadThres: Double       // 觸發容量擴充的負載因子門檻
    private val extendRatio: Int        // 容量擴充倍數
    private var buckets: Array<Pair?>   // 桶陣列
    private val TOMBSTONE: Pair         // 刪除標記

    /* 建構方法 */
    init {
        size = 0
        capacity = 4
        loadThres = 2.0 / 3.0
        extendRatio = 2
        buckets = arrayOfNulls(capacity)
        TOMBSTONE = Pair(-1, "-1")
    }

    /* 雜湊函式 */
    fun hashFunc(key: Int): Int {
        return key % capacity
    }

    /* 負載因子 */
    fun loadFactor(): Double {
        return (size / capacity).toDouble()
    }

    /* 尋找 key 對應的桶索引 */
    fun findBucket(key: Int): Int {
        var index = hashFunc(key)
        var firstTombstone = -1
        // 進行線性探測，遇到空桶就跳出迴圈
        while (buckets[index] != null) {
            // 若遇到 key，回傳對應的桶索引
            if (buckets[index]?.key == key) {
                // 若先前遇過刪除標記，將鍵值對移到該標記所在的索引位置
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index]
                    buckets[index] = TOMBSTONE
                    return firstTombstone // 回傳移動後的桶索引
                }
                return index // 回傳桶索引
            }
            // 記錄遇到的第一個刪除標記
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index
            }
            // 計算桶索引，超過陣列尾端就回到開頭
            index = (index + 1) % capacity
        }
        // 若 key 不存在，回傳可插入位置的索引
        return if (firstTombstone == -1) index else firstTombstone
    }

    /* 查詢操作 */
    fun get(key: Int): String? {
        // 尋找 key 對應的桶索引
        val index = findBucket(key)
        // 若找到鍵值對，回傳對應的 val
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index]?._val
        }
        // 若鍵值對不存在，回傳 null
        return null
    }

    /* 新增操作 */
    fun put(key: Int, _val: String) {
        // 當負載因子超過門檻時，擴充容量
        if (loadFactor() > loadThres) {
            extend()
        }
        // 尋找 key 對應的桶索引
        val index = findBucket(key)
        // 若找到鍵值對，覆寫 val 並結束操作
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index]!!._val = _val
            return
        }
        // 若鍵值對不存在，新增該鍵值對
        buckets[index] = Pair(key, _val)
        size++
    }

    /* 刪除操作 */
    fun remove(key: Int) {
        // 尋找 key 對應的桶索引
        val index = findBucket(key)
        // 若找到鍵值對，以刪除標記取代它
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE
            size--
        }
    }

    /* 擴充雜湊表容量 */
    fun extend() {
        // 暫存原本的雜湊表
        val bucketsTmp = buckets
        // 初始化擴充後的新雜湊表
        capacity *= extendRatio
        buckets = arrayOfNulls(capacity)
        size = 0
        // 將鍵值對從原本的雜湊表移到新表
        for (pair in bucketsTmp) {
            if (pair != null && pair != TOMBSTONE) {
                put(pair.key, pair._val)
            }
        }
    }

    /* 印出雜湊表 */
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

/* 主程式 */
fun main() {
    // 初始化雜湊表
    val hashmap = HashMapOpenAddressing()

    // 新增操作
    // 在雜湊表中新增鍵值對 (key, val)
    hashmap.put(12836, "小哈")
    hashmap.put(15937, "小囉")
    hashmap.put(16750, "小算")
    hashmap.put(13276, "小法")
    hashmap.put(10583, "小鴨")
    println("\n新增後的雜湊表\nKey -> Value")
    hashmap.print()

    // 查詢操作
    // 輸入鍵 key，從雜湊表取得對應的值 val
    val name = hashmap.get(13276)
    println("\n輸入學號 13276，查得姓名 $name")

    // 刪除操作
    // 從雜湊表刪除鍵值對 (key, val)
    hashmap.remove(16750)
    println("\n刪除 16750 後的雜湊表\nKey -> Value")
    hashmap.print()
}