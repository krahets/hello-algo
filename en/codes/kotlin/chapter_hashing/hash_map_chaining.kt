/**
 * File: hash_map_chaining.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

/* Hash table with separate chaining */
class HashMapChaining {
    var size: Int // Number of key-value pairs
    var capacity: Int // Hash table capacity
    val loadThres: Double // Load factor threshold that triggers capacity growth
    val extendRatio: Int // Capacity growth factor
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

    /* Lookup operation */
    fun get(key: Int): String? {
        val index = hashFunc(key)
        val bucket = buckets[index]
        // Traverse the bucket; if key is found, return its corresponding val
        for (pair in bucket) {
            if (pair.key == key) return pair._val
        }
        // Return null if key is not found
        return null
    }

    /* Insert operation */
    fun put(key: Int, _val: String) {
        // Grow the capacity when the load factor exceeds the threshold
        if (loadFactor() > loadThres) {
            extend()
        }
        val index = hashFunc(key)
        val bucket = buckets[index]
        // Traverse the bucket; if the specified key is found, update its val and return
        for (pair in bucket) {
            if (pair.key == key) {
                pair._val = _val
                return
            }
        }
        // If key is absent, append the key-value pair at the end
        val pair = Pair(key, _val)
        bucket.add(pair)
        size++
    }

    /* Remove operation */
    fun remove(key: Int) {
        val index = hashFunc(key)
        val bucket = buckets[index]
        // Traverse the bucket and remove the key-value pair
        for (pair in bucket) {
            if (pair.key == key) {
                bucket.remove(pair)
                size--
                break
            }
        }
    }

    /* Grow the hash table capacity */
    fun extend() {
        // Keep a reference to the original hash table
        val bucketsTmp = buckets
        // Initialize a new hash table with the expanded capacity
        capacity *= extendRatio
        // A mutable list has no fixed size
        buckets = mutableListOf()
        for (i in 0..<capacity) {
            buckets.add(mutableListOf())
        }
        size = 0
        // Move the key-value pairs from the original hash table to the new one
        for (bucket in bucketsTmp) {
            for (pair in bucket) {
                put(pair.key, pair._val)
            }
        }
    }

    /* Print the hash table */
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

/* Driver code */
fun main() {
    /* Initialize the hash table */
    val map = HashMapChaining()

    /* Insert operation */
    // Insert the key-value pair (key, value) into the hash table
    map.put(12836, "小哈")
    map.put(15937, "小啰")
    map.put(16750, "小算")
    map.put(13276, "小法")
    map.put(10583, "小鸭")
    println("\nHash table after insertion:\nKey -> Value")
    map.print()

    /* Lookup operation */
    // Look up key in the hash table to obtain value
    val name = map.get(13276)
    println("\nLook up student ID 13276 to obtain the name $name")

    /* Remove operation */
    // Remove the key-value pair (key, value) from the hash table
    map.remove(12836)
    println("\nHash table after removing 12836:\nKey -> Value")
    map.print()
}