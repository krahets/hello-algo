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

/* XOR-хеширование */
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

/* Driver Code */
fun main() {
    val key = "Hello Algo"

    var hash = addHash(key)
    println("Хеш-сумма сложением = $hash")

    hash = mulHash(key)
    println("Хеш-сумма умножением = $hash")

    hash = xorHash(key)
    println("Хеш-сумма XOR = $hash")

    hash = rotHash(key)
    println("Хеш-сумма с циклическим сдвигом = $hash")
}