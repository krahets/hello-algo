/**
 * File: array_hash_map.swift
 * Created Time: 2023-01-16
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Hash table based on array implementation */
class ArrayHashMap {
    private var buckets: [Pair?]

    init() {
        // Initialize an array, containing 100 buckets
        buckets = Array(repeating: nil, count: 100)
    }

    /* Hash function */
    private func hashFunc(key: Int) -> Int {
        let index = key % 100
        return index
    }

    /* Query operation */
    func get(key: Int) -> String? {
        let index = hashFunc(key: key)
        let pair = buckets[index]
        return pair?.val
    }

    /* Add operation */
    func put(key: Int, val: String) {
        let pair = Pair(key: key, val: val)
        let index = hashFunc(key: key)
        buckets[index] = pair
    }

    /* Remove operation */
    func remove(key: Int) {
        let index = hashFunc(key: key)
        // Set to nil, representing removal
        buckets[index] = nil
    }

    /* Get all key-value pairs */
    func pairSet() -> [Pair] {
        buckets.compactMap { $0 }
    }

    /* Get all keys */
    func keySet() -> [Int] {
        buckets.compactMap { $0?.key }
    }

    /* Get all values */
    func valueSet() -> [String] {
        buckets.compactMap { $0?.val }
    }

    /* Print hash table */
    func print() {
        for pair in pairSet() {
            Swift.print("\(pair.key) -> \(pair.val)")
        }
    }
}

@main
enum _ArrayHashMap {
    /* Driver Code */
    static func main() {
        /* Initialize hash table */
        let map = ArrayHashMap()

        /* Add operation */
        // Add key-value pair (key, value) to the hash table
        map.put(key: 12836, val: "Ha")
        map.put(key: 15937, val: "Luo")
        map.put(key: 16750, val: "Suan")
        map.put(key: 13276, val: "Fa")
        map.put(key: 10583, val: "Ya")
        print("\nAfter adding, the hash table is\nKey -> Value")
        map.print()

        /* Query operation */
        // Enter key to the hash table, get value
        let name = map.get(key: 15937)!
        print("\nInput student ID 15937, found name \(name)")

        /* Remove operation */
        // Remove key-value pair (key, value) from the hash table
        map.remove(key: 10583)
        print("\nAfter removing 10583, the hash table is\nKey -> Value")
        map.print()

        /* Traverse hash table */
        print("\nTraverse key-value pairs Key->Value")
        for pair in map.pairSet() {
            print("\(pair.key) -> \(pair.val)")
        }
        print("\nIndividually traverse keys Key")
        for key in map.keySet() {
            print(key)
        }
        print("\nIndividually traverse values Value")
        for val in map.valueSet() {
            print(val)
        }
    }
}
