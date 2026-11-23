/**
 * File: hash_map_chaining.swift
 * Created Time: 2023-06-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* チェイン法のハッシュテーブル */
class HashMapChaining {
    var size: Int // キーと値のペアの数
    var capacity: Int // ハッシュテーブルの容量
    var loadThres: Double // 容量の拡張を開始する負荷率のしきい値
    var extendRatio: Int // 容量の拡張倍率
    var buckets: [[Pair]] // バケット配列

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

    /* 取得操作 */
    func get(key: Int) -> String? {
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // バケットを走査し、key が見つかったら対応する val を返す
        for pair in bucket {
            if pair.key == key {
                return pair.val
            }
        }
        // key が見つからなかった場合、nil を返す
        return nil
    }

    /* 追加操作 */
    func put(key: Int, val: String) {
        // 負荷率がしきい値を超えた場合、容量を拡張する
        if loadFactor() > loadThres {
            extend()
        }
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // バケットを走査し、指定された key が見つかったら、対応する val を更新して戻る
        for pair in bucket {
            if pair.key == key {
                pair.val = val
                return
            }
        }
        // key が存在しない場合、キーと値のペアを末尾に追加する
        let pair = Pair(key: key, val: val)
        buckets[index].append(pair)
        size += 1
    }

    /* 削除操作 */
    func remove(key: Int) {
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // バケットを走査し、キーと値のペアを削除する
        for (pairIndex, pair) in bucket.enumerated() {
            if pair.key == key {
                buckets[index].remove(at: pairIndex)
                size -= 1
                break
            }
        }
    }

    /* ハッシュテーブルの容量を拡張する */
    func extend() {
        // 元のハッシュテーブルを一時保存する
        let bucketsTmp = buckets
        // 拡張後の新しいハッシュテーブルを初期化する
        capacity *= extendRatio
        buckets = Array(repeating: [], count: capacity)
        size = 0
        // キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルに移す
        for bucket in bucketsTmp {
            for pair in bucket {
                put(key: pair.key, val: pair.val)
            }
        }
    }

    /* ハッシュテーブルを表示する */
    func print() {
        for bucket in buckets {
            let res = bucket.map { "\($0.key) -> \($0.val)" }
            Swift.print(res)
        }
    }
}

@main
enum _HashMapChaining {
    /* 実行用コード */
    static func main() {
        /* ハッシュテーブルを初期化する */
        let map = HashMapChaining()

        /* 追加操作 */
        // ハッシュテーブルにキーと値のペア (key, value) を追加する
        map.put(key: 12836, val: "小哈")
        map.put(key: 15937, val: "小啰")
        map.put(key: 16750, val: "小算")
        map.put(key: 13276, val: "小法")
        map.put(key: 10583, val: "小鸭")
        print("\n追加後のハッシュテーブル\nKey -> Value")
        map.print()

        /* 取得操作 */
        // ハッシュテーブルにキー key を渡し、値 value を取得する
        let name = map.get(key: 13276)
        print("\n学生番号 13276 に対応する氏名は \(name!)")

        /* 削除操作 */
        // ハッシュテーブルからキーと値のペア (key, value) を削除する
        map.remove(key: 12836)
        print("\n12836 を削除した後のハッシュテーブル\nKey -> Value")
        map.print()
    }
}
