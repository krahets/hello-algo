/**
 * File: simple_hash.swift
 * Created Time: 2023-07-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Additive hashing */
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

/* Multiplicative hashing */
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

/* XOR hashing */
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

/* Rotation hashing */
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
    /* Driver code */
    static func main() {
        let key = "Hello 算法"

        var hash = addHash(key: key)
        print("Additive hash value: \(hash)")

        hash = mulHash(key: key)
        print("Multiplicative hash value: \(hash)")

        hash = xorHash(key: key)
        print("XOR hash value: \(hash)")

        hash = rotHash(key: key)
        print("Rotation hash value: \(hash)")
    }
}
