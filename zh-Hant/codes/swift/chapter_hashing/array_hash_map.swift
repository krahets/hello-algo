/**
 * File: array_hash_map.swift
 * Created Time: 2023-01-16
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 基於陣列實現的雜湊表 */
class ArrayHashMap {
    private var buckets: [Pair?]

    init() {
        // 初始化陣列，包含 100 個桶
        buckets = Array(repeating: nil, count: 100)
    }

    /* 雜湊函式 */
    private func hashFunc(key: Int) -> Int {
        let index = key % 100
        return index
    }

    /* 查詢操作 */
    func get(key: Int) -> String? {
        let index = hashFunc(key: key)
        let pair = buckets[index]
        return pair?.val
    }

    /* 新增操作 */
    func put(key: Int, val: String) {
        let pair = Pair(key: key, val: val)
        let index = hashFunc(key: key)
        buckets[index] = pair
    }

    /* 刪除操作 */
    func remove(key: Int) {
        let index = hashFunc(key: key)
        // 置為 nil ，代表刪除
        buckets[index] = nil
    }

    /* 獲取所有鍵值對 */
    func pairSet() -> [Pair] {
        buckets.compactMap { $0 }
    }

    /* 獲取所有鍵 */
    func keySet() -> [Int] {
        buckets.compactMap { $0?.key }
    }

    /* 獲取所有值 */
    func valueSet() -> [String] {
        buckets.compactMap { $0?.val }
    }

    /* 列印雜湊表 */
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
        /* 初始化雜湊表 */
        let map = ArrayHashMap()

        /* 新增操作 */
        // 在雜湊表中新增鍵值對 (key, value)
        map.put(key: 12836, val: "小哈")
        map.put(key: 15937, val: "小囉")
        map.put(key: 16750, val: "小算")
        map.put(key: 13276, val: "小法")
        map.put(key: 10583, val: "小鴨")
        print("\n新增完成後，雜湊表為\nKey -> Value")
        map.print()

        /* 查詢操作 */
        // 向雜湊表中輸入鍵 key ，得到值 value
        let name = map.get(key: 15937)!
        print("\n輸入學號 15937 ，查詢到姓名 \(name)")

        /* 刪除操作 */
        // 在雜湊表中刪除鍵值對 (key, value)
        map.remove(key: 10583)
        print("\n刪除 10583 後，雜湊表為\nKey -> Value")
        map.print()

        /* 走訪雜湊表 */
        print("\n走訪鍵值對 Key->Value")
        for pair in map.pairSet() {
            print("\(pair.key) -> \(pair.val)")
        }
        print("\n單獨走訪鍵 Key")
        for key in map.keySet() {
            print(key)
        }
        print("\n單獨走訪值 Value")
        for val in map.valueSet() {
            print(val)
        }
    }
}
