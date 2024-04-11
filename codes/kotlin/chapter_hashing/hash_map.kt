/**
 * File: hash_map.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

import utils.printHashMap

/* Driver Code */
fun main() {
    /* 初始化哈希表 */
    val map = HashMap<Int, String>()

    /* 添加操作 */
    // 在哈希表中添加键值对 (key, value)
    map[12836] = "小哈"
    map[15937] = "小啰"
    map[16750] = "小算"
    map[13276] = "小法"
    map[10583] = "小鸭"
    println("\n添加完成后，哈希表为\nKey -> Value")
    printHashMap(map)

    /* 查询操作 */
    // 向哈希表中输入键 key ，得到值 value
    val name = map[15937]
    println("\n输入学号 15937 ，查询到姓名 $name")

    /* 删除操作 */
    // 在哈希表中删除键值对 (key, value)
    map.remove(10583)
    println("\n删除 10583 后，哈希表为\nKey -> Value")
    printHashMap(map)

    /* 遍历哈希表 */
    println("\n遍历键值对 Key->Value")
    for ((key, value) in map) {
        println("$key -> $value")
    }
    println("\n单独遍历键 Key")
    for (key in map.keys) {
        println(key)
    }
    println("\n单独遍历值 Value")
    for (_val in map.values) {
        println(_val)
    }
}