/**
 * File: hash_map_open_addressing.cj
 * Created Time: 2025-06-24
 * Author: jan_huber (jan_huber@163.com)
 */

package cangjie.chapter_hashing

import std.collection.ArrayList

/* 开放寻址哈希表 */
class HashMapOpenAddressing {
    private var size: Int64 // 键值对数量
    private var capacity = 4 // 哈希表容量
    private let loadThres = 2.0 / 3.0 // 触发扩容的负载因子阈值
    private let extendRatio = 2 // 扩容倍数
    private var buckets: Array<?Pair> // 桶数组
    private let TOMBSTONE: Pair = Pair(-1, "-1") // 删除标记

    /* 构造方法 */
    public init() {
        this.size = 0
        this.buckets = Array<?Pair>(capacity, {i => None})
    }

    /* 哈希函数 */
    private func hashFunc(key: Int64): Int64 {
        return key % capacity
    }

    /* 负载因子 */
    private func loadFactor(): Float64 {
        return Float64(size / capacity)
    }

    /* 搜索 key 对应的桶索引 */
    private func findBucket(key: Int64): Int64 {
        var index = hashFunc(key)
        var firstTombstone = -1
        // 线性探测，当遇到空桶时跳出
        while (let Some(bucket) <- buckets[index]) {
            // 若遇到 key ，返回对应的桶索引
            if (bucket.key == key) {
                // 若之前遇到了删除标记，则将键值对移动至该索引处
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = bucket
                    buckets[index] = TOMBSTONE
                    return firstTombstone // 返回移动后的桶索引
                }
                return index // 返回桶索引
            }
            // 记录遇到的首个删除标记
            if (firstTombstone == -1 && bucket.key == TOMBSTONE.key && bucket.val == TOMBSTONE.val) {
                firstTombstone = index
            }
            // 计算桶索引，越过尾部则返回头部
            index = (index + 1) % capacity
        }

        // 若 key 不存在，则返回添加点的索引
        if (firstTombstone == -1) {
            return index
        } else {
            return firstTombstone
        }
    }

    /* 查询操作 */
    public func get(key: Int64): ?String {
        // 搜索 key 对应的桶索引
        let index = findBucket(key)
        // 若找到键值对，则返回对应 val
        if (let Some(bucket) <- buckets[index]) {
            if (bucket.key != TOMBSTONE.key && bucket.val != TOMBSTONE.val) {
                return bucket.val
            }
        }
        // 若键值对不存在，则返回 None
        return None
    }

    /* 添加操作 */
    public func put(key: Int64, val: String): Unit {
        // 当负载因子超过阈值时，执行扩容
        if (loadFactor() > loadThres) {
            extendCapacity()
        }
        // 搜索 key 对应的桶索引
        let index = findBucket(key)
        // 若找到键值对，则覆盖 val 并返回
        if (let Some(bucket) <- buckets[index]) {
            if (bucket.key != TOMBSTONE.key && bucket.val != TOMBSTONE.val) {
                bucket.val = val
                return
            }
        }
        // 若键值对不存在，则添加该键值对
        buckets[index] = Pair(key, val)
        size++
    }

    /* 删除操作 */
    public func remove(key: Int64): Unit {
        // 搜索 key 对应的桶索引
        let index = findBucket(key)
        // 若找到键值对，则用删除标记覆盖它
        if (let Some(bucket) <- buckets[index]) {
            if (bucket.key != TOMBSTONE.key && bucket.val != TOMBSTONE.val) {
                buckets[index] = TOMBSTONE
                size--
            }
        }
    }

    /* 扩容哈希表 */
    private func extendCapacity(): Unit {
        // 暂存原哈希表
        let bucketsTmp = buckets
        // 初始化扩容后的新哈希表
        capacity *= extendRatio
        buckets = Array<?Pair>(capacity, {i => None})
        this.size = 0
        // 将键值对从原哈希表搬运至新哈希表
        for (pair in bucketsTmp) {
            if (let Some(pair) <- pair) {
                if (pair.key != TOMBSTONE.key && pair.val != TOMBSTONE.val) {
                    put(pair.key, pair.val)
                }
            }
        }
    }

    /* 打印哈希表 */
    public func print(): Unit {
        for (pair in buckets) {
            if (pair.isNone()) {
                println("None")
            } else if (pair?.key == TOMBSTONE.key && pair?.val == TOMBSTONE.val) {
                println("TOMBSTONE")
            } else {
                println("${pair?.key} -> ${pair?.val}")
            }
        }
    }
}
