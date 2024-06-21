/**
 * File: simple_hash.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

/* 加法哈希 */
fun addHash(key: String): Int {
    var hash = 0L
    val MODULUS = 1000000007
    for (c in key.toCharArray()) {
        hash = (hash + c.code) % MODULUS
    }
    return hash.toInt()
}

/* 乘法哈希 */
fun mulHash(key: String): Int {
    var hash = 0L
    val MODULUS = 1000000007
    for (c in key.toCharArray()) {
        hash = (31 * hash + c.code) % MODULUS
    }
    return hash.toInt()
}

/* 异或哈希 */
fun xorHash(key: String): Int {
    var hash = 0
    val MODULUS = 1000000007
    for (c in key.toCharArray()) {
        hash = hash xor c.code
    }
    return hash and MODULUS
}

/* 旋转哈希 */
fun rotHash(key: String): Int {
    var hash = 0L
    val MODULUS = 1000000007
    for (c in key.toCharArray()) {
        hash = ((hash shl 4) xor (hash shr 28) xor c.code.toLong()) % MODULUS
    }
    return hash.toInt()
}

/* Driver Code */
fun main() {
    val key = "Hello 算法"

    var hash = addHash(key)
    println("加法哈希值为 $hash")

    hash = mulHash(key)
    println("乘法哈希值为 $hash")

    hash = xorHash(key)
    println("异或哈希值为 $hash")

    hash = rotHash(key)
    println("旋转哈希值为 $hash")
}