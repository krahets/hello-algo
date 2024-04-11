/**
 * File: hash_map_open_addressing.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

/* 開放定址雜湊表 */
class HashMapOpenAddressing {
    private var size: Int               // 鍵值對數量
    private var capacity: Int           // 雜湊表容量
    private val loadThres: Double       // 觸發擴容的負載因子閾值
    private val extendRatio: Int        // 擴容倍數
    private var buckets: Array<Pair?>   // 桶陣列
    private val TOMBSTONE: Pair         // 刪除標記

    /* 建構子 */
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

    /* 搜尋 key 對應的桶索引 */
    fun findBucket(key: Int): Int {
        var index = hashFunc(key)
        var firstTombstone = -1
        // 線性探查，當遇到空桶時跳出
        while (buckets[index] != null) {
            // 若遇到 key ，返回對應的桶索引
            if (buckets[index]?.key == key) {
                // 若之前遇到了刪除標記，則將鍵值對移動至該索引處
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index]
                    buckets[index] = TOMBSTONE
                    return firstTombstone // 返回移動後的桶索引
                }
                return index // 返回桶索引
            }
            // 記錄遇到的首個刪除標記
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index
            }
            // 計算桶索引，越過尾部則返回頭部
            index = (index + 1) % capacity
        }
        // 若 key 不存在，則返回新增點的索引
        return if (firstTombstone == -1) index else firstTombstone
    }

    /* 查詢操作 */
    fun get(key: Int): String? {
        // 搜尋 key 對應的桶索引
        val index = findBucket(key)
        // 若找到鍵值對，則返回對應 val
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index]?._val
        }
        // 若鍵值對不存在，則返回 null
        return null
    }

    /* 新增操作 */
    fun put(key: Int, _val: String) {
        // 當負載因子超過閾值時，執行擴容
        if (loadFactor() > loadThres) {
            extend()
        }
        // 搜尋 key 對應的桶索引
        val index = findBucket(key)
        // 若找到鍵值對，則覆蓋 val 並返回
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index]!!._val = _val
            return
        }
        // 若鍵值對不存在，則新增該鍵值對
        buckets[index] = Pair(key, _val)
        size++
    }

    /* 刪除操作 */
    fun remove(key: Int) {
        // 搜尋 key 對應的桶索引
        val index = findBucket(key)
        // 若找到鍵值對，則用刪除標記覆蓋它
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE
            size--
        }
    }

    /* 擴容雜湊表 */
    fun extend() {
        // 暫存原雜湊表
        val bucketsTmp = buckets
        // 初始化擴容後的新雜湊表
        capacity *= extendRatio
        buckets = arrayOfNulls(capacity)
        size = 0
        // 將鍵值對從原雜湊表搬運至新雜湊表
        for (pair in bucketsTmp) {
            if (pair != null && pair != TOMBSTONE) {
                put(pair.key, pair._val)
            }
        }
    }

    /* 列印雜湊表 */
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
    // 初始化雜湊表
    val hashmap = HashMapOpenAddressing()

    // 新增操作
    // 在雜湊表中新增鍵值對 (key, val)
    hashmap.put(12836, "小哈")
    hashmap.put(15937, "小囉")
    hashmap.put(16750, "小算")
    hashmap.put(13276, "小法")
    hashmap.put(10583, "小鴨")
    println("\n新增完成後，雜湊表為\nKey -> Value")
    hashmap.print()

    // 查詢操作
    // 向雜湊表中輸入鍵 key ，得到值 val
    val name = hashmap.get(13276)
    println("\n輸入學號 13276 ，查詢到姓名 $name")

    // 刪除操作
    // 在雜湊表中刪除鍵值對 (key, val)
    hashmap.remove(16750)
    println("\n刪除 16750 後，雜湊表為\nKey -> Value")
    hashmap.print()
}