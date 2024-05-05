/**
 * File: hash_map_chaining.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

/* Chained address hash table */
class HashMapChaining {
    var size: Int // Number of key-value pairs
    var capacity: Int // Hash table capacity
    val loadThres: Double // Load factor threshold for triggering expansion
    val extendRatio: Int // Expansion multiplier
    var buckets: MutableList<MutableList<Pair>> // Bucket array

    /* Constructor */
    init {
        size = 0
        capacity = 4
        loadThres = 2.0 / 3.0
        extendRatio = 2
        buckets = mutableListOf()
        for (i in 0..<capacity) {
            buckets.add(mutableListOf())
        }
    }

    /* Hash function */
    fun hashFunc(key: Int): Int {
        return key % capacity
    }

    /* Load factor */
    fun loadFactor(): Double {
        return (size / capacity).toDouble()
    }

    /* Query operation */
    fun get(key: Int): String? {
        val index = hashFunc(key)
        val bucket = buckets[index]
        // Traverse the bucket, if the key is found, return the corresponding val
        for (pair in bucket) {
            if (pair.key == key) return pair._val
        }
        // If key is not found, return null
        return null
    }

    /* Add operation */
    fun put(key: Int, _val: String) {
        // When the load factor exceeds the threshold, perform expansion
        if (loadFactor() > loadThres) {
            extend()
        }
        val index = hashFunc(key)
        val bucket = buckets[index]
        // Traverse the bucket, if the specified key is encountered, update the corresponding val and return
        for (pair in bucket) {
            if (pair.key == key) {
                pair._val = _val
                return
            }
        }
        // If the key is not found, add the key-value pair to the end
        val pair = Pair(key, _val)
        bucket.add(pair)
        size++
    }

    /* Remove operation */
    fun remove(key: Int) {
        val index = hashFunc(key)
        val bucket = buckets[index]
        // Traverse the bucket, remove the key-value pair from it
        for (pair in bucket) {
            if (pair.key == key) {
                bucket.remove(pair)
                size--
                break
            }
        }
    }

    /* Extend hash table */
    fun extend() {
        // Temporarily store the original hash table
        val bucketsTmp = buckets
        // Initialize the extended new hash table
        capacity *= extendRatio
        // mutablelist with unspecified size
        buckets = mutableListOf()
        for (i in 0..<capacity) {
            buckets.add(mutableListOf())
        }
        size = 0
        // Move key-value pairs from the original hash table to the new hash table
        for (bucket in bucketsTmp) {
            for (pair in bucket) {
                put(pair.key, pair._val)
            }
        }
    }

    /* Print hash table */
    fun print() {
        for (bucket in buckets) {
            val res = mutableListOf<String>()
            for (pair in bucket) {
                val k = pair.key
                val v = pair._val
                res.add("$k -> $v")
            }
            println(res)
        }
    }
}

/* Driver Code */
fun main() {
    /* Initialize hash table */
    val map = HashMapChaining()

    /* Add operation */
    // Add key-value pair (key, value) to the hash table
    map.put(12836, "Ha")
    map.put(15937, "Luo")
    map.put(16750, "Suan")
    map.put(13276, "Fa")
    map.put(10583, "Ya")
    println("\nAfter adding, the hash table is\nKey -> Value")
    map.print()

    /* Query operation */
    // Enter key to the hash table, get value
    val name = map.get(13276)
    println("\nInput student ID 13276, found name $name")

    /* Remove operation */
    // Remove key-value pair (key, value) from the hash table
    map.remove(12836)
    println("\nAfter removing 12836, the hash table is\nKey -> Value")
    map.print()
}