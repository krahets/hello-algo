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
    var loadThres: Double // Load factor threshold that triggers capacity growth
    var extendRatio: Int // Capacity growth factor
    var buckets: [Pair?] // Bucket array
    var TOMBSTONE: Pair // Tombstone marker

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

    /* Find the bucket index for key */
    func findBucket(key: Int) -> Int {
        var index = hashFunc(key: key)
        var firstTombstone = -1
        // Probe linearly until an empty bucket is reached
        while buckets[index] != nil {
            // If key is found, return its bucket index
            if buckets[index]!.key == key {
                // If a tombstone was encountered earlier, move the key-value pair to that index
                if firstTombstone != -1 {
                    buckets[firstTombstone] = buckets[index]
                    buckets[index] = TOMBSTONE
                    return firstTombstone // Return the bucket index after the move
                }
                return index // Return the bucket index
            }
            // Record the first tombstone encountered
            if firstTombstone == -1 && buckets[index] == TOMBSTONE {
                firstTombstone = index
            }
            // Calculate the bucket index, wrapping to the beginning after the end
            index = (index + 1) % capacity
        }
        // If key is absent, return the index for insertion
        return firstTombstone == -1 ? index : firstTombstone
    }

    /* Lookup operation */
    func get(key: Int) -> String? {
        // Find the bucket index for key
        let index = findBucket(key: key)
        // If the key-value pair is found, return its val
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            return buckets[index]!.val
        }
        // Return nil if the key-value pair is absent
        return nil
    }

    /* Insert operation */
    func put(key: Int, val: String) {
        // Grow the capacity when the load factor exceeds the threshold
        if loadFactor() > loadThres {
            extend()
        }
        // Find the bucket index for key
        let index = findBucket(key: key)
        // If the key-value pair is found, overwrite val and return
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            buckets[index]!.val = val
            return
        }
        // If the key-value pair is absent, insert it
        buckets[index] = Pair(key: key, val: val)
        size += 1
    }

    /* Remove operation */
    func remove(key: Int) {
        // Find the bucket index for key
        let index = findBucket(key: key)
        // If the key-value pair is found, replace it with a tombstone
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            buckets[index] = TOMBSTONE
            size -= 1
        }
    }

    /* Grow the hash table capacity */
    func extend() {
        // Save the original bucket array
        let bucketsTmp = buckets
        // Initialize a new hash table with the expanded capacity
        capacity *= extendRatio
        buckets = Array(repeating: nil, count: capacity)
        size = 0
        // Move the key-value pairs from the original hash table to the new one
        for pair in bucketsTmp {
            if let pair, pair != TOMBSTONE {
                put(key: pair.key, val: pair.val)
            }
        }
    }

    /* Print the hash table */
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
    /* Driver code */
    static func main() {
        /* Initialize the hash table */
        let map = HashMapOpenAddressing()

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
        map.remove(key: 16750)
        print("\nHash table after removing 16750:\nKey -> Value")
        map.print()
    }
}
