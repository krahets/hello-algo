/**
 * File: hash_map_chaining_test.cj
 * Created Time: 2025-06-24
 * Author: jan_huber (jan_huber@163.com)
 */
package cangjie.chapter_hashing

import std.unittest.testmacro.*
import std.unittest.*

/* Driver Code */
@Test
func testHashMapChaining() {
    /* 初始化哈希表 */
    let map = HashMapChaining()

    /* 添加操作 */
    // 在哈希表中添加键值对 (key, value)
    map.put(12836, "小哈")
    map.put(15937, "小啰")
    map.put(16750, "小算")
    map.put(13276, "小法")
    map.put(10583, "小鸭")
    println("\n添加完成后，哈希表为\nKey -> Value")
    map.print()

    /* 查询操作 */
    // 向哈希表中输入键 key ，得到值 value
    let name = map.get(13276)
    println("\n输入学号 13276 ，查询到姓名 ${name}")

    /* 删除操作 */
    // 在哈希表中删除键值对 (key, value)
    map.remove(12836)
    println("\n删除 12836 后，哈希表为\nKey -> Value")
    map.print()
}
