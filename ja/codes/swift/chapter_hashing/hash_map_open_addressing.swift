/**
 * File: hash_map_open_addressing.swift
 * Created Time: 2023-06-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* オープンアドレス法のハッシュテーブル */
class HashMapOpenAddressing {
    var size: Int // キーと値のペアの数
    var capacity: Int // ハッシュテーブルの容量
    var loadThres: Double // 容量の拡張を開始する負荷率のしきい値
    var extendRatio: Int // 容量の拡張倍率
    var buckets: [Pair?] // バケット配列
    var TOMBSTONE: Pair // 削除マーカー

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

    /* key に対応するバケットのインデックスを探索する */
    func findBucket(key: Int) -> Int {
        var index = hashFunc(key: key)
        var firstTombstone = -1
        // 線形探索法で探索し、空のバケットに到達したら終了する
        while buckets[index] != nil {
            // key が見つかった場合、対応するバケットのインデックスを返す
            if buckets[index]!.key == key {
                // それ以前に削除マーカーが見つかっていれば、そのインデックスにキーと値のペアを移す
                if firstTombstone != -1 {
                    buckets[firstTombstone] = buckets[index]
                    buckets[index] = TOMBSTONE
                    return firstTombstone // 移動後のバケットのインデックスを返す
                }
                return index // バケットのインデックスを返す
            }
            // 最初に見つかった削除マーカーを記録する
            if firstTombstone == -1 && buckets[index] == TOMBSTONE {
                firstTombstone = index
            }
            // バケットのインデックスを計算し、末尾を越えたら先頭に戻る
            index = (index + 1) % capacity
        }
        // key が存在しない場合、追加位置のインデックスを返す
        return firstTombstone == -1 ? index : firstTombstone
    }

    /* 取得操作 */
    func get(key: Int) -> String? {
        // key に対応するバケットのインデックスを探索する
        let index = findBucket(key: key)
        // キーと値のペアが見つかった場合、対応する val を返す
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            return buckets[index]!.val
        }
        // キーと値のペアが存在しない場合、null を返す
        return nil
    }

    /* 追加操作 */
    func put(key: Int, val: String) {
        // 負荷率がしきい値を超えた場合、容量を拡張する
        if loadFactor() > loadThres {
            extend()
        }
        // key に対応するバケットのインデックスを探索する
        let index = findBucket(key: key)
        // キーと値のペアが見つかった場合、val を上書きして戻る
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            buckets[index]!.val = val
            return
        }
        // キーと値のペアが存在しない場合、そのペアを追加する
        buckets[index] = Pair(key: key, val: val)
        size += 1
    }

    /* 削除操作 */
    func remove(key: Int) {
        // key に対応するバケットのインデックスを探索する
        let index = findBucket(key: key)
        // キーと値のペアが見つかった場合、削除マーカーで上書きする
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            buckets[index] = TOMBSTONE
            size -= 1
        }
    }

    /* ハッシュテーブルの容量を拡張する */
    func extend() {
        // 元のハッシュテーブルを一時保存する
        let bucketsTmp = buckets
        // 拡張後の新しいハッシュテーブルを初期化する
        capacity *= extendRatio
        buckets = Array(repeating: nil, count: capacity)
        size = 0
        // キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルに移す
        for pair in bucketsTmp {
            if let pair, pair != TOMBSTONE {
                put(key: pair.key, val: pair.val)
            }
        }
    }

    /* ハッシュテーブルを表示する */
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
    /* 実行用コード */
    static func main() {
        /* ハッシュテーブルを初期化する */
        let map = HashMapOpenAddressing()

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
        map.remove(key: 16750)
        print("\n16750 を削除した後のハッシュテーブル\nKey -> Value")
        map.print()
    }
}
