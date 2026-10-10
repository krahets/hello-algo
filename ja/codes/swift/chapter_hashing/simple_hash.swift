/**
 * File: simple_hash.swift
 * Created Time: 2023-07-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 加算ハッシュ */
func addHash(key: String) -> Int {
    var hash = 0
    let MODULUS = 1_000_000_007
    for c in key {
        for scalar in c.unicodeScalars {
            hash = (hash + Int(scalar.value)) % MODULUS
        }
    }
    return hash
}

/* 乗算ハッシュ */
func mulHash(key: String) -> Int {
    var hash = 0
    let MODULUS = 1_000_000_007
    for c in key {
        for scalar in c.unicodeScalars {
            hash = (31 * hash + Int(scalar.value)) % MODULUS
        }
    }
    return hash
}

/* XOR ハッシュ */
func xorHash(key: String) -> Int {
    var hash = 0
    let MODULUS = 1_000_000_007
    for c in key {
        for scalar in c.unicodeScalars {
            hash ^= Int(scalar.value)
        }
    }
    return hash & MODULUS
}

/* 回転ハッシュ */
func rotHash(key: String) -> Int {
    var hash = 0
    let MODULUS = 1_000_000_007
    for c in key {
        for scalar in c.unicodeScalars {
            hash = ((hash << 4) ^ (hash >> 28) ^ Int(scalar.value)) % MODULUS
        }
    }
    return hash
}

@main
enum SimpleHash {
    /* Driver Code */
    static func main() {
        let key = "Hello アルゴリズム"

        var hash = addHash(key: key)
        print("加算ハッシュ値は \(hash)")

        hash = mulHash(key: key)
        print("乗算ハッシュ値は \(hash)")

        hash = xorHash(key: key)
        print("XORハッシュ値は \(hash)")

        hash = rotHash(key: key)
        print("回転ハッシュ値は \(hash)")
    }
}
