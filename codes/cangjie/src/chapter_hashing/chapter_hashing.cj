/**
 * File: hash_map_chaining.cj
 * Created Time: 2025-06-24
 * Author: jan_huber (jan_huber@163.com)
 */
package cangjie.chapter_hashing

import std.collection.ArrayList

/* 链式地址哈希表 */
class HashMapChaining {
    var size: Int64 // 键值对数量
    var capacity: Int64 // 哈希表容量
    var loadThres: Float64 // 触发扩容的负载因子阈值
    var extendRatio: Int64 // 扩容倍数
    var buckets: ArrayList<ArrayList<Pair>> // 桶数组

    public init() {
        this.size = 0
        this.capacity = 4
        this.loadThres = 2.0 / 3.0
        this.extendRatio = 2
        buckets = ArrayList<ArrayList<Pair>>(capacity)
        for (i in 0..capacity) {
            buckets.append(ArrayList<Pair>())
        }
    }

    /* 哈希函数 */
    func hashFunc(key: Int64) {
        return key % capacity
    }

    /* 负载因子 */
    func loadFactor(): Float64 {
        return Float64(size / capacity)
    }

    /* 查询操作 */
    func get(key: Int64): ?String {
        let index = hashFunc(key)
        let bucket = buckets.get(index).getOrDefault({=> ArrayList<Pair>(0)})
        // 遍历桶，若找到 key ，则返回对应 val
        for (pair in bucket) {
            if (pair.key == key) {
                return pair.val
            }
        }
        // 若未找到 key ，则返回 None
        return None
    }

    /* 添加操作 */
    func put(key: Int64, val: String): Unit {
        // 当负载因子超过阈值时，执行扩容
        if (loadFactor() > loadThres) {
            extendCapacity()
        }
        let index = hashFunc(key)
        let bucket = buckets.get(index).getOrDefault({=> ArrayList<Pair>(0)})
        // 遍历桶，若遇到指定 key ，则更新对应 val 并返回
        for (pair in bucket) {
            if (pair.key == key) {
                pair.val = val
                return
            }
        }
        // 若无该 key ，则将键值对添加至尾部
        let pair = Pair(key, val)
        bucket.append(pair)
        size++
    }

    /* 删除操作 */
    func remove(key: Int64): Unit {
        let index = hashFunc(key)
        let bucket = buckets.get(index).getOrDefault({=> ArrayList<Pair>(0)})
        // 遍历桶，从中删除键值对
        for (i in 0..bucket.size) {
            if (bucket[i].key == key) {
                bucket.remove(i)
                size--
                break
            }
        }
    }

    /* 扩容哈希表 */
    func extendCapacity(): Unit {
        // 暂存原哈希表
        let bucketsTmp = buckets
        // 初始化扩容后的新哈希表
        capacity *= extendRatio
        buckets = ArrayList<ArrayList<Pair>>(capacity)
        for (i in 0..capacity) {
            buckets.append(ArrayList<Pair>())
        }
        size = 0
        // 将键值对从原哈希表搬运至新哈希表
        for (bucket in bucketsTmp) {
            for (pair in bucket) {
                put(pair.key, pair.val)
            }
        }
    }
    /* 打印哈希表 */
    func print(): Unit {
        for (bucket in buckets) {
            let res = ArrayList<String>()
            for (pair in bucket) {
                res.append("${pair.key} -> ${pair.val}")
            }
            println(res)
        }
    }
}
