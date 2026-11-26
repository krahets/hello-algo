/**
 * File: hash_map_chaining.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

/* 鏈結法雜湊表 */
class HashMapChaining {
    var size: Int // 鍵值對數量
    var capacity: Int // 雜湊表容量
    val loadThres: Double // 觸發容量擴充的負載因子門檻
    val extendRatio: Int // 容量擴充倍數
    var buckets: MutableList<MutableList<Pair>> // 桶陣列

    /* 建構方法 */
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
        // 走訪桶中的元素，若找到 key，就回傳對應的 val
        for (pair in bucket) {
            if (pair.key == key) return pair._val
        }
        // 若找不到 key，回傳 null
        return null
    }

    /* 新增操作 */
    fun put(key: Int, _val: String) {
        // 當負載因子超過門檻時，擴充容量
        if (loadFactor() > loadThres) {
            extend()
        }
        val index = hashFunc(key)
        val bucket = buckets[index]
        // 走訪桶中的元素，若遇到指定的 key，就更新對應的 val 並結束操作
        for (pair in bucket) {
            if (pair.key == key) {
                pair._val = _val
                return
            }
        }
        // 若沒有這個 key，就將鍵值對加到尾端
        val pair = Pair(key, _val)
        bucket.add(pair)
        size++
    }

    /* 刪除操作 */
    fun remove(key: Int) {
        val index = hashFunc(key)
        val bucket = buckets[index]
        // 走訪桶中的元素，從中刪除鍵值對
        for (pair in bucket) {
            if (pair.key == key) {
                bucket.remove(pair)
                size--
                break
            }
        }
    }

    /* 擴充雜湊表容量 */
    fun extend() {
        // 暫存原本的雜湊表
        val bucketsTmp = buckets
        // 初始化擴充後的新雜湊表
        capacity *= extendRatio
        // MutableList 的大小不固定
        buckets = mutableListOf()
        for (i in 0..<capacity) {
            buckets.add(mutableListOf())
        }
        size = 0
        // 將鍵值對從原本的雜湊表移到新表
        for (bucket in bucketsTmp) {
            for (pair in bucket) {
                put(pair.key, pair._val)
            }
        }
    }

    /* 印出雜湊表 */
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

/* 主程式 */
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
    println("\n新增後的雜湊表\nKey -> Value")
    map.print()

    /* 查詢操作 */
    // 輸入鍵 key，從雜湊表取得對應的值 value
    val name = map.get(13276)
    println("\n輸入學號 13276，查得姓名 $name")

    /* 刪除操作 */
    // 從雜湊表刪除鍵值對 (key, value)
    map.remove(12836)
    println("\n刪除 12836 後的雜湊表\nKey -> Value")
    map.print()
}