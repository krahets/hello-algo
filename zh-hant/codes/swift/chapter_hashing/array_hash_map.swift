/**
 * File: array_hash_map.swift
 * Created Time: 2023-01-16
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 以陣列實作的雜湊表 */
class ArrayHashMap {
    private var buckets: [Pair?]

    init() {
        // 初始化包含 100 個桶的陣列
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
        // 設為 nil，表示刪除
        buckets[index] = nil
    }

    /* 取得所有鍵值對 */
    func pairSet() -> [Pair] {
        buckets.compactMap { $0 }
    }

    /* 取得所有鍵 */
    func keySet() -> [Int] {
        buckets.compactMap { $0?.key }
    }

    /* 取得所有值 */
    func valueSet() -> [String] {
        buckets.compactMap { $0?.val }
    }

    /* 印出雜湊表 */
    func print() {
        for pair in pairSet() {
            Swift.print("\(pair.key) -> \(pair.val)")
        }
    }
}

@main
enum _ArrayHashMap {
    /* 主程式 */
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
        print("\n新增後的雜湊表\nKey -> Value")
        map.print()

        /* 查詢操作 */
        // 輸入鍵 key，從雜湊表取得對應的值 value
        let name = map.get(key: 15937)!
        print("\n輸入學號 15937，查得姓名 \(name)")

        /* 刪除操作 */
        // 從雜湊表刪除鍵值對 (key, value)
        map.remove(key: 10583)
        print("\n刪除 10583 後的雜湊表\nKey -> Value")
        map.print()

        /* 走訪雜湊表 */
        print("\n走訪鍵值對 Key->Value")
        for pair in map.pairSet() {
            print("\(pair.key) -> \(pair.val)")
        }
        print("\n只走訪鍵 Key")
        for key in map.keySet() {
            print(key)
        }
        print("\n只走訪值 Value")
        for val in map.valueSet() {
            print(val)
        }
    }
}
