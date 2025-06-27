/**
 * File: built_in_hash_test.cj
 * Created Time: 2025-06-25
 * Author: jan_huber (jan_huber@163.com)
 */
package cangjie.chapter_hashing

import std.unittest.testmacro.*
import std.unittest.*

/* Driver Code */
@Test
func built_in_hash_test() {
    let num = 3
    let hashNum = num.hashCode()
    println("整数 ${num} 的哈希值为 ${hashNum}")

    let bol = true
    let hashBol = bol.hashCode()
    println("布尔量 ${bol} 的哈希值为 ${hashBol}")

    let rune = r'a'
    let hashRune = rune.hashCode()
    println("字符 ${rune} 的哈希值为 ${hashRune}")

    let float = 3.14159
    let hashDec = float.hashCode()
    println("小数 ${float} 的哈希值为 ${hashDec}")

    let str = "Hello 算法"
    let hashStr = str.hashCode()
    println("字符串 ${str} 的哈希值为 ${hashStr}")
}
