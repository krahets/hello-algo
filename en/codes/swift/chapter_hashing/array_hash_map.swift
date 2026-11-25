/**
 * File: array_hash_map.swift
 * Created Time: 2023-01-16
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Array-based hash table */
class ArrayHashMap {
    private var buckets: [Pair?]

    init() {
        // Initialize an array with 100 buckets
        buckets = Array(repeating: nil, count: 100)
    }

    /* Hash function */
    private func hashFunc(key: Int) -> Int {
        let index = key % 100
        return index
    }

    /* Look up a value */
    func get(key: Int) -> String? {
        let index = hashFunc(key: key)
        let pair = buckets[index]
        return pair?.val
    }

    /* Insert a key-value pair */
    func put(key: Int, val: String) {
        let pair = Pair(key: key, val: val)
        let index = hashFunc(key: key)
        buckets[index] = pair
    }

    /* Remove a key-value pair */
    func remove(key: Int) {
        let index = hashFunc(key: key)
        // Set the slot to nil to remove the entry
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

    /* Print the hash table */
    func print() {
        for pair in pairSet() {
            Swift.print("\(pair.key) -> \(pair.val)")
        }
    }
}

@main
enum _ArrayHashMap {
    /* Driver code */
    static func main() {
        /* Initialize the hash table */
        let map = ArrayHashMap()

        /* Insert a key-value pair */
        // Insert the pair (key, value) into the hash table
        map.put(key: 12836, val: "Xiao Ha")
        map.put(key: 15937, val: "Xiao Luo")
        map.put(key: 16750, val: "Xiao Suan")
        map.put(key: 13276, val: "Xiao Fa")
        map.put(key: 10583, val: "Xiao Ya")
        print("\nHash table after insertion:\nKey -> Value")
        map.print()

        /* Look up a value */
        // Look up key in the hash table to get value
        let name = map.get(key: 15937)!
        print("\nName for student ID 15937: \(name)")

        /* Remove a key-value pair */
        // Remove the pair (key, value) from the hash table
        map.remove(key: 10583)
        print("\nHash table after removing 10583:\nKey -> Value")
        map.print()

        /* Iterate over the hash table */
        print("\nIterate over key-value pairs (Key->Value)")
        for pair in map.pairSet() {
            print("\(pair.key) -> \(pair.val)")
        }
        print("\nIterate over keys only")
        for key in map.keySet() {
            print(key)
        }
        print("\nIterate over values only")
        for val in map.valueSet() {
            print(val)
        }
    }
}
