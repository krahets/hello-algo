/**
 * File: simple_hash.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

/* Аддитивное хеширование */
fun addHash(key: String): Int {
    var hash = 0L
    val MODULUS = 1000000007
    for (c in key.toCharArray()) {
        hash = (hash + c.code) % MODULUS
    }
    return hash.toInt()
}

/* Мультипликативное хеширование */
fun mulHash(key: String): Int {
    var hash = 0L
    val MODULUS = 1000000007
    for (c in key.toCharArray()) {
        hash = (31 * hash + c.code) % MODULUS
    }
    return hash.toInt()
}

/* Хеширование с помощью XOR */
fun xorHash(key: String): Int {
    var hash = 0
    val MODULUS = 1000000007
    for (c in key.toCharArray()) {
        hash = hash xor c.code
    }
    return hash and MODULUS
}

/* Хеширование с циклическим сдвигом */
fun rotHash(key: String): Int {
    var hash = 0L
    val MODULUS = 1000000007
    for (c in key.toCharArray()) {
        hash = ((hash shl 4) xor (hash shr 28) xor c.code.toLong()) % MODULUS
    }
    return hash.toInt()
}

/* Демонстрационный код */
fun main() {
    val key = "Hello 算法"

    var hash = addHash(key)
    println("Аддитивный хеш: $hash")

    hash = mulHash(key)
    println("Мультипликативный хеш: $hash")

    hash = xorHash(key)
    println("Хеш на основе XOR: $hash")

    hash = rotHash(key)
    println("Хеш с циклическим сдвигом: $hash")
}