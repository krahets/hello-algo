/**
 * File: hash_map_open_addressing.swift
 * Created Time: 2023-06-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* オープンアドレス法ハッシュテーブル */
class HashMapOpenAddressing {
    var size: Int // キーと値のペア数
    var capacity: Int // ハッシュテーブル容量
    var loadThres: Double // リサイズを発動する負荷率のしきい値
    var extendRatio: Int // 拡張倍率
    var buckets: [Pair?] // バケット配列
    var TOMBSTONE: Pair // 削除済みマーク

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

    /* key に対応するバケットインデックスを探す */
    func findBucket(key: Int) -> Int {
        var index = hashFunc(key: key)
        var firstTombstone = -1
        // 線形プロービングを行い、空バケットに達したら終了
        while buckets[index] != nil {
            // key が見つかったら、対応するバケットのインデックスを返す
            if buckets[index]!.key == key {
                // 以前に削除マークが見つかっていれば、そのインデックスへキーと値のペアを移動
                if firstTombstone != -1 {
                    buckets[firstTombstone] = buckets[index]
                    buckets[index] = TOMBSTONE
                    return firstTombstone // 移動後のバケットインデックスを返す
                }
                return index // バケットのインデックスを返す
            }
            // 最初に見つかった削除マークを記録
            if firstTombstone == -1 && buckets[index] == TOMBSTONE {
                firstTombstone = index
            }
            // バケットのインデックスを計算し、末尾を越えたら先頭に戻る
            index = (index + 1) % capacity
        }
        // key が存在しない場合は追加位置のインデックスを返す
        return firstTombstone == -1 ? index : firstTombstone
    }

    /* 検索操作 */
    func get(key: Int) -> String? {
        // key に対応するバケットインデックスを探す
        let index = findBucket(key: key)
        // キーと値の組が見つかったら、対応する val を返す
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            return buckets[index]!.val
        }
        // キーと値の組が存在しなければ null を返す
        return nil
    }

    /* 追加操作 */
    func put(key: Int, val: String) {
        // 負荷率がしきい値を超えたら、リサイズを実行
        if loadFactor() > loadThres {
            extend()
        }
        // key に対応するバケットインデックスを探す
        let index = findBucket(key: key)
        // キーと値の組が見つかったら、val を上書きして返す
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            buckets[index]!.val = val
            return
        }
        // キーと値の組が存在しない場合は、その組を追加する
        buckets[index] = Pair(key: key, val: val)
        size += 1
    }

    /* 削除操作 */
    func remove(key: Int) {
        // key に対応するバケットインデックスを探す
        let index = findBucket(key: key)
        // キーと値の組が見つかったら、削除マーカーで上書きする
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            buckets[index] = TOMBSTONE
            size -= 1
        }
    }

    /* ハッシュテーブルを拡張 */
    func extend() {
        // 元のハッシュテーブルを一時保存
        let bucketsTmp = buckets
        // リサイズ後の新しいハッシュテーブルを初期化
        capacity *= extendRatio
        buckets = Array(repeating: nil, count: capacity)
        size = 0
        // キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルへ移す
        for pair in bucketsTmp {
            if let pair, pair != TOMBSTONE {
                put(key: pair.key, val: pair.val)
            }
        }
    }

    /* ハッシュテーブルを出力 */
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
        /* ハッシュテーブルを初期化 */
        let map = HashMapOpenAddressing()

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
        map.remove(key: 16750)
        print("\n16750 を削除後、ハッシュテーブルは\nKey -> Value")
        map.print()
    }
}
