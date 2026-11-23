/**
 * File: array_hash_map.swift
 * Created Time: 2023-01-16
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Hash table implemented with an array */
class ArrayHashMap {
    private var buckets: [Pair?]

    init() {
        // Initialize an array containing 100 buckets
        buckets = Array(repeating: nil, count: 100)
    }

    /* Hash function */
    private func hashFunc(key: Int) -> Int {
        let index = key % 100
        return index
    }

    /* Lookup operation */
    func get(key: Int) -> String? {
        let index = hashFunc(key: key)
        let pair = buckets[index]
        return pair?.val
    }

    /* Insert operation */
    func put(key: Int, val: String) {
        let pair = Pair(key: key, val: val)
        let index = hashFunc(key: key)
        buckets[index] = pair
    }

    /* Remove operation */
    func remove(key: Int) {
        let index = hashFunc(key: key)
        // Set to nil to mark the entry as removed
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

        /* Insert operation */
        // Insert the key-value pair (key, value) into the hash table
        map.put(key: 12836, val: "小哈")
        map.put(key: 15937, val: "小啰")
        map.put(key: 16750, val: "小算")
        map.put(key: 13276, val: "小法")
        map.put(key: 10583, val: "小鸭")
        print("\nHash table after insertion:\nKey -> Value")
        map.print()

        /* Lookup operation */
        // Look up key in the hash table to obtain value
        let name = map.get(key: 15937)!
        print("\nLooking up student ID 15937 gives the name \(name)")

        /* Remove operation */
        // Remove the key-value pair (key, value) from the hash table
        map.remove(key: 10583)
        print("\nHash table after removing 10583:\nKey -> Value")
        map.print()

        /* Traverse the hash table */
        print("\nTraverse key-value pairs: Key->Value")
        for pair in map.pairSet() {
            print("\(pair.key) -> \(pair.val)")
        }
        print("\nTraverse keys only: Key")
        for key in map.keySet() {
            print(key)
        }
        print("\nTraverse values only: Value")
        for val in map.valueSet() {
            print(val)
        }
    }
}
