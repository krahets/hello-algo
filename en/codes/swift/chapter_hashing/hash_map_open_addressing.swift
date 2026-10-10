/**
 * File: hash_map_open_addressing.swift
 * Created Time: 2023-06-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Hash table with open addressing */
class HashMapOpenAddressing {
    var size: Int // Number of key-value pairs
    var capacity: Int // Hash table capacity
    var loadThres: Double // Load factor threshold for triggering expansion
    var extendRatio: Int // Expansion multiplier
    var buckets: [Pair?] // Bucket array
    var TOMBSTONE: Pair // Removal marker

    /* Constructor */
    init() {
        size = 0
        capacity = 4
        loadThres = 2.0 / 3.0
        extendRatio = 2
        buckets = Array(repeating: nil, count: capacity)
        TOMBSTONE = Pair(key: -1, val: "-1")
    }

    /* Hash function */
    func hashFunc(key: Int) -> Int {
        key % capacity
    }

    /* Load factor */
    func loadFactor() -> Double {
        Double(size) / Double(capacity)
    }

    /* Search for bucket index corresponding to key */
    func findBucket(key: Int) -> Int {
        var index = hashFunc(key: key)
        var firstTombstone = -1
        // Linear probing, break when encountering an empty bucket
        while buckets[index] != nil {
            // If key is encountered, return the corresponding bucket index
            if buckets[index]!.key == key {
                // If a removal marker was encountered before, move the key-value pair to that index
                if firstTombstone != -1 {
                    buckets[firstTombstone] = buckets[index]
                    buckets[index] = TOMBSTONE
                    return firstTombstone // Return the moved bucket index
                }
                return index // Return bucket index
            }
            // Record the first removal marker encountered
            if firstTombstone == -1 && buckets[index] == TOMBSTONE {
                firstTombstone = index
            }
            // Calculate bucket index, wrap around to the head if past the tail
            index = (index + 1) % capacity
        }
        // If key does not exist, return the index for insertion
        return firstTombstone == -1 ? index : firstTombstone
    }

    /* Query operation */
    func get(key: Int) -> String? {
        // Search for bucket index corresponding to key
        let index = findBucket(key: key)
        // If key-value pair is found, return corresponding val
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            return buckets[index]!.val
        }
        // If key-value pair does not exist, return null
        return nil
    }

    /* Add operation */
    func put(key: Int, val: String) {
        // When load factor exceeds threshold, perform expansion
        if loadFactor() > loadThres {
            extend()
        }
        // Search for bucket index corresponding to key
        let index = findBucket(key: key)
        // If key-value pair is found, overwrite val and return
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            buckets[index]!.val = val
            return
        }
        // If key-value pair does not exist, add the key-value pair
        buckets[index] = Pair(key: key, val: val)
        size += 1
    }

    /* Remove operation */
    func remove(key: Int) {
        // Search for bucket index corresponding to key
        let index = findBucket(key: key)
        // If key-value pair is found, overwrite it with removal marker
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            buckets[index] = TOMBSTONE
            size -= 1
        }
    }

    /* Expand hash table */
    func extend() {
        // Temporarily store the original hash table
        let bucketsTmp = buckets
        // Initialize expanded new hash table
        capacity *= extendRatio
        buckets = Array(repeating: nil, count: capacity)
        size = 0
        // Move key-value pairs from original hash table to new hash table
        for pair in bucketsTmp {
            if let pair, pair != TOMBSTONE {
                put(key: pair.key, val: pair.val)
            }
        }
    }

    /* Print hash table */
    func print() {
        for pair in buckets {
            if pair == nil {
                Swift.print("null")
            } else if pair == TOMBSTONE {
                Swift.print("TOMBSTONE")
            } else {
                Swift.print("\(pair!.key) -> \(pair!.val)")
            }
        }
    }
}

@main
enum _HashMapOpenAddressing {
    /* Driver Code */
    static func main() {
        /* Initialize hash table */
        let map = HashMapOpenAddressing()

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
        map.remove(key: 16750)
        print("\nAfter removing 16750, hash table is\nKey -> Value")
        map.print()
    }
}
