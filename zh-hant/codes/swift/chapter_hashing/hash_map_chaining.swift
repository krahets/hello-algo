/**
 * File: hash_map_chaining.swift
 * Created Time: 2023-06-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 鏈結法雜湊表 */
class HashMapChaining {
    var size: Int // 鍵值對數量
    var capacity: Int // 雜湊表容量
    var loadThres: Double // 觸發容量擴充的負載因子門檻
    var extendRatio: Int // 容量擴充倍數
    var buckets: [[Pair]] // 桶陣列

    /* 建構方法 */
    init() {
        size = 0
        capacity = 4
        loadThres = 2.0 / 3.0
        extendRatio = 2
        buckets = Array(repeating: [], count: capacity)
    }

    /* 雜湊函式 */
    func hashFunc(key: Int) -> Int {
        key % capacity
    }

    /* 負載因子 */
    func loadFactor() -> Double {
        Double(size) / Double(capacity)
    }

    /* 查詢操作 */
    func get(key: Int) -> String? {
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // 走訪桶中的元素，若找到 key，就回傳對應的 val
        for pair in bucket {
            if pair.key == key {
                return pair.val
            }
        }
        // 若找不到 key，回傳 nil
        return nil
    }

    /* 新增操作 */
    func put(key: Int, val: String) {
        // 當負載因子超過門檻時，擴充容量
        if loadFactor() > loadThres {
            extend()
        }
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // 走訪桶中的元素，若遇到指定的 key，就更新對應的 val 並結束操作
        for pair in bucket {
            if pair.key == key {
                pair.val = val
                return
            }
        }
        // 若沒有這個 key，就將鍵值對加到尾端
        let pair = Pair(key: key, val: val)
        buckets[index].append(pair)
        size += 1
    }

    /* 刪除操作 */
    func remove(key: Int) {
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // 走訪桶中的元素，從中刪除鍵值對
        for (pairIndex, pair) in bucket.enumerated() {
            if pair.key == key {
                buckets[index].remove(at: pairIndex)
                size -= 1
                break
            }
        }
    }

    /* 擴充雜湊表容量 */
    func extend() {
        // 暫存原本的雜湊表
        let bucketsTmp = buckets
        // 初始化擴充後的新雜湊表
        capacity *= extendRatio
        buckets = Array(repeating: [], count: capacity)
        size = 0
        // 將鍵值對從原本的雜湊表移到新表
        for bucket in bucketsTmp {
            for pair in bucket {
                put(key: pair.key, val: pair.val)
            }
        }
    }

    /* 印出雜湊表 */
    func print() {
        for bucket in buckets {
            let res = bucket.map { "\($0.key) -> \($0.val)" }
            Swift.print(res)
        }
    }
}

@main
enum _HashMapChaining {
    /* 主程式 */
    static func main() {
        /* 初始化雜湊表 */
        let map = HashMapChaining()

        /* 新增操作 */
        // 在雜湊表中新增鍵值對 (key, value)
        map.put(key: 12836, val: "小哈")
        map.put(key: 15937, val: "小囉")
        map.put(key: 16750, val: "小算")
        map.put(key: 13276, val: "小法")
        map.put(key: 10583, val: "小鴨")
        print("\n新增後的雜湊表\nKey -> Value")
        map.print()

        /* 查詢操作 */
        // 輸入鍵 key，從雜湊表取得對應的值 value
        let name = map.get(key: 13276)
        print("\n輸入學號 13276，查得姓名 \(name!)")

        /* 刪除操作 */
        // 從雜湊表刪除鍵值對 (key, value)
        map.remove(key: 12836)
        print("\n刪除 12836 後的雜湊表\nKey -> Value")
        map.print()
    }
}
