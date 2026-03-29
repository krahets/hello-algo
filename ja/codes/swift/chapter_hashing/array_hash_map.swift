/**
 * File: array_hash_map.swift
 * Created Time: 2023-01-16
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 配列ベースのハッシュテーブル */
class ArrayHashMap {
    private var buckets: [Pair?]

    init() {
        // 100 個のバケットを含む配列を初期化
        buckets = Array(repeating: nil, count: 100)
    }

    /* ハッシュ関数 */
    private func hashFunc(key: Int) -> Int {
        let index = key % 100
        return index
    }

    /* 検索操作 */
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
        // nil に設定し、削除を表す
        buckets[index] = nil
    }

    /* すべてのキーと値のペアを取得 */
    func pairSet() -> [Pair] {
        buckets.compactMap { $0 }
    }

    /* すべてのキーを取得 */
    func keySet() -> [Int] {
        buckets.compactMap { $0?.key }
    }

    /* すべての値を取得 */
    func valueSet() -> [String] {
        buckets.compactMap { $0?.val }
    }

    /* ハッシュテーブルを出力 */
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
        /* ハッシュテーブルを初期化 */
        let map = ArrayHashMap()

        /* 追加操作 */
        // ハッシュテーブルにキーと値のペア (key, value) を追加
        map.put(key: 12836, val: "シャオハー")
        map.put(key: 15937, val: "シャオルオ")
        map.put(key: 16750, val: "シャオスワン")
        map.put(key: 13276, val: "シャオファー")
        map.put(key: 10583, val: "シャオヤー")
        print("\n追加完了後のハッシュテーブルは\nKey -> Value")
        map.print()

        /* 検索操作 */
        // キー key をハッシュテーブルに渡し、値 value を取得
        let name = map.get(key: 15937)!
        print("\n学籍番号 15937 を入力すると、名前 \(name) が見つかりました")

        /* 削除操作 */
        // ハッシュテーブルからキーと値のペア (key, value) を削除
        map.remove(key: 10583)
        print("\n10583 を削除後のハッシュテーブルは\nKey -> Value")
        map.print()

        /* ハッシュテーブルを走査 */
        print("\nキーと値の組 Key->Value を走査")
        for pair in map.pairSet() {
            print("\(pair.key) -> \(pair.val)")
        }
        print("\nキー Key を個別に走査")
        for key in map.keySet() {
            print(key)
        }
        print("\n値 Value を個別に走査")
        for val in map.valueSet() {
            print(val)
        }
    }
}
