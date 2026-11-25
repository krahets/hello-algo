/**
 * File: hash_map.swift
 * Created Time: 2023-01-16
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

@main
enum HashMap {
    /* 実行例 */
    static func main() {
        /* ハッシュ表を初期化する */
        var map: [Int: String] = [:]

        /* 追加 */
        // ハッシュ表にペア (key, value) を追加する
        map[12836] = "小哈"
        map[15937] = "小啰"
        map[16750] = "小算"
        map[13276] = "小法"
        map[10583] = "小鸭"
        print("\n追加後のハッシュ表\nKey -> Value")
        PrintUtil.printHashMap(map: map)

        /* 検索 */
        // ハッシュ表でキー key に対応する値 value を取得する
        let name = map[15937]!
        print("\n学籍番号 15937 に対応する名前は \(name)")

        /* 削除 */
        // ハッシュ表からペア (key, value) を削除する
        map.removeValue(forKey: 10583)
        print("\n10583 を削除した後のハッシュ表\nKey -> Value")
        PrintUtil.printHashMap(map: map)

        /* ハッシュ表を走査する */
        print("\nキーと値のペアを順に表示 Key->Value")
        for (key, value) in map {
            print("\(key) -> \(value)")
        }
        print("\nキーだけを順に表示 Key")
        for key in map.keys {
            print(key)
        }
        print("\n値だけを順に表示 Value")
        for value in map.values {
            print(value)
        }
    }
}
