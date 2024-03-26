/**
 * File: hash_map_open_addressing.swift
 * Created Time: 2023-06-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 开放寻址哈希表 */
class HashMapOpenAddressing {
    var size: Int // 键值对数量
    var capacity: Int // 哈希表容量
    var loadThres: Double // 触发扩容的负载因子阈值
    var extendRatio: Int // 扩容倍数
    var buckets: [Pair?] // 桶数组
    var TOMBSTONE: Pair // 删除标记

    /* 构造方法 */
    init() {
        size = 0
        capacity = 4
        loadThres = 2.0 / 3.0
        extendRatio = 2
        buckets = Array(repeating: nil, count: capacity)
        TOMBSTONE = Pair(key: -1, val: "-1")
    }

    /* 哈希函数 */
    func hashFunc(key: Int) -> Int {
        key % capacity
    }

    /* 负载因子 */
    func loadFactor() -> Double {
        Double(size) / Double(capacity)
    }

    /* 搜索 key 对应的桶索引 */
    func findBucket(key: Int) -> Int {
        var index = hashFunc(key: key)
        var firstTombstone = -1
        // 线性探测，当遇到空桶时跳出
        while buckets[index] != nil {
            // 若遇到 key ，返回对应的桶索引
            if buckets[index]!.key == key {
                // 若之前遇到了删除标记，则将键值对移动至该索引处
                if firstTombstone != -1 {
                    buckets[firstTombstone] = buckets[index]
                    buckets[index] = TOMBSTONE
                    return firstTombstone // 返回移动后的桶索引
                }
                return index // 返回桶索引
            }
            // 记录遇到的首个删除标记
            if firstTombstone == -1 && buckets[index] == TOMBSTONE {
                firstTombstone = index
            }
            // 计算桶索引，越过尾部则返回头部
            index = (index + 1) % capacity
        }
        // 若 key 不存在，则返回添加点的索引
        return firstTombstone == -1 ? index : firstTombstone
    }

    /* 查询操作 */
    func get(key: Int) -> String? {
        // 搜索 key 对应的桶索引
        let index = findBucket(key: key)
        // 若找到键值对，则返回对应 val
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            return buckets[index]!.val
        }
        // 若键值对不存在，则返回 null
        return nil
    }

    /* 添加操作 */
    func put(key: Int, val: String) {
        // 当负载因子超过阈值时，执行扩容
        if loadFactor() > loadThres {
            extend()
        }
        // 搜索 key 对应的桶索引
        let index = findBucket(key: key)
        // 若找到键值对，则覆盖 val 并返回
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            buckets[index]!.val = val
            return
        }
        // 若键值对不存在，则添加该键值对
        buckets[index] = Pair(key: key, val: val)
        size += 1
    }

    /* 删除操作 */
    func remove(key: Int) {
        // 搜索 key 对应的桶索引
        let index = findBucket(key: key)
        // 若找到键值对，则用删除标记覆盖它
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            buckets[index] = TOMBSTONE
            size -= 1
        }
    }

    /* 扩容哈希表 */
    func extend() {
        // 暂存原哈希表
        let bucketsTmp = buckets
        // 初始化扩容后的新哈希表
        capacity *= extendRatio
        buckets = Array(repeating: nil, count: capacity)
        size = 0
        // 将键值对从原哈希表搬运至新哈希表
        for pair in bucketsTmp {
            if let pair, pair != TOMBSTONE {
                put(key: pair.key, val: pair.val)
            }
        }
    }

    /* 打印哈希表 */
    func print() {
        for pair in buckets {
            if pair == nil {
                Swift.print("null")
            } else if pair == TOMBSTONE {
                Swift.print("TOMBSTONE")
            } else {
                Swift.print("\(pair!.key) -> \(pair!.val)")
            }
        }
    }
}

@main
enum _HashMapOpenAddressing {
    /* Driver Code */
    static func main() {
        /* 初始化哈希表 */
        let map = HashMapOpenAddressing()

        /* 添加操作 */
        // 在哈希表中添加键值对 (key, value)
        map.put(key: 12836, val: "小哈")
        map.put(key: 15937, val: "小啰")
        map.put(key: 16750, val: "小算")
        map.put(key: 13276, val: "小法")
        map.put(key: 10583, val: "小鸭")
        print("\n添加完成后，哈希表为\nKey -> Value")
        map.print()

        /* 查询操作 */
        // 向哈希表中输入键 key ，得到值 value
        let name = map.get(key: 13276)
        print("\n输入学号 13276 ，查询到姓名 \(name!)")

        /* 删除操作 */
        // 在哈希表中删除键值对 (key, value)
        map.remove(key: 16750)
        print("\n删除 16750 后，哈希表为\nKey -> Value")
        map.print()
    }
}
