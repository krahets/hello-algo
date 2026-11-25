/**
 * File: hash_map_open_addressing.swift
 * Created Time: 2023-06-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* オープンアドレス法によるハッシュ表 */
class HashMapOpenAddressing {
    var size: Int // キーと値のペアの数
    var capacity: Int // ハッシュ表の容量
    var loadThres: Double // 表を拡張する負荷率のしきい値
    var extendRatio: Int // 容量の拡張倍率
    var buckets: [Pair?] // バケットの配列
    var TOMBSTONE: Pair // 削除済みマーカー

    /* コンストラクタ */
    init() {
        size = 0
        capacity = 4
        loadThres = 2.0 / 3.0
        extendRatio = 2
        buckets = Array(repeating: nil, count: capacity)
        TOMBSTONE = Pair(key: -1, val: "-1")
    }

    /* ハッシュ関数 */
    func hashFunc(key: Int) -> Int {
        key % capacity
    }

    /* 負荷率 */
    func loadFactor() -> Double {
        Double(size) / Double(capacity)
    }

    /* key に対応するバケットのインデックスを探す */
    func findBucket(key: Int) -> Int {
        var index = hashFunc(key: key)
        var firstTombstone = -1
        // 線形探索を行い、空のバケットに出会ったらループを抜ける
        while buckets[index] != nil {
            // key が見つかったら、そのバケットのインデックスを返す
            if buckets[index]!.key == key {
                // それまでに削除済みマーカーが見つかっていれば、その位置にペアを移す
                if firstTombstone != -1 {
                    buckets[firstTombstone] = buckets[index]
                    buckets[index] = TOMBSTONE
                    return firstTombstone // 移動先のバケットのインデックスを返す
                }
                return index // バケットのインデックスを返す
            }
            // 最初に見つかった削除済みマーカーの位置を記録する
            if firstTombstone == -1 && buckets[index] == TOMBSTONE {
                firstTombstone = index
            }
            // 次のバケットのインデックスを計算し、末尾を越えたら先頭に戻る
            index = (index + 1) % capacity
        }
        // key がなければ挿入位置のインデックスを返す
        return firstTombstone == -1 ? index : firstTombstone
    }

    /* 検索 */
    func get(key: Int) -> String? {
        // key に対応するバケットのインデックスを探す
        let index = findBucket(key: key)
        // ペアが見つかったら対応する val を返す
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            return buckets[index]!.val
        }
        // ペアがなければ null を返す
        return nil
    }

    /* 追加 */
    func put(key: Int, val: String) {
        // 負荷率がしきい値を超えたら表を拡張する
        if loadFactor() > loadThres {
            extend()
        }
        // key に対応するバケットのインデックスを探す
        let index = findBucket(key: key)
        // ペアが見つかったら val を上書きして処理を終える
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            buckets[index]!.val = val
            return
        }
        // ペアがなければ新しく追加する
        buckets[index] = Pair(key: key, val: val)
        size += 1
    }

    /* 削除 */
    func remove(key: Int) {
        // key に対応するバケットのインデックスを探す
        let index = findBucket(key: key)
        // ペアが見つかったら削除済みマーカーで置き換える
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            buckets[index] = TOMBSTONE
            size -= 1
        }
    }

    /* ハッシュ表を拡張する */
    func extend() {
        // 元のハッシュ表を一時保存する
        let bucketsTmp = buckets
        // 拡張後の新しいハッシュ表を初期化する
        capacity *= extendRatio
        buckets = Array(repeating: nil, count: capacity)
        size = 0
        // 元のハッシュ表から新しい表にペアを移す
        for pair in bucketsTmp {
            if let pair, pair != TOMBSTONE {
                put(key: pair.key, val: pair.val)
            }
        }
    }

    /* ハッシュ表を表示する */
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
    /* 実行例 */
    static func main() {
        /* ハッシュ表を初期化する */
        let map = HashMapOpenAddressing()

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
        map.remove(key: 16750)
        print("\n16750 を削除した後のハッシュ表\nKey -> Value")
        map.print()
    }
}
