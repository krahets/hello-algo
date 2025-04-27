/**
 * File: hash_map_chaining.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

/* 链式地址哈希表 */
class HashMapChaining {
    var size: Int // 键值对数量
    var capacity: Int // 哈希表容量
    val loadThres: Double // 触发扩容的负载因子阈值
    val extendRatio: Int // 扩容倍数
    var buckets: MutableList<MutableList<Pair>> // 桶数组

    /* 构造方法 */
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

    /* 哈希函数 */
    fun hashFunc(key: Int): Int {
        return key % capacity
    }

    /* 负载因子 */
    fun loadFactor(): Double {
        return (size / capacity).toDouble()
    }

    /* 查询操作 */
    fun get(key: Int): String? {
        val index = hashFunc(key)
        val bucket = buckets[index]
        // 遍历桶，若找到 key ，则返回对应 val
        for (pair in bucket) {
            if (pair.key == key) return pair._val
        }
        // 若未找到 key ，则返回 null
        return null
    }

    /* 添加操作 */
    fun put(key: Int, _val: String) {
        // 当负载因子超过阈值时，执行扩容
        if (loadFactor() > loadThres) {
            extend()
        }
        val index = hashFunc(key)
        val bucket = buckets[index]
        // 遍历桶，若遇到指定 key ，则更新对应 val 并返回
        for (pair in bucket) {
            if (pair.key == key) {
                pair._val = _val
                return
            }
        }
        // 若无该 key ，则将键值对添加至尾部
        val pair = Pair(key, _val)
        bucket.add(pair)
        size++
    }

    /* 删除操作 */
    fun remove(key: Int) {
        val index = hashFunc(key)
        val bucket = buckets[index]
        // 遍历桶，从中删除键值对
        for (pair in bucket) {
            if (pair.key == key) {
                bucket.remove(pair)
                size--
                break
            }
        }
    }

    /* 扩容哈希表 */
    fun extend() {
        // 暂存原哈希表
        val bucketsTmp = buckets
        // 初始化扩容后的新哈希表
        capacity *= extendRatio
        // mutablelist 无固定大小
        buckets = mutableListOf()
        for (i in 0..<capacity) {
            buckets.add(mutableListOf())
        }
        size = 0
        // 将键值对从原哈希表搬运至新哈希表
        for (bucket in bucketsTmp) {
            for (pair in bucket) {
                put(pair.key, pair._val)
            }
        }
    }

    /* 打印哈希表 */
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
    /* 初始化哈希表 */
    val map = HashMapChaining()

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
    val name = map.get(13276)
    println("\n输入学号 13276 ，查询到姓名 $name")

    /* 删除操作 */
    // 在哈希表中删除键值对 (key, value)
    map.remove(12836)
    println("\n删除 12836 后，哈希表为\nKey -> Value")
    map.print()
}