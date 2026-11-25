/**
 * File: array_hash_map.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

/* 鍵值對 */
class Pair(
    var key: Int,
    var _val: String
)

/* 以陣列實作的雜湊表 */
class ArrayHashMap {
    // 初始化包含 100 個桶的陣列
    private val buckets = arrayOfNulls<Pair>(100)

    /* 雜湊函式 */
    fun hashFunc(key: Int): Int {
        val index = key % 100
        return index
    }

    /* 查詢操作 */
    fun get(key: Int): String? {
        val index = hashFunc(key)
        val pair = buckets[index] ?: return null
        return pair._val
    }

    /* 新增操作 */
    fun put(key: Int, _val: String) {
        val pair = Pair(key, _val)
        val index = hashFunc(key)
        buckets[index] = pair
    }

    /* 刪除操作 */
    fun remove(key: Int) {
        val index = hashFunc(key)
        // 設為 null，表示刪除
        buckets[index] = null
    }

    /* 取得所有鍵值對 */
    fun pairSet(): MutableList<Pair> {
        val pairSet = mutableListOf<Pair>()
        for (pair in buckets) {
            if (pair != null)
                pairSet.add(pair)
        }
        return pairSet
    }

    /* 取得所有鍵 */
    fun keySet(): MutableList<Int> {
        val keySet = mutableListOf<Int>()
        for (pair in buckets) {
            if (pair != null)
                keySet.add(pair.key)
        }
        return keySet
    }

    /* 取得所有值 */
    fun valueSet(): MutableList<String> {
        val valueSet = mutableListOf<String>()
        for (pair in buckets) {
            if (pair != null)
                valueSet.add(pair._val)
        }
        return valueSet
    }

    /* 印出雜湊表 */
    fun print() {
        for (kv in pairSet()) {
            val key = kv.key
            val _val = kv._val
            println("$key -> $_val")
        }
    }
}

/* 主程式 */
fun main() {
    /* 初始化雜湊表 */
    val map = ArrayHashMap()

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
    val name = map.get(15937)
    println("\n輸入學號 15937，查得姓名 $name")

    /* 刪除操作 */
    // 從雜湊表刪除鍵值對 (key, value)
    map.remove(10583)
    println("\n刪除 10583 後的雜湊表\nKey -> Value")
    map.print()

    /* 走訪雜湊表 */
    println("\n走訪鍵值對 Key -> Value")
    for (kv in map.pairSet()) {
        println("${kv.key} -> ${kv._val}")
    }
    println("\n只走訪鍵 Key")
    for (key in map.keySet()) {
        println(key)
    }
    println("\n只走訪值 Value")
    for (_val in map.valueSet()) {
        println(_val)
    }
}