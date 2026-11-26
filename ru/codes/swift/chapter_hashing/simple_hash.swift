/**
 * File: simple_hash.swift
 * Created Time: 2023-07-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Аддитивное хеширование */
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

/* Мультипликативное хеширование */
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

/* Хеширование с помощью XOR */
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

/* Хеширование с циклическим сдвигом */
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
    /* Демонстрационный код */
    static func main() {
        let key = "Hello 算法"

        var hash = addHash(key: key)
        print("Аддитивный хеш: \(hash)")

        hash = mulHash(key: key)
        print("Мультипликативный хеш: \(hash)")

        hash = xorHash(key: key)
        print("Хеш на основе XOR: \(hash)")

        hash = rotHash(key: key)
        print("Хеш с циклическим сдвигом: \(hash)")
    }
}
