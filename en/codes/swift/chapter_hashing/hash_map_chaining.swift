/**
 * File: hash_map_chaining.swift
 * Created Time: 2023-06-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Chained address hash table */
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
        // Traverse the bucket, if the key is found, return the corresponding val
        for pair in bucket {
            if pair.key == key {
                return pair.val
            }
        }
        // If key not found, return nil
        return nil
    }

    /* Add operation */
    func put(key: Int, val: String) {
        // When the load factor exceeds the threshold, perform expansion
        if loadFactor() > loadThres {
            extend()
        }
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // Traverse the bucket, if the specified key is encountered, update the corresponding val and return
        for pair in bucket {
            if pair.key == key {
                pair.val = val
                return
            }
        }
        // If the key is not found, add the key-value pair to the end
        let pair = Pair(key: key, val: val)
        buckets[index].append(pair)
        size += 1
    }

    /* Remove operation */
    func remove(key: Int) {
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // Traverse the bucket, remove the key-value pair from it
        for (pairIndex, pair) in bucket.enumerated() {
            if pair.key == key {
                buckets[index].remove(at: pairIndex)
                size -= 1
                break
            }
        }
    }

    /* Extend hash table */
    func extend() {
        // Temporarily store the original hash table
        let bucketsTmp = buckets
        // Initialize the extended new hash table
        capacity *= extendRatio
        buckets = Array(repeating: [], count: capacity)
        size = 0
        // Move key-value pairs from the original hash table to the new hash table
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
        map.put(key: 12836, val: "Ha")
        map.put(key: 15937, val: "Luo")
        map.put(key: 16750, val: "Suan")
        map.put(key: 13276, val: "Fa")
        map.put(key: 10583, val: "Ya")
        print("\nAfter adding, the hash table is\nKey -> Value")
        map.print()

        /* Query operation */
        // Enter key to the hash table, get value
        let name = map.get(key: 13276)
        print("\nInput student ID 13276, found name \(name!)")

        /* Remove operation */
        // Remove key-value pair (key, value) from the hash table
        map.remove(key: 12836)
        print("\nAfter removing 12836, the hash table is\nKey -> Value")
        map.print()
    }
}
