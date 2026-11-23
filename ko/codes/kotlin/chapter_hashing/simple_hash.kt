/**
 * File: simple_hash.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

/* 덧셈 해시 */
fun addHash(key: String): Int {
    var hash = 0L
    val MODULUS = 1000000007
    for (c in key.toCharArray()) {
        hash = (hash + c.code) % MODULUS
    }
    return hash.toInt()
}

/* 곱셈 해시 */
fun mulHash(key: String): Int {
    var hash = 0L
    val MODULUS = 1000000007
    for (c in key.toCharArray()) {
        hash = (31 * hash + c.code) % MODULUS
    }
    return hash.toInt()
}

/* XOR 해시 */
fun xorHash(key: String): Int {
    var hash = 0
    val MODULUS = 1000000007
    for (c in key.toCharArray()) {
        hash = hash xor c.code
    }
    return hash and MODULUS
}

/* 회전 해시 */
fun rotHash(key: String): Int {
    var hash = 0L
    val MODULUS = 1000000007
    for (c in key.toCharArray()) {
        hash = ((hash shl 4) xor (hash shr 28) xor c.code.toLong()) % MODULUS
    }
    return hash.toInt()
}

/* 실행 코드 */
fun main() {
    val key = "Hello 算法"

    var hash = addHash(key)
    println("덧셈 해시값 = $hash")

    hash = mulHash(key)
    println("곱셈 해시값 = $hash")

    hash = xorHash(key)
    println("XOR 해시값 = $hash")

    hash = rotHash(key)
    println("회전 해시값 = $hash")
}