/**
 * File: hash_map_open_addressing.swift
 * Created Time: 2023-06-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 採用開放定址法的雜湊表 */
class HashMapOpenAddressing {
    var size: Int // 鍵值對數量
    var capacity: Int // 雜湊表容量
    var loadThres: Double // 觸發容量擴充的負載因子門檻
    var extendRatio: Int // 容量擴充倍數
    var buckets: [Pair?] // 桶陣列
    var TOMBSTONE: Pair // 刪除標記

    /* 建構方法 */
    init() {
        size = 0
        capacity = 4
        loadThres = 2.0 / 3.0
        extendRatio = 2
        buckets = Array(repeating: nil, count: capacity)
        TOMBSTONE = Pair(key: -1, val: "-1")
    }

    /* 雜湊函式 */
    func hashFunc(key: Int) -> Int {
        key % capacity
    }

    /* 負載因子 */
    func loadFactor() -> Double {
        Double(size) / Double(capacity)
    }

    /* 尋找 key 對應的桶索引 */
    func findBucket(key: Int) -> Int {
        var index = hashFunc(key: key)
        var firstTombstone = -1
        // 進行線性探測，遇到空桶就跳出迴圈
        while buckets[index] != nil {
            // 若遇到 key，回傳對應的桶索引
            if buckets[index]!.key == key {
                // 若先前遇過刪除標記，將鍵值對移到該標記所在的索引位置
                if firstTombstone != -1 {
                    buckets[firstTombstone] = buckets[index]
                    buckets[index] = TOMBSTONE
                    return firstTombstone // 回傳移動後的桶索引
                }
                return index // 回傳桶索引
            }
            // 記錄遇到的第一個刪除標記
            if firstTombstone == -1 && buckets[index] == TOMBSTONE {
                firstTombstone = index
            }
            // 計算桶索引，超過陣列尾端就回到開頭
            index = (index + 1) % capacity
        }
        // 若 key 不存在，回傳可插入位置的索引
        return firstTombstone == -1 ? index : firstTombstone
    }

    /* 查詢操作 */
    func get(key: Int) -> String? {
        // 尋找 key 對應的桶索引
        let index = findBucket(key: key)
        // 若找到鍵值對，回傳對應的 val
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            return buckets[index]!.val
        }
        // 若鍵值對不存在，回傳 null
        return nil
    }

    /* 新增操作 */
    func put(key: Int, val: String) {
        // 當負載因子超過門檻時，擴充容量
        if loadFactor() > loadThres {
            extend()
        }
        // 尋找 key 對應的桶索引
        let index = findBucket(key: key)
        // 若找到鍵值對，覆寫 val 並結束操作
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            buckets[index]!.val = val
            return
        }
        // 若鍵值對不存在，新增該鍵值對
        buckets[index] = Pair(key: key, val: val)
        size += 1
    }

    /* 刪除操作 */
    func remove(key: Int) {
        // 尋找 key 對應的桶索引
        let index = findBucket(key: key)
        // 若找到鍵值對，以刪除標記取代它
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            buckets[index] = TOMBSTONE
            size -= 1
        }
    }

    /* 擴充雜湊表容量 */
    func extend() {
        // 暫存原本的雜湊表
        let bucketsTmp = buckets
        // 初始化擴充後的新雜湊表
        capacity *= extendRatio
        buckets = Array(repeating: nil, count: capacity)
        size = 0
        // 將鍵值對從原本的雜湊表移到新表
        for pair in bucketsTmp {
            if let pair, pair != TOMBSTONE {
                put(key: pair.key, val: pair.val)
            }
        }
    }

    /* 印出雜湊表 */
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
    /* 主程式 */
    static func main() {
        /* 初始化雜湊表 */
        let map = HashMapOpenAddressing()

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
        map.remove(key: 16750)
        print("\n刪除 16750 後的雜湊表\nKey -> Value")
        map.print()
    }
}
