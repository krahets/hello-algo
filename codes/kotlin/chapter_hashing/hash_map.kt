/**
 * File: hash_map.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

import utils.printHashMap

/* Driver Code */
fun main() {
    // [region]{init_hash_map}
    /* 初始化哈希表 */
    val map = HashMap<Int, String>()
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
    println("\n添加完成后，哈希表为\nKey -> Value")
    printHashMap(map)

    // [region]{get_value}
    /* 查询操作 */
    // 向哈希表中输入键 key ，得到值 value
    val name = map[15937]
    // [endregion]{get_value}
    println("\n输入学号 15937 ，查询到姓名 $name")

    // [region]{remove_pair}
    /* 删除操作 */
    // 在哈希表中删除键值对 (key, value)
    map.remove(10583)
    // [endregion]{remove_pair}
    println("\n删除 10583 后，哈希表为\nKey -> Value")
    printHashMap(map)

    println("\n遍历键值对 Key->Value")
    // [region]{iterate_pairs}
    /* 遍历哈希表 */
    // 遍历键值对 key->value
    for ((key, value) in map) {
        println("$key -> $value")
    }
    // [endregion]{iterate_pairs}

    println("\n单独遍历键 Key")
    // [region]{iterate_keys}
    // 单独遍历键 key
    for (key in map.keys) {
        println(key)
    }
    // [endregion]{iterate_keys}

    println("\n单独遍历值 Value")
    // [region]{iterate_values}
    // 单独遍历值 value
    for (_val in map.values) {
        println(_val)
    }
    // [endregion]{iterate_values}
}