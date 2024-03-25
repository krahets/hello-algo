/**
 * File: array_hash_map.swift
 * Created Time: 2023-01-16
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 基于数组实现的哈希表 */
class ArrayHashMap {
    private var buckets: [Pair?]

    init() {
        // 初始化数组，包含 100 个桶
        buckets = Array(repeating: nil, count: 100)
    }

    /* 哈希函数 */
    private func hashFunc(key: Int) -> Int {
        let index = key % 100
        return index
    }

    /* 查询操作 */
    func get(key: Int) -> String? {
        let index = hashFunc(key: key)
        let pair = buckets[index]
        return pair?.val
    }

    /* 添加操作 */
    func put(key: Int, val: String) {
        let pair = Pair(key: key, val: val)
        let index = hashFunc(key: key)
        buckets[index] = pair
    }

    /* 删除操作 */
    func remove(key: Int) {
        let index = hashFunc(key: key)
        // 置为 nil ，代表删除
        buckets[index] = nil
    }

    /* 获取所有键值对 */
    func pairSet() -> [Pair] {
        buckets.compactMap { $0 }
    }

    /* 获取所有键 */
    func keySet() -> [Int] {
        buckets.compactMap { $0?.key }
    }

    /* 获取所有值 */
    func valueSet() -> [String] {
        buckets.compactMap { $0?.val }
    }

    /* 打印哈希表 */
    func print() {
        for pair in pairSet() {
            Swift.print("\(pair.key) -> \(pair.val)")
        }
    }
}

@main
enum _ArrayHashMap {
    /* Driver Code */
    static func main() {
        /* 初始化哈希表 */
        let map = ArrayHashMap()

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
        let name = map.get(key: 15937)!
        print("\n输入学号 15937 ，查询到姓名 \(name)")

        /* 删除操作 */
        // 在哈希表中删除键值对 (key, value)
        map.remove(key: 10583)
        print("\n删除 10583 后，哈希表为\nKey -> Value")
        map.print()

        /* 遍历哈希表 */
        print("\n遍历键值对 Key->Value")
        for pair in map.pairSet() {
            print("\(pair.key) -> \(pair.val)")
        }
        print("\n单独遍历键 Key")
        for key in map.keySet() {
            print(key)
        }
        print("\n单独遍历值 Value")
        for val in map.valueSet() {
            print(val)
        }
    }
}
