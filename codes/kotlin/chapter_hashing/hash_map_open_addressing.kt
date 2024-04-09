/**
 * File: hash_map_open_addressing.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

/* 开放寻址哈希表 */
class HashMapOpenAddressing {
    private var size: Int               // 键值对数量
    private var capacity: Int           // 哈希表容量
    private val loadThres: Double       // 触发扩容的负载因子阈值
    private val extendRatio: Int        // 扩容倍数
    private var buckets: Array<Pair?>   // 桶数组
    private val TOMBSTONE: Pair         // 删除标记

    /* 构造方法 */
    init {
        size = 0
        capacity = 4
        loadThres = 2.0 / 3.0
        extendRatio = 2
        buckets = arrayOfNulls(capacity)
        TOMBSTONE = Pair(-1, "-1")
    }

    /* 哈希函数 */
    fun hashFunc(key: Int): Int {
        return key % capacity
    }

    /* 负载因子 */
    fun loadFactor(): Double {
        return (size / capacity).toDouble()
    }

    /* 搜索 key 对应的桶索引 */
    fun findBucket(key: Int): Int {
        var index = hashFunc(key)
        var firstTombstone = -1
        // 线性探测，当遇到空桶时跳出
        while (buckets[index] != null) {
            // 若遇到 key ，返回对应的桶索引
            if (buckets[index]?.key == key) {
                // 若之前遇到了删除标记，则将键值对移动至该索引处
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index]
                    buckets[index] = TOMBSTONE
                    return firstTombstone // 返回移动后的桶索引
                }
                return index // 返回桶索引
            }
            // 记录遇到的首个删除标记
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index
            }
            // 计算桶索引，越过尾部则返回头部
            index = (index + 1) % capacity
        }
        // 若 key 不存在，则返回添加点的索引
        return if (firstTombstone == -1) index else firstTombstone
    }

    /* 查询操作 */
    fun get(key: Int): String? {
        // 搜索 key 对应的桶索引
        val index = findBucket(key)
        // 若找到键值对，则返回对应 val
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index]?._val
        }
        // 若键值对不存在，则返回 null
        return null
    }

    /* 添加操作 */
    fun put(key: Int, _val: String) {
        // 当负载因子超过阈值时，执行扩容
        if (loadFactor() > loadThres) {
            extend()
        }
        // 搜索 key 对应的桶索引
        val index = findBucket(key)
        // 若找到键值对，则覆盖 val 并返回
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index]!!._val = _val
            return
        }
        // 若键值对不存在，则添加该键值对
        buckets[index] = Pair(key, _val)
        size++
    }

    /* 删除操作 */
    fun remove(key: Int) {
        // 搜索 key 对应的桶索引
        val index = findBucket(key)
        // 若找到键值对，则用删除标记覆盖它
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE
            size--
        }
    }

    /* 扩容哈希表 */
    fun extend() {
        // 暂存原哈希表
        val bucketsTmp = buckets
        // 初始化扩容后的新哈希表
        capacity *= extendRatio
        buckets = arrayOfNulls(capacity)
        size = 0
        // 将键值对从原哈希表搬运至新哈希表
        for (pair in bucketsTmp) {
            if (pair != null && pair != TOMBSTONE) {
                put(pair.key, pair._val)
            }
        }
    }

    /* 打印哈希表 */
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
    // 初始化哈希表
    val hashmap = HashMapOpenAddressing()

    // 添加操作
    // 在哈希表中添加键值对 (key, val)
    hashmap.put(12836, "小哈")
    hashmap.put(15937, "小啰")
    hashmap.put(16750, "小算")
    hashmap.put(13276, "小法")
    hashmap.put(10583, "小鸭")
    println("\n添加完成后，哈希表为\nKey -> Value")
    hashmap.print()

    // 查询操作
    // 向哈希表中输入键 key ，得到值 val
    val name = hashmap.get(13276)
    println("\n输入学号 13276 ，查询到姓名 $name")

    // 删除操作
    // 在哈希表中删除键值对 (key, val)
    hashmap.remove(16750)
    println("\n删除 16750 后，哈希表为\nKey -> Value")
    hashmap.print()
}