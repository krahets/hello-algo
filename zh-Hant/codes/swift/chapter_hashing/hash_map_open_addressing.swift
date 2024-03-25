/**
 * File: hash_map_open_addressing.swift
 * Created Time: 2023-06-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 開放定址雜湊表 */
class HashMapOpenAddressing {
    var size: Int // 鍵值對數量
    var capacity: Int // 雜湊表容量
    var loadThres: Double // 觸發擴容的負載因子閾值
    var extendRatio: Int // 擴容倍數
    var buckets: [Pair?] // 桶陣列
    var TOMBSTONE: Pair // 刪除標記

    /* 建構子 */
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

    /* 搜尋 key 對應的桶索引 */
    func findBucket(key: Int) -> Int {
        var index = hashFunc(key: key)
        var firstTombstone = -1
        // 線性探查，當遇到空桶時跳出
        while buckets[index] != nil {
            // 若遇到 key ，返回對應的桶索引
            if buckets[index]!.key == key {
                // 若之前遇到了刪除標記，則將鍵值對移動至該索引處
                if firstTombstone != -1 {
                    buckets[firstTombstone] = buckets[index]
                    buckets[index] = TOMBSTONE
                    return firstTombstone // 返回移動後的桶索引
                }
                return index // 返回桶索引
            }
            // 記錄遇到的首個刪除標記
            if firstTombstone == -1 && buckets[index] == TOMBSTONE {
                firstTombstone = index
            }
            // 計算桶索引，越過尾部則返回頭部
            index = (index + 1) % capacity
        }
        // 若 key 不存在，則返回新增點的索引
        return firstTombstone == -1 ? index : firstTombstone
    }

    /* 查詢操作 */
    func get(key: Int) -> String? {
        // 搜尋 key 對應的桶索引
        let index = findBucket(key: key)
        // 若找到鍵值對，則返回對應 val
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            return buckets[index]!.val
        }
        // 若鍵值對不存在，則返回 null
        return nil
    }

    /* 新增操作 */
    func put(key: Int, val: String) {
        // 當負載因子超過閾值時，執行擴容
        if loadFactor() > loadThres {
            extend()
        }
        // 搜尋 key 對應的桶索引
        let index = findBucket(key: key)
        // 若找到鍵值對，則覆蓋 val 並返回
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            buckets[index]!.val = val
            return
        }
        // 若鍵值對不存在，則新增該鍵值對
        buckets[index] = Pair(key: key, val: val)
        size += 1
    }

    /* 刪除操作 */
    func remove(key: Int) {
        // 搜尋 key 對應的桶索引
        let index = findBucket(key: key)
        // 若找到鍵值對，則用刪除標記覆蓋它
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            buckets[index] = TOMBSTONE
            size -= 1
        }
    }

    /* 擴容雜湊表 */
    func extend() {
        // 暫存原雜湊表
        let bucketsTmp = buckets
        // 初始化擴容後的新雜湊表
        capacity *= extendRatio
        buckets = Array(repeating: nil, count: capacity)
        size = 0
        // 將鍵值對從原雜湊表搬運至新雜湊表
        for pair in bucketsTmp {
            if let pair, pair != TOMBSTONE {
                put(key: pair.key, val: pair.val)
            }
        }
    }

    /* 列印雜湊表 */
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
        /* 初始化雜湊表 */
        let map = HashMapOpenAddressing()

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
        let name = map.get(key: 13276)
        print("\n輸入學號 13276 ，查詢到姓名 \(name!)")

        /* 刪除操作 */
        // 在雜湊表中刪除鍵值對 (key, value)
        map.remove(key: 16750)
        print("\n刪除 16750 後，雜湊表為\nKey -> Value")
        map.print()
    }
}
