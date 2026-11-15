/**
 * File: hash_map.swift
 * Created Time: 2023-01-16
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

@main
enum HashMap {
    /* 実行用コード */
    static func main() {
        // [region]{init_hash_map}
        /* ハッシュテーブルを初期化する */
        var map: [Int: String] = [:]
        // [endregion]{init_hash_map}

        // [region]{add_pairs}
        /* 追加操作 */
        // ハッシュテーブルにキーと値のペア (key, value) を追加する
        map[12836] = "小哈"
        map[15937] = "小啰"
        map[16750] = "小算"
        map[13276] = "小法"
        map[10583] = "小鸭"
        // [endregion]{add_pairs}
        print("\n追加後のハッシュテーブル\nKey -> Value")
        PrintUtil.printHashMap(map: map)

        // [region]{get_value}
        /* 取得操作 */
        // ハッシュテーブルにキー key を渡し、値 value を取得する
        let name = map[15937]!
        // [endregion]{get_value}
        print("\n学生番号 15937 に対応する氏名は \(name)")

        // [region]{remove_pair}
        /* 削除操作 */
        // ハッシュテーブルからキーと値のペア (key, value) を削除する
        map.removeValue(forKey: 10583)
        // [endregion]{remove_pair}
        print("\n10583 を削除した後のハッシュテーブル\nKey -> Value")
        PrintUtil.printHashMap(map: map)

        print("\nキーと値のペア Key->Value を走査する")
        // [region]{iterate_pairs}
        /* ハッシュテーブルを走査する */
        // キーと値のペア key->value を走査する
        for (key, value) in map {
            print("\(key) -> \(value)")
        }
        // [endregion]{iterate_pairs}

        print("\nキー Key だけを走査する")
        // [region]{iterate_keys}
        // キー key だけを走査する
        for key in map.keys {
            print(key)
        }
        // [endregion]{iterate_keys}

        print("\n値 Value だけを走査する")
        // [region]{iterate_values}
        // 値 value だけを走査する
        for value in map.values {
            print(value)
        }
        // [endregion]{iterate_values}
    }
}
