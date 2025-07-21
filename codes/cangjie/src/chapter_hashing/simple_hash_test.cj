/**
 * File: simple_hash_test.cj
 * Created Time: 2025-06-25
 * Author: jan_huber (jan_huber@163.com)
 */

package cangjie.chapter_hashing

import std.unittest.testmacro.*
import std.unittest.*

/* Driver Code */
@Test
func testSimpleHash() {
    let key = "Hello 算法 algo"

    var hash = addHash(key)
    println("加法哈希值为 ${hash}")

    hash = mulHash(key)
    println("乘法哈希值为 ${hash}")

    hash = xorHash(key)
    println("异或哈希值为 ${hash}")

    hash = rotHash(key)
    println("旋转哈希值为 ${hash}")
}
