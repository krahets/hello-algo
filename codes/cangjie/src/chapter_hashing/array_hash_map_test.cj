/**
 * File: array_hash_map_test.cj
 * Created Time: 2025-06-24
 * Author: jan_huber (jan_huber@163.com)
 */

package cangjie.chapter_hashing

import std.unittest.testmacro.*
import std.unittest.*

/* Driver Code */
@Test
func testArrayHashMap() {
    /* 初始化哈希表 */
    let map = ArrayHashMap()

    /* 添加操作 */
    // 在哈希表中添加键值对 (key, value)
    map.put(12836, "小哈")
    map.put(15937, "小啰")
    map.put(16750, "小算")
    map.put(13276, "小法")
    map.put(10583, "小鸭")
    println("\n添加完成后,哈希表为\nKey -> Value");
    map.print()

    /* 查询操作 */
    // 向哈希表中输入键 key ，得到值 value
    let name = map.get(15937)
    println("\n输入学号 15937,查询到姓名 ${name}")

    /* 删除操作 */
    // 在哈希表中删除键值对 (key, value)
    map.remove(10583)
    println("\n删除 10583 后,哈希表为\nKey -> Value")
    map.print()

    /* 遍历哈希表 */
    println("\n遍历键值对 Key->Value")
    for (kv in map.pairSet()) {
        println("${kv.key} -> ${kv.val}")
    }
    println("\n单独遍历键 Key")
    for (key in map.keySet()) {
        println(key)
    }
    println("\n单独遍历值 Value")
    for (val in map.valueSet()) {
        println(val)
    }
}
