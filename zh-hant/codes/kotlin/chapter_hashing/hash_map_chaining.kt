/**
 * File: hash_map_chaining.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

/* 鏈式位址雜湊表 */
class HashMapChaining {
    var size: Int // 鍵值對數量
    var capacity: Int // 雜湊表容量
    val loadThres: Double // 觸發擴容的負載因子閾值
    val extendRatio: Int // 擴容倍數
    var buckets: MutableList<MutableList<Pair>> // 桶陣列

    /* 建構子 */
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

    /* 雜湊函式 */
    fun hashFunc(key: Int): Int {
        return key % capacity
    }

    /* 負載因子 */
    fun loadFactor(): Double {
        return (size / capacity).toDouble()
    }

    /* 查詢操作 */
    fun get(key: Int): String? {
        val index = hashFunc(key)
        val bucket = buckets[index]
        // 走訪桶，若找到 key ，則返回對應 val
        for (pair in bucket) {
            if (pair.key == key) return pair._val
        }
        // 若未找到 key ，則返回 null
        return null
    }

    /* 新增操作 */
    fun put(key: Int, _val: String) {
        // 當負載因子超過閾值時，執行擴容
        if (loadFactor() > loadThres) {
            extend()
        }
        val index = hashFunc(key)
        val bucket = buckets[index]
        // 走訪桶，若遇到指定 key ，則更新對應 val 並返回
        for (pair in bucket) {
            if (pair.key == key) {
                pair._val = _val
                return
            }
        }
        // 若無該 key ，則將鍵值對新增至尾部
        val pair = Pair(key, _val)
        bucket.add(pair)
        size++
    }

    /* 刪除操作 */
    fun remove(key: Int) {
        val index = hashFunc(key)
        val bucket = buckets[index]
        // 走訪桶，從中刪除鍵值對
        for (pair in bucket) {
            if (pair.key == key) {
                bucket.remove(pair)
                size--
                break
            }
        }
    }

    /* 擴容雜湊表 */
    fun extend() {
        // 暫存原雜湊表
        val bucketsTmp = buckets
        // 初始化擴容後的新雜湊表
        capacity *= extendRatio
        // mutablelist 無固定大小
        buckets = mutableListOf()
        for (i in 0..<capacity) {
            buckets.add(mutableListOf())
        }
        size = 0
        // 將鍵值對從原雜湊表搬運至新雜湊表
        for (bucket in bucketsTmp) {
            for (pair in bucket) {
                put(pair.key, pair._val)
            }
        }
    }

    /* 列印雜湊表 */
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
    /* 初始化雜湊表 */
    val map = HashMapChaining()

    /* 新增操作 */
    // 在雜湊表中新增鍵值對 (key, value)
    map.put(12836, "小哈")
    map.put(15937, "小囉")
    map.put(16750, "小算")
    map.put(13276, "小法")
    map.put(10583, "小鴨")
    println("\n新增完成後，雜湊表為\nKey -> Value")
    map.print()

    /* 查詢操作 */
    // 向雜湊表中輸入鍵 key ，得到值 value
    val name = map.get(13276)
    println("\n輸入學號 13276 ，查詢到姓名 $name")

    /* 刪除操作 */
    // 在雜湊表中刪除鍵值對 (key, value)
    map.remove(12836)
    println("\n刪除 12836 後，雜湊表為\nKey -> Value")
    map.print()
}