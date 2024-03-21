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
        /* 初始化哈希表 */
        var map: [Int: String] = [:]

        /* 添加操作 */
        // 在哈希表中添加键值对 (key, value)
        map[12836] = "小哈"
        map[15937] = "小啰"
        map[16750] = "小算"
        map[13276] = "小法"
        map[10583] = "小鸭"
        print("\n添加完成后，哈希表为\nKey -> Value")
        PrintUtil.printHashMap(map: map)

        /* 查询操作 */
        // 向哈希表中输入键 key ，得到值 value
        let name = map[15937]!
        print("\n输入学号 15937 ，查询到姓名 \(name)")

        /* 删除操作 */
        // 在哈希表中删除键值对 (key, value)
        map.removeValue(forKey: 10583)
        print("\n删除 10583 后，哈希表为\nKey -> Value")
        PrintUtil.printHashMap(map: map)

        /* 遍历哈希表 */
        print("\n遍历键值对 Key->Value")
        for (key, value) in map {
            print("\(key) -> \(value)")
        }
        print("\n单独遍历键 Key")
        for key in map.keys {
            print(key)
        }
        print("\n单独遍历值 Value")
        for value in map.values {
            print(value)
        }
    }
}
