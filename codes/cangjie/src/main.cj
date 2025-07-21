/**
 * File: main.cj
 * Created Time: 2025-06-21
 * Author: jan_huber (jan_huber@163.com)
 */

package cangjie
import std.collection.ArrayList
import cangjie.utils.*

import std.sort.*
 import std.collection.*



main(): Int64 {

 /* 初始化哈希表 */
    let map = HashMap<Int64, String>()

/* 遍历哈希表 */
    // 遍历键值对 key->value
    for ((key, value) in map) {
        println("${key} -> ${value}")
    }

    // 单独遍历键 key
    for (key in map.keys()) {
        println(key)
    }

    // 单独遍历值 value
    for (value in map.values()) {
        println(value)
    }
    return 0
}
