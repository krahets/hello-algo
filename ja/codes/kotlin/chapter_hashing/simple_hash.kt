/**
 * File: simple_hash.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

/* 加算ハッシュ */
fun addHash(key: String): Int {
    var hash = 0L
    val MODULUS = 1000000007
    for (c in key.toCharArray()) {
        hash = (hash + c.code) % MODULUS
    }
    return hash.toInt()
}

/* 乗算ハッシュ */
fun mulHash(key: String): Int {
    var hash = 0L
    val MODULUS = 1000000007
    for (c in key.toCharArray()) {
        hash = (31 * hash + c.code) % MODULUS
    }
    return hash.toInt()
}

/* XOR ハッシュ */
fun xorHash(key: String): Int {
    var hash = 0
    val MODULUS = 1000000007
    for (c in key.toCharArray()) {
        hash = hash xor c.code
    }
    return hash and MODULUS
}

/* 回転ハッシュ */
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
    val key = "Hello アルゴリズム"

    var hash = addHash(key)
    println("加算ハッシュ値は $hash")

    hash = mulHash(key)
    println("乗算ハッシュ値は $hash")

    hash = xorHash(key)
    println("XORハッシュ値は $hash")

    hash = rotHash(key)
    println("回転ハッシュ値は $hash")
}