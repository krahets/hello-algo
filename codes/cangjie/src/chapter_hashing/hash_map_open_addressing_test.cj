/**
 * File: hash_map_open_addressing_test.cj
 * Created Time: 2025-06-24
 * Author: jan_huber (jan_huber@163.com)
 */
package cangjie.chapter_hashing

import std.unittest.testmacro.*
import std.unittest.*

/* Driver Code */
@Test
func testHashMapOpenAddressing() {
    // 初始化哈希表
    let hashmap = HashMapOpenAddressing()

    // 添加操作
    // 在哈希表中添加键值对 (key, val)
    hashmap.put(12836, "小哈")
    hashmap.put(15937, "小啰")
    hashmap.put(16750, "小算")
    hashmap.put(13276, "小法")
    hashmap.put(10583, "小鸭")
    println("\n添加完成后，哈希表为\nKey -> Value")
    hashmap.print()

    // 查询操作
    // 向哈希表中输入键 key ，得到值 val
    let name = hashmap.get(13276)
    println("\n输入学号 13276 ，查询到姓名 ${name}")

    // 删除操作
    // 在哈希表中删除键值对 (key, val)
    hashmap.remove(16750)
    println("\n删除 16750 后，哈希表为\nKey -> Value")
    hashmap.print()
}
