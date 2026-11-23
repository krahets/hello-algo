/**
 * File: array_hash_map.swift
 * Created Time: 2023-01-16
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 配列で実装したハッシュテーブル */
class ArrayHashMap {
    private var buckets: [Pair?]

    init() {
        // 100 個のバケットを含む配列を初期化する
        buckets = Array(repeating: nil, count: 100)
    }

    /* ハッシュ関数 */
    private func hashFunc(key: Int) -> Int {
        let index = key % 100
        return index
    }

    /* 取得操作 */
    func get(key: Int) -> String? {
        let index = hashFunc(key: key)
        let pair = buckets[index]
        return pair?.val
    }

    /* 追加操作 */
    func put(key: Int, val: String) {
        let pair = Pair(key: key, val: val)
        let index = hashFunc(key: key)
        buckets[index] = pair
    }

    /* 削除操作 */
    func remove(key: Int) {
        let index = hashFunc(key: key)
        // nil に設定して、削除を表す
        buckets[index] = nil
    }

    /* キーと値のペアをすべて取得する */
    func pairSet() -> [Pair] {
        buckets.compactMap { $0 }
    }

    /* すべてのキーを取得する */
    func keySet() -> [Int] {
        buckets.compactMap { $0?.key }
    }

    /* すべての値を取得する */
    func valueSet() -> [String] {
        buckets.compactMap { $0?.val }
    }

    /* ハッシュテーブルを表示する */
    func print() {
        for pair in pairSet() {
            Swift.print("\(pair.key) -> \(pair.val)")
        }
    }
}

@main
enum _ArrayHashMap {
    /* 実行用コード */
    static func main() {
        /* ハッシュテーブルを初期化する */
        let map = ArrayHashMap()

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
        let name = map.get(key: 15937)!
        print("\n学生番号 15937 に対応する氏名は \(name)")

        /* 削除操作 */
        // ハッシュテーブルからキーと値のペア (key, value) を削除する
        map.remove(key: 10583)
        print("\n10583 を削除した後のハッシュテーブル\nKey -> Value")
        map.print()

        /* ハッシュテーブルを走査する */
        print("\nキーと値のペア Key->Value を走査する")
        for pair in map.pairSet() {
            print("\(pair.key) -> \(pair.val)")
        }
        print("\nキー Key だけを走査する")
        for key in map.keySet() {
            print(key)
        }
        print("\n値 Value だけを走査する")
        for val in map.valueSet() {
            print(val)
        }
    }
}
