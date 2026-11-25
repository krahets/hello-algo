/**
 * File: hash_map_chaining.swift
 * Created Time: 2023-06-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Hash table with chaining */
class HashMapChaining {
    var size: Int // Number of key-value pairs
    var capacity: Int // Hash table capacity
    var loadThres: Double // Load factor threshold for resizing
    var extendRatio: Int // Growth factor
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

    /* Look up a value */
    func get(key: Int) -> String? {
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // Scan the bucket and return the corresponding val if key is found
        for pair in bucket {
            if pair.key == key {
                return pair.val
            }
        }
        // Return nil if key is absent
        return nil
    }

    /* Insert a key-value pair */
    func put(key: Int, val: String) {
        // Expand the table when the load factor exceeds the threshold
        if loadFactor() > loadThres {
            extend()
        }
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // Scan the bucket. If the specified key is found, update its val and return
        for pair in bucket {
            if pair.key == key {
                pair.val = val
                return
            }
        }
        // If key is absent, append the pair to the end of the list
        let pair = Pair(key: key, val: val)
        buckets[index].append(pair)
        size += 1
    }

    /* Remove a key-value pair */
    func remove(key: Int) {
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // Scan the bucket and remove the pair
        for (pairIndex, pair) in bucket.enumerated() {
            if pair.key == key {
                buckets[index].remove(at: pairIndex)
                size -= 1
                break
            }
        }
    }

    /* Expand the hash table */
    func extend() {
        // Save the original hash table
        let bucketsTmp = buckets
        // Initialize the larger hash table
        capacity *= extendRatio
        buckets = Array(repeating: [], count: capacity)
        size = 0
        // Move the key-value pairs from the old table into the new one
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
        let name = map.get(key: 13276)
        print("\nName for student ID 13276: \(name!)")

        /* Remove a key-value pair */
        // Remove the pair (key, value) from the hash table
        map.remove(key: 12836)
        print("\nHash table after removing 12836:\nKey -> Value")
        map.print()
    }
}
