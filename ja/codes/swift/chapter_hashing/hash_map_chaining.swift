/**
 * File: hash_map_chaining.swift
 * Created Time: 2023-06-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* チェイン法によるハッシュ表 */
class HashMapChaining {
    var size: Int // キーと値のペアの数
    var capacity: Int // ハッシュ表の容量
    var loadThres: Double // 表を拡張する負荷率のしきい値
    var extendRatio: Int // 容量の拡張倍率
    var buckets: [[Pair]] // バケットの配列

    /* コンストラクタ */
    init() {
        size = 0
        capacity = 4
        loadThres = 2.0 / 3.0
        extendRatio = 2
        buckets = Array(repeating: [], count: capacity)
    }

    /* ハッシュ関数 */
    func hashFunc(key: Int) -> Int {
        key % capacity
    }

    /* 負荷率 */
    func loadFactor() -> Double {
        Double(size) / Double(capacity)
    }

    /* 検索 */
    func get(key: Int) -> String? {
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // バケットを走査し、key が見つかったら対応する val を返す
        for pair in bucket {
            if pair.key == key {
                return pair.val
            }
        }
        // key が見つからなければ nil を返す
        return nil
    }

    /* 追加 */
    func put(key: Int, val: String) {
        // 負荷率がしきい値を超えたら表を拡張する
        if loadFactor() > loadThres {
            extend()
        }
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // バケットを走査し、指定の key が見つかったら対応する val を更新して処理を終える
        for pair in bucket {
            if pair.key == key {
                pair.val = val
                return
            }
        }
        // key がなければ末尾にペアを追加する
        let pair = Pair(key: key, val: val)
        buckets[index].append(pair)
        size += 1
    }

    /* 削除 */
    func remove(key: Int) {
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // バケットを走査し、該当するペアを削除する
        for (pairIndex, pair) in bucket.enumerated() {
            if pair.key == key {
                buckets[index].remove(at: pairIndex)
                size -= 1
                break
            }
        }
    }

    /* ハッシュ表を拡張する */
    func extend() {
        // 元のハッシュ表を一時保存する
        let bucketsTmp = buckets
        // 拡張後の新しいハッシュ表を初期化する
        capacity *= extendRatio
        buckets = Array(repeating: [], count: capacity)
        size = 0
        // 元のハッシュ表から新しい表にペアを移す
        for bucket in bucketsTmp {
            for pair in bucket {
                put(key: pair.key, val: pair.val)
            }
        }
    }

    /* ハッシュ表を表示する */
    func print() {
        for bucket in buckets {
            let res = bucket.map { "\($0.key) -> \($0.val)" }
            Swift.print(res)
        }
    }
}

@main
enum _HashMapChaining {
    /* 実行例 */
    static func main() {
        /* ハッシュ表を初期化する */
        let map = HashMapChaining()

        /* 追加 */
        // ハッシュ表にペア (key, value) を追加する
        map.put(key: 12836, val: "小哈")
        map.put(key: 15937, val: "小啰")
        map.put(key: 16750, val: "小算")
        map.put(key: 13276, val: "小法")
        map.put(key: 10583, val: "小鸭")
        print("\n追加後のハッシュ表\nKey -> Value")
        map.print()

        /* 検索 */
        // ハッシュ表でキー key に対応する値 value を取得する
        let name = map.get(key: 13276)
        print("\n学籍番号 13276 に対応する名前は \(name!)")

        /* 削除 */
        // ハッシュ表からペア (key, value) を削除する
        map.remove(key: 12836)
        print("\n12836 を削除した後のハッシュ表\nKey -> Value")
        map.print()
    }
}
