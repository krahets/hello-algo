/**
 * File: hash_map_chaining.swift
 * Created Time: 2023-06-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* チェイン法ハッシュテーブル */
class HashMapChaining {
    var size: Int // キーと値のペア数
    var capacity: Int // ハッシュテーブル容量
    var loadThres: Double // リサイズを発動する負荷率のしきい値
    var extendRatio: Int // 拡張倍率
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

    /* 検索操作 */
    func get(key: Int) -> String? {
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // バケットを走査し、key が見つかれば対応する val を返す
        for pair in bucket {
            if pair.key == key {
                return pair.val
            }
        }
        // `key` が見つからなければ `nil` を返す
        return nil
    }

    /* 追加操作 */
    func put(key: Int, val: String) {
        // 負荷率がしきい値を超えたら、リサイズを実行
        if loadFactor() > loadThres {
            extend()
        }
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // バケットを走査し、指定した key が見つかれば対応する val を更新して返す
        for pair in bucket {
            if pair.key == key {
                pair.val = val
                return
            }
        }
        // その key が存在しなければ、キーと値のペアを末尾に追加
        let pair = Pair(key: key, val: val)
        buckets[index].append(pair)
        size += 1
    }

    /* 削除操作 */
    func remove(key: Int) {
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // バケットを走査してキーと値のペアを削除
        for (pairIndex, pair) in bucket.enumerated() {
            if pair.key == key {
                buckets[index].remove(at: pairIndex)
                size -= 1
                break
            }
        }
    }

    /* ハッシュテーブルを拡張 */
    func extend() {
        // 元のハッシュテーブルを一時保存
        let bucketsTmp = buckets
        // リサイズ後の新しいハッシュテーブルを初期化
        capacity *= extendRatio
        buckets = Array(repeating: [], count: capacity)
        size = 0
        // キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルへ移す
        for bucket in bucketsTmp {
            for pair in bucket {
                put(key: pair.key, val: pair.val)
            }
        }
    }

    /* ハッシュテーブルを出力 */
    func print() {
        for bucket in buckets {
            let res = bucket.map { "\($0.key) -> \($0.val)" }
            Swift.print(res)
        }
    }
}

@main
enum _HashMapChaining {
    /* Driver Code */
    static func main() {
        /* ハッシュテーブルを初期化 */
        let map = HashMapChaining()

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
        let name = map.get(key: 13276)
        print("\n学籍番号 13276 を入力すると、名前 \(name!) が見つかりました")

        /* 削除操作 */
        // ハッシュテーブルからキーと値のペア (key, value) を削除
        map.remove(key: 12836)
        print("\n12836 を削除後、ハッシュテーブルは\nKey -> Value")
        map.print()
    }
}
