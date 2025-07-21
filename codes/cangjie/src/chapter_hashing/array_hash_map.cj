/**
 * File: array_hash_map.cj
 * Created Time: 2025-06-24
 * Author: jan_huber (jan_huber@163.com)
 */

package cangjie.chapter_hashing

import std.collection.{ArrayList}

/* 键值对 */
class Pair {
    public var key: Int64
    public var val: String

    public Pair(key: Int64, val: String) {
        this.key = key
        this.val = val
    }
}

/* 基于数组实现的哈希表 */
class ArrayHashMap {
    private var buckets: ArrayList<?Pair>

    public ArrayHashMap() {
        // 初始化数组，包含 100 个桶
        buckets = ArrayList<?Pair>()
        for (i in 0..100) {
            buckets.add(None)
        }
    }

    /* 哈希函数 */
    private func hashFunc(key: Int64): Int64 {
        let index = key % 100
        return index
    }

    /* 查询操作 */
    public func get(key: Int64): ?String {
        let index = hashFunc(key)
        let pair = buckets.get(index).getOrThrow()
        if (pair.isNone()) {
            return None
        }
        return pair?.val
    }

    /* 添加操作 */
    public func put(key: Int64, val: String): Unit {
        let pair = Pair(key, val)
        let index = hashFunc(key)
        buckets.add(pair, at: index)
    }

    /* 删除操作 */
    public func remove(key: Int64): Unit {
        let index = hashFunc(key)
        // 置为 None ，代表删除
        buckets.add(None, at: index)
    }

    /* 获取所有键值对 */
    public func pairSet(): ArrayList<Pair> {
        let pairSet = ArrayList<Pair>()
        for (b in buckets) {
            if (let Some(b) <- b) {
                pairSet.add(b)
            }
        }
        return pairSet
    }

    /* 获取所有键 */
    public func keySet(): ArrayList<Int64> {
        let keySet = ArrayList<Int64>()
        for (pair in buckets) {
            if (let Some(pair) <- pair) {
                keySet.add(pair.key)
            }
        }
        return keySet
    }

    /* 获取所有值 */
    public func valueSet(): ArrayList<String> {
        let valueSet = ArrayList<String>()
        for (pair in buckets) {
            if (let Some(pair) <- pair) {
                valueSet.add(pair.val)
            }
        }
        return valueSet
    }

    /* 打印哈希表 */
    public func print(): Unit {
        for (kv in pairSet()) {
            println("${kv.key} -> ${kv.val}")
        }
    }
}
