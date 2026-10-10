/**
 * File: hash_map.swift
 * Created Time: 2023-01-16
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

@main
enum HashMap {
    /* Driver Code */
    static func main() {
        /* ハッシュテーブルを初期化 */
        var map: [Int: String] = [:]

        /* 追加操作 */
        // ハッシュテーブルにキーと値のペア (key, value) を追加
        map[12836] = "シャオハー"
        map[15937] = "シャオルオ"
        map[16750] = "シャオスワン"
        map[13276] = "シャオファー"
        map[10583] = "シャオヤー"
        print("\n追加完了後のハッシュテーブルは\nKey -> Value")
        PrintUtil.printHashMap(map: map)

        /* 検索操作 */
        // キー key をハッシュテーブルに渡し、値 value を取得
        let name = map[15937]!
        print("\n学籍番号 15937 を入力すると、名前 \(name) が見つかりました")

        /* 削除操作 */
        // ハッシュテーブルからキーと値のペア (key, value) を削除
        map.removeValue(forKey: 10583)
        print("\n10583 を削除後のハッシュテーブルは\nKey -> Value")
        PrintUtil.printHashMap(map: map)

        /* ハッシュテーブルを走査 */
        print("\nキーと値の組 Key->Value を走査")
        for (key, value) in map {
            print("\(key) -> \(value)")
        }
        print("\nキー Key を個別に走査")
        for key in map.keys {
            print(key)
        }
        print("\n値 Value を個別に走査")
        for value in map.values {
            print(value)
        }
    }
}
