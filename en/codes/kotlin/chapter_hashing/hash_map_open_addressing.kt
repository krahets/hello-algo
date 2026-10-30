/**
 * File: hash_map_open_addressing.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

/* Hash table with open addressing */
class HashMapOpenAddressing {
    private var size: Int               // Number of key-value pairs
    private var capacity: Int           // Hash table capacity
    private val loadThres: Double       // Load factor threshold that triggers capacity growth
    private val extendRatio: Int        // Capacity growth factor
    private var buckets: Array<Pair?>   // Bucket array
    private val TOMBSTONE: Pair         // Tombstone marker

    /* Constructor */
    init {
        size = 0
        capacity = 4
        loadThres = 2.0 / 3.0
        extendRatio = 2
        buckets = arrayOfNulls(capacity)
        TOMBSTONE = Pair(-1, "-1")
    }

    /* Hash function */
    fun hashFunc(key: Int): Int {
        return key % capacity
    }

    /* Load factor */
    fun loadFactor(): Double {
        return (size / capacity).toDouble()
    }

    /* Find the bucket index for key */
    fun findBucket(key: Int): Int {
        var index = hashFunc(key)
        var firstTombstone = -1
        // Probe linearly until an empty bucket is reached
        while (buckets[index] != null) {
            // If key is found, return its bucket index
            if (buckets[index]?.key == key) {
                // If a tombstone was encountered earlier, move the key-value pair to that index
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index]
                    buckets[index] = TOMBSTONE
                    return firstTombstone // Return the bucket index after the move
                }
                return index // Return the bucket index
            }
            // Record the first tombstone encountered
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index
            }
            // Calculate the bucket index, wrapping to the beginning after the end
            index = (index + 1) % capacity
        }
        // If key is absent, return the index for insertion
        return if (firstTombstone == -1) index else firstTombstone
    }

    /* Lookup operation */
    fun get(key: Int): String? {
        // Find the bucket index for key
        val index = findBucket(key)
        // If the key-value pair is found, return its val
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index]?._val
        }
        // Return null if the key-value pair is absent
        return null
    }

    /* Insert operation */
    fun put(key: Int, _val: String) {
        // Grow the capacity when the load factor exceeds the threshold
        if (loadFactor() > loadThres) {
            extend()
        }
        // Find the bucket index for key
        val index = findBucket(key)
        // If the key-value pair is found, overwrite val and return
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index]!!._val = _val
            return
        }
        // If the key-value pair is absent, insert it
        buckets[index] = Pair(key, _val)
        size++
    }

    /* Remove operation */
    fun remove(key: Int) {
        // Find the bucket index for key
        val index = findBucket(key)
        // If the key-value pair is found, replace it with a tombstone
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE
            size--
        }
    }

    /* Grow the hash table capacity */
    fun extend() {
        // Keep a reference to the original hash table
        val bucketsTmp = buckets
        // Initialize a new hash table with the expanded capacity
        capacity *= extendRatio
        buckets = arrayOfNulls(capacity)
        size = 0
        // Move the key-value pairs from the original hash table to the new one
        for (pair in bucketsTmp) {
            if (pair != null && pair != TOMBSTONE) {
                put(pair.key, pair._val)
            }
        }
    }

    /* Print the hash table */
    fun print() {
        for (pair in buckets) {
            if (pair == null) {
                println("null")
            } else if (pair == TOMBSTONE) {
                println("TOMESTOME")
            } else {
                println("${pair.key} -> ${pair._val}")
            }
        }
    }
}

/* Driver code */
fun main() {
    // Initialize the hash table
    val hashmap = HashMapOpenAddressing()

    // Insert operation
    // Insert the key-value pair (key, val) into the hash table
    hashmap.put(12836, "小哈")
    hashmap.put(15937, "小啰")
    hashmap.put(16750, "小算")
    hashmap.put(13276, "小法")
    hashmap.put(10583, "小鸭")
    println("\nHash table after insertion:\nKey -> Value")
    hashmap.print()

    // Lookup operation
    // Look up key in the hash table to obtain val
    val name = hashmap.get(13276)
    println("\nLook up student ID 13276 to obtain the name $name")

    // Remove operation
    // Remove the key-value pair (key, val) from the hash table
    hashmap.remove(16750)
    println("\nHash table after removing 16750:\nKey -> Value")
    hashmap.print()
}