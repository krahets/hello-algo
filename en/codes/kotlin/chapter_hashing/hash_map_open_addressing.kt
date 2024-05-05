/**
 * File: hash_map_open_addressing.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

/* Open addressing hash table */
class HashMapOpenAddressing {
    private var size: Int               // Number of key-value pairs
    private var capacity: Int           // Hash table capacity
    private val loadThres: Double       // Load factor threshold for triggering expansion
    private val extendRatio: Int        // Expansion multiplier
    private var buckets: Array<Pair?>   // Bucket array
    private val TOMBSTONE: Pair         // Removal mark

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

    /* Search for the bucket index corresponding to key */
    fun findBucket(key: Int): Int {
        var index = hashFunc(key)
        var firstTombstone = -1
        // Linear probing, break when encountering an empty bucket
        while (buckets[index] != null) {
            // If the key is encountered, return the corresponding bucket index
            if (buckets[index]?.key == key) {
                // If a removal mark was encountered earlier, move the key-value pair to that index
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index]
                    buckets[index] = TOMBSTONE
                    return firstTombstone // Return the moved bucket index
                }
                return index // Return bucket index
            }
            // Record the first encountered removal mark
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index
            }
            // Calculate the bucket index, return to the head if exceeding the tail
            index = (index + 1) % capacity
        }
        // If the key does not exist, return the index of the insertion point
        return if (firstTombstone == -1) index else firstTombstone
    }

    /* Query operation */
    fun get(key: Int): String? {
        // Search for the bucket index corresponding to key
        val index = findBucket(key)
        // If the key-value pair is found, return the corresponding val
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index]?._val
        }
        // If the key-value pair does not exist, return null
        return null
    }

    /* Add operation */
    fun put(key: Int, _val: String) {
        // When the load factor exceeds the threshold, perform expansion
        if (loadFactor() > loadThres) {
            extend()
        }
        // Search for the bucket index corresponding to key
        val index = findBucket(key)
        // If the key-value pair is found, overwrite val and return
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index]!!._val = _val
            return
        }
        // If the key-value pair does not exist, add the key-value pair
        buckets[index] = Pair(key, _val)
        size++
    }

    /* Remove operation */
    fun remove(key: Int) {
        // Search for the bucket index corresponding to key
        val index = findBucket(key)
        // If the key-value pair is found, cover it with a removal mark
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE
            size--
        }
    }

    /* Extend hash table */
    fun extend() {
        // Temporarily store the original hash table
        val bucketsTmp = buckets
        // Initialize the extended new hash table
        capacity *= extendRatio
        buckets = arrayOfNulls(capacity)
        size = 0
        // Move key-value pairs from the original hash table to the new hash table
        for (pair in bucketsTmp) {
            if (pair != null && pair != TOMBSTONE) {
                put(pair.key, pair._val)
            }
        }
    }

    /* Print hash table */
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

/* Driver Code */
fun main() {
    // Initialize hash table
    val hashmap = HashMapOpenAddressing()

    // Add operation
    // Add key-value pair (key, val) to the hash table
    hashmap.put(12836, "Ha")
    hashmap.put(15937, "Luo")
    hashmap.put(16750, "Suan")
    hashmap.put(13276, "Fa")
    hashmap.put(10583, "Ya")
    println("\nAfter adding, the hash table is\nKey -> Value")
    hashmap.print()

    // Query operation
    // Enter key to the hash table, get value val
    val name = hashmap.get(13276)
    println("\nInput student ID 13276, found name $name")

    // Remove operation
    // Remove key-value pair (key, val) from the hash table
    hashmap.remove(16750)
    println("\nAfter removing 16750, the hash table is\nKey -> Value")
    hashmap.print()
}