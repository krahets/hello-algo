/**
 * File: array_hash_map.swift
 * Created Time: 2023-01-16
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 配列で実装したハッシュ表 */
class ArrayHashMap {
    private var buckets: [Pair?]

    init() {
        // 100 個のバケットを持つ配列を初期化する
        buckets = Array(repeating: nil, count: 100)
    }

    /* ハッシュ関数 */
    private func hashFunc(key: Int) -> Int {
        let index = key % 100
        return index
    }

    /* 検索 */
    func get(key: Int) -> String? {
        let index = hashFunc(key: key)
        let pair = buckets[index]
        return pair?.val
    }

    /* 追加 */
    func put(key: Int, val: String) {
        let pair = Pair(key: key, val: val)
        let index = hashFunc(key: key)
        buckets[index] = pair
    }

    /* 削除 */
    func remove(key: Int) {
        let index = hashFunc(key: key)
        // nil を代入して削除する
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

    /* ハッシュ表を表示する */
    func print() {
        for pair in pairSet() {
            Swift.print("\(pair.key) -> \(pair.val)")
        }
    }
}

@main
enum _ArrayHashMap {
    /* 実行例 */
    static func main() {
        /* ハッシュ表を初期化する */
        let map = ArrayHashMap()

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
        let name = map.get(key: 15937)!
        print("\n学籍番号 15937 に対応する名前は \(name)")

        /* 削除 */
        // ハッシュ表からペア (key, value) を削除する
        map.remove(key: 10583)
        print("\n10583 を削除した後のハッシュ表\nKey -> Value")
        map.print()

        /* ハッシュ表を走査する */
        print("\nキーと値のペアを順に表示 Key->Value")
        for pair in map.pairSet() {
            print("\(pair.key) -> \(pair.val)")
        }
        print("\nキーだけを順に表示 Key")
        for key in map.keySet() {
            print(key)
        }
        print("\n値だけを順に表示 Value")
        for val in map.valueSet() {
            print(val)
        }
    }
}
