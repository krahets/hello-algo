/**
 * File: hash_map_chaining.swift
 * Created Time: 2023-06-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 链式地址哈希表 */
class HashMapChaining {
    var size: Int // 键值对数量
    var capacity: Int // 哈希表容量
    var loadThres: Double // 触发扩容的负载因子阈值
    var extendRatio: Int // 扩容倍数
    var buckets: [[Pair]] // 桶数组

    /* 构造方法 */
    init() {
        size = 0
        capacity = 4
        loadThres = 2.0 / 3.0
        extendRatio = 2
        buckets = Array(repeating: [], count: capacity)
    }

    /* 哈希函数 */
    func hashFunc(key: Int) -> Int {
        key % capacity
    }

    /* 负载因子 */
    func loadFactor() -> Double {
        Double(size) / Double(capacity)
    }

    /* 查询操作 */
    func get(key: Int) -> String? {
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // 遍历桶，若找到 key ，则返回对应 val
        for pair in bucket {
            if pair.key == key {
                return pair.val
            }
        }
        // 若未找到 key ，则返回 nil
        return nil
    }

    /* 添加操作 */
    func put(key: Int, val: String) {
        // 当负载因子超过阈值时，执行扩容
        if loadFactor() > loadThres {
            extend()
        }
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // 遍历桶，若遇到指定 key ，则更新对应 val 并返回
        for pair in bucket {
            if pair.key == key {
                pair.val = val
                return
            }
        }
        // 若无该 key ，则将键值对添加至尾部
        let pair = Pair(key: key, val: val)
        buckets[index].append(pair)
        size += 1
    }

    /* 删除操作 */
    func remove(key: Int) {
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // 遍历桶，从中删除键值对
        for (pairIndex, pair) in bucket.enumerated() {
            if pair.key == key {
                buckets[index].remove(at: pairIndex)
                size -= 1
                break
            }
        }
    }

    /* 扩容哈希表 */
    func extend() {
        // 暂存原哈希表
        let bucketsTmp = buckets
        // 初始化扩容后的新哈希表
        capacity *= extendRatio
        buckets = Array(repeating: [], count: capacity)
        size = 0
        // 将键值对从原哈希表搬运至新哈希表
        for bucket in bucketsTmp {
            for pair in bucket {
                put(key: pair.key, val: pair.val)
            }
        }
    }

    /* 打印哈希表 */
    func print() {
        for bucket in buckets {
            let res = bucket.map { "\($0.key) -> \($0.val)" }
            Swift.print(res)
        }
    }
}

@main
enum _HashMapChaining {
    /* Driver Code */
    static func main() {
        /* 初始化哈希表 */
        let map = HashMapChaining()

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
        map.remove(key: 12836)
        print("\n删除 12836 后，哈希表为\nKey -> Value")
        map.print()
    }
}
