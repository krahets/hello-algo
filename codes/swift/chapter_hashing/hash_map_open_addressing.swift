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
    var removed: Pair // 删除标记

    /* 构造方法 */
    init() {
        size = 0
        capacity = 4
        loadThres = 2 / 3
        extendRatio = 2
        buckets = Array(repeating: nil, count: capacity)
        removed = Pair(key: -1, val: "-1")
    }

    /* 哈希函数 */
    func hashFunc(key: Int) -> Int {
        key % capacity
    }

    /* 负载因子 */
    func loadFactor() -> Double {
        Double(size / capacity)
    }

    /* 查询操作 */
    func get(key: Int) -> String? {
        let index = hashFunc(key: key)
        // 线性探测，从 index 开始向后遍历
        for i in stride(from: 0, to: capacity, by: 1) {
            // 计算桶索引，越过尾部返回头部
            let j = (index + i) % capacity
            // 若遇到空桶，说明无此 key ，则返回 nil
            if buckets[j] == nil {
                return nil
            }
            // 若遇到指定 key ，则返回对应 val
            if buckets[j]?.key == key, buckets[j] != removed {
                return buckets[j]?.val
            }
        }
        return nil
    }

    /* 添加操作 */
    func put(key: Int, val: String) {
        // 当负载因子超过阈值时，执行扩容
        if loadFactor() > loadThres {
            extend()
        }
        let index = hashFunc(key: key)
        // 线性探测，从 index 开始向后遍历
        for i in stride(from: 0, through: capacity, by: 1) {
            // 计算桶索引，越过尾部返回头部
            let j = (index + i) % capacity
            // 若遇到空桶、或带有删除标记的桶，则将键值对放入该桶
            if buckets[j] == nil || buckets[j] == removed {
                buckets[j] = Pair(key: key, val: val)
                size += 1
                return
            }
            // 若遇到指定 key ，则更新对应 val
            if buckets[j]?.key == key {
                buckets[j]?.val = val
                return
            }
        }
    }

    /* 删除操作 */
    func remove(key: Int) {
        let index = hashFunc(key: key)
        // 线性探测，从 index 开始向后遍历
        for i in stride(from: 0, to: capacity, by: 1) {
            // 计算桶索引，越过尾部返回头部
            let j = (index + i) % capacity
            // 若遇到空桶，说明无此 key ，则直接返回
            if buckets[j] == nil {
                return
            }
            // 若遇到指定 key ，则标记删除并返回
            if buckets[j]?.key == key {
                buckets[j] = removed
                size -= 1
                return
            }
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
            if let pair, pair != removed {
                put(key: pair.key, val: pair.val)
            }
        }
    }

    /* 打印哈希表 */
    func print() {
        for pair in buckets {
            if let pair {
                Swift.print("\(pair.key) -> \(pair.val)")
            } else {
                Swift.print("null")
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
        // 向哈希表输入键 key ，得到值 value
        let name = map.get(key: 13276)
        print("\n输入学号 13276 ，查询到姓名 \(name!)")

        /* 删除操作 */
        // 在哈希表中删除键值对 (key, value)
        map.remove(key: 16750)
        print("\n删除 16750 后，哈希表为\nKey -> Value")
        map.print()
    }
}
