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
    var loadThres: Double // Load factor threshold that triggers capacity growth
    var extendRatio: Int // Capacity growth factor
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

    /* Lookup operation */
    func get(key: Int) -> String? {
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // Traverse the bucket; if key is found, return its corresponding val
        for pair in bucket {
            if pair.key == key {
                return pair.val
            }
        }
        // Return nil if key is not found
        return nil
    }

    /* Insert operation */
    func put(key: Int, val: String) {
        // Grow the capacity when the load factor exceeds the threshold
        if loadFactor() > loadThres {
            extend()
        }
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // Traverse the bucket; if the specified key is found, update its val and return
        for pair in bucket {
            if pair.key == key {
                pair.val = val
                return
            }
        }
        // If key is absent, append the key-value pair at the end
        let pair = Pair(key: key, val: val)
        buckets[index].append(pair)
        size += 1
    }

    /* Remove operation */
    func remove(key: Int) {
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // Traverse the bucket and remove the key-value pair
        for (pairIndex, pair) in bucket.enumerated() {
            if pair.key == key {
                buckets[index].remove(at: pairIndex)
                size -= 1
                break
            }
        }
    }

    /* Grow the hash table capacity */
    func extend() {
        // Save the original bucket array
        let bucketsTmp = buckets
        // Initialize a new hash table with the expanded capacity
        capacity *= extendRatio
        buckets = Array(repeating: [], count: capacity)
        size = 0
        // Move the key-value pairs from the original hash table to the new one
        for bucket in bucketsTmp {
            for pair in bucket {
                put(key: pair.key, val: pair.val)
            }
        }
    }

    /* Print the hash table */
    func print() {
        for bucket in buckets {
            let res = bucket.map { "\($0.key) -> \($0.val)" }
            Swift.print(res)
        }
    }
}

@main
enum _HashMapChaining {
    /* Driver code */
    static func main() {
        /* Initialize the hash table */
        let map = HashMapChaining()

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
        let name = map.get(key: 13276)
        print("\nLooking up student ID 13276 gives the name \(name!)")

        /* Remove operation */
        // Remove the key-value pair (key, value) from the hash table
        map.remove(key: 12836)
        print("\nHash table after removing 12836:\nKey -> Value")
        map.print()
    }
}
