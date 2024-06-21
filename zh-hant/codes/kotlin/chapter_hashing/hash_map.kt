/**
 * File: hash_map.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

import utils.printHashMap

/* Driver Code */
fun main() {
    /* 初始化雜湊表 */
    val map = HashMap<Int, String>()

    /* 新增操作 */
    // 在雜湊表中新增鍵值對 (key, value)
    map[12836] = "小哈"
    map[15937] = "小囉"
    map[16750] = "小算"
    map[13276] = "小法"
    map[10583] = "小鴨"
    println("\n新增完成後，雜湊表為\nKey -> Value")
    printHashMap(map)

    /* 查詢操作 */
    // 向雜湊表中輸入鍵 key ，得到值 value
    val name = map[15937]
    println("\n輸入學號 15937 ，查詢到姓名 $name")

    /* 刪除操作 */
    // 在雜湊表中刪除鍵值對 (key, value)
    map.remove(10583)
    println("\n刪除 10583 後，雜湊表為\nKey -> Value")
    printHashMap(map)

    /* 走訪雜湊表 */
    println("\n走訪鍵值對 Key->Value")
    for ((key, value) in map) {
        println("$key -> $value")
    }
    println("\n單獨走訪鍵 Key")
    for (key in map.keys) {
        println(key)
    }
    println("\n單獨走訪值 Value")
    for (_val in map.values) {
        println(_val)
    }
}