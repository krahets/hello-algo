/**
 * File: hash_map_chaining.swift
 * Created Time: 2023-06-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Hash table with separate chaining */
class HashMapChaining {
    var size: Int // Number of key-value pairs
    var capacity: Int // Hash table capacity
    var loadThres: Double // Load factor threshold for triggering expansion
    var extendRatio: Int // Expansion multiplier
    var buckets: [[Pair]] // Bucket array

    /* Constructor */
    init() {
        size = 0
        capacity = 4
        loadThres = 2.0 / 3.0
        extendRatio = 2
        buckets = Array(repeating: [], count: capacity)
    }

    /* Hash function */
    func hashFunc(key: Int) -> Int {
        key % capacity
    }

    /* Load factor */
    func loadFactor() -> Double {
        Double(size) / Double(capacity)
    }

    /* Query operation */
    func get(key: Int) -> String? {
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // Traverse bucket, if key is found, return corresponding val
        for pair in bucket {
            if pair.key == key {
                return pair.val
            }
        }
        // Return nil if key not found
        return nil
    }

    /* Add operation */
    func put(key: Int, val: String) {
        // When load factor exceeds threshold, perform expansion
        if loadFactor() > loadThres {
            extend()
        }
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // Traverse bucket, if specified key is encountered, update corresponding val and return
        for pair in bucket {
            if pair.key == key {
                pair.val = val
                return
            }
        }
        // If key does not exist, append key-value pair to the end
        let pair = Pair(key: key, val: val)
        buckets[index].append(pair)
        size += 1
    }

    /* Remove operation */
    func remove(key: Int) {
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // Traverse bucket and remove key-value pair from it
        for (pairIndex, pair) in bucket.enumerated() {
            if pair.key == key {
                buckets[index].remove(at: pairIndex)
                size -= 1
                break
            }
        }
    }

    /* Expand hash table */
    func extend() {
        // Temporarily store the original hash table
        let bucketsTmp = buckets
        // Initialize expanded new hash table
        capacity *= extendRatio
        buckets = Array(repeating: [], count: capacity)
        size = 0
        // Move key-value pairs from original hash table to new hash table
        for bucket in bucketsTmp {
            for pair in bucket {
                put(key: pair.key, val: pair.val)
            }
        }
    }

    /* Print hash table */
    func print() {
        for bucket in buckets {
            let res = bucket.map { "\($0.key) -> \($0.val)" }
            Swift.print(res)
        }
    }
}

@main
enum _HashMapChaining {
    /* Driver Code */
    static func main() {
        /* Initialize hash table */
        let map = HashMapChaining()

        /* Add operation */
        // Add key-value pair (key, value) to the hash table
        map.put(key: 12836, val: "Xiao Ha")
        map.put(key: 15937, val: "Xiao Luo")
        map.put(key: 16750, val: "Xiao Suan")
        map.put(key: 13276, val: "Xiao Fa")
        map.put(key: 10583, val: "Xiao Ya")
        print("\nAfter adding is complete, hash table is\nKey -> Value")
        map.print()

        /* Query operation */
        // Input key into hash table to get value
        let name = map.get(key: 13276)
        print("\nInput student ID 13276, found name \(name!)")

        /* Remove operation */
        // Remove key-value pair (key, value) from hash table
        map.remove(key: 12836)
        print("\nAfter removing 12836, hash table is\nKey -> Value")
        map.print()
    }
}
