/**
 * File: array_hash_map.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

/* 键值对 */
class Pair(
    var key: Int,
    var _val: String
)

/* 基于数组实现的哈希表 */
class ArrayHashMap {
    // 初始化数组，包含 100 个桶
    private val buckets = arrayOfNulls<Pair>(100)

    /* 哈希函数 */
    fun hashFunc(key: Int): Int {
        val index = key % 100
        return index
    }

    /* 查询操作 */
    fun get(key: Int): String? {
        val index = hashFunc(key)
        val pair = buckets[index] ?: return null
        return pair._val
    }

    /* 添加操作 */
    fun put(key: Int, _val: String) {
        val pair = Pair(key, _val)
        val index = hashFunc(key)
        buckets[index] = pair
    }

    /* 删除操作 */
    fun remove(key: Int) {
        val index = hashFunc(key)
        // 置为 null ，代表删除
        buckets[index] = null
    }

    /* 获取所有键值对 */
    fun pairSet(): MutableList<Pair> {
        val pairSet = mutableListOf<Pair>()
        for (pair in buckets) {
            if (pair != null)
                pairSet.add(pair)
        }
        return pairSet
    }

    /* 获取所有键 */
    fun keySet(): MutableList<Int> {
        val keySet = mutableListOf<Int>()
        for (pair in buckets) {
            if (pair != null)
                keySet.add(pair.key)
        }
        return keySet
    }

    /* 获取所有值 */
    fun valueSet(): MutableList<String> {
        val valueSet = mutableListOf<String>()
        for (pair in buckets) {
            if (pair != null)
                valueSet.add(pair._val)
        }
        return valueSet
    }

    /* 打印哈希表 */
    fun print() {
        for (kv in pairSet()) {
            val key = kv.key
            val _val = kv._val
            println("$key -> $_val")
        }
    }
}

/* Driver Code */
fun main() {
    /* 初始化哈希表 */
    val map = ArrayHashMap()

    /* 添加操作 */
    // 在哈希表中添加键值对 (key, value)
    map.put(12836, "小哈")
    map.put(15937, "小啰")
    map.put(16750, "小算")
    map.put(13276, "小法")
    map.put(10583, "小鸭")
    println("\n添加完成后，哈希表为\nKey -> Value")
    map.print()

    /* 查询操作 */
    // 向哈希表中输入键 key ，得到值 value
    val name = map.get(15937)
    println("\n输入学号 15937 ，查询到姓名 $name")

    /* 删除操作 */
    // 在哈希表中删除键值对 (key, value)
    map.remove(10583)
    println("\n删除 10583 后，哈希表为\nKey -> Value")
    map.print()

    /* 遍历哈希表 */
    println("\n遍历键值对 Key -> Value")
    for (kv in map.pairSet()) {
        println("${kv.key} -> ${kv._val}")
    }
    println("\n单独遍历键 Key")
    for (key in map.keySet()) {
        println(key)
    }
    println("\n单独遍历值 Value")
    for (_val in map.valueSet()) {
        println(_val)
    }
}