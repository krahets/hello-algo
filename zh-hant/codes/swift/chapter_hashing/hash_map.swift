/**
 * File: hash_map.swift
 * Created Time: 2023-01-16
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

@main
enum HashMap {
    /* 主程式 */
    static func main() {
        /* 初始化雜湊表 */
        var map: [Int: String] = [:]

        /* 新增操作 */
        // 在雜湊表中新增鍵值對 (key, value)
        map[12836] = "小哈"
        map[15937] = "小囉"
        map[16750] = "小算"
        map[13276] = "小法"
        map[10583] = "小鴨"
        print("\n新增後的雜湊表\nKey -> Value")
        PrintUtil.printHashMap(map: map)

        /* 查詢操作 */
        // 輸入鍵 key，從雜湊表取得對應的值 value
        let name = map[15937]!
        print("\n輸入學號 15937，查得姓名 \(name)")

        /* 刪除操作 */
        // 從雜湊表刪除鍵值對 (key, value)
        map.removeValue(forKey: 10583)
        print("\n刪除 10583 後的雜湊表\nKey -> Value")
        PrintUtil.printHashMap(map: map)

        /* 走訪雜湊表 */
        print("\n走訪鍵值對 Key->Value")
        for (key, value) in map {
            print("\(key) -> \(value)")
        }
        print("\n只走訪鍵 Key")
        for key in map.keys {
            print(key)
        }
        print("\n只走訪值 Value")
        for value in map.values {
            print(value)
        }
    }
}
