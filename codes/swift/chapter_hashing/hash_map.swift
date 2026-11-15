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
        // [region]{init_hash_map}
        /* 初始化哈希表 */
        var map: [Int: String] = [:]
        // [endregion]{init_hash_map}

        // [region]{add_pairs}
        /* 添加操作 */
        // 在哈希表中添加键值对 (key, value)
        map[12836] = "小哈"
        map[15937] = "小啰"
        map[16750] = "小算"
        map[13276] = "小法"
        map[10583] = "小鸭"
        // [endregion]{add_pairs}
        print("\n添加完成后，哈希表为\nKey -> Value")
        PrintUtil.printHashMap(map: map)

        // [region]{get_value}
        /* 查询操作 */
        // 向哈希表中输入键 key ，得到值 value
        let name = map[15937]!
        // [endregion]{get_value}
        print("\n输入学号 15937 ，查询到姓名 \(name)")

        // [region]{remove_pair}
        /* 删除操作 */
        // 在哈希表中删除键值对 (key, value)
        map.removeValue(forKey: 10583)
        // [endregion]{remove_pair}
        print("\n删除 10583 后，哈希表为\nKey -> Value")
        PrintUtil.printHashMap(map: map)

        print("\n遍历键值对 Key->Value")
        // [region]{iterate_pairs}
        /* 遍历哈希表 */
        // 遍历键值对 key->value
        for (key, value) in map {
            print("\(key) -> \(value)")
        }
        // [endregion]{iterate_pairs}

        print("\n单独遍历键 Key")
        // [region]{iterate_keys}
        // 单独遍历键 key
        for key in map.keys {
            print(key)
        }
        // [endregion]{iterate_keys}

        print("\n单独遍历值 Value")
        // [region]{iterate_values}
        // 单独遍历值 value
        for value in map.values {
            print(value)
        }
        // [endregion]{iterate_values}
    }
}
