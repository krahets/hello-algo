/**
 * File: simple_hash.cj
 * Created Time: 2025-06-25
 * Author: jan_huber (jan_huber@163.com)
 */

package cangjie.chapter_hashing

/* 加法哈希 */
func addHash(key: String): Int64 {
    var hash = 0
    const MODULUS = 1000000007
    for (r in key.toRuneArray()) {
        hash = (hash + Int64(UInt32(r))) % MODULUS
    }
    return hash
}

/* 乘法哈希 */
func mulHash(key: String): Int64 {
    var hash = 0
    const MODULUS = 1000000007
    for (r in key.toRuneArray()) {
        hash = (31 * hash + Int64(UInt32(r))) % MODULUS
    }
    return hash
}

/* 异或哈希 */
func xorHash(key: String): Int64 {
    var hash = 0
    const MODULUS = 1000000007
    for (r in key.toRuneArray()) {
        hash ^= Int64(UInt32(r))
    }
    return hash & MODULUS
}

/* 旋转哈希 */
func rotHash(key: String): Int64 {
    var hash = 0;
    const MODULUS = 1000000007
    for (r in key.toRuneArray()) {
        hash = ((hash << 4) ^ (hash >> 28) ^ Int64(UInt32(r))) % MODULUS
    }
    return hash
}
