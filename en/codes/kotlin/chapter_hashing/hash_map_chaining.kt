/**
 * File: hash_map_chaining.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

/* Hash table with chaining */
class HashMapChaining {
    var size: Int // Number of key-value pairs
    var capacity: Int // Hash table capacity
    val loadThres: Double // Load factor threshold for resizing
    val extendRatio: Int // Growth factor
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

    /* Look up a value */
    fun get(key: Int): String? {
        val index = hashFunc(key)
        val bucket = buckets[index]
        // Scan the bucket and return the corresponding val if key is found
        for (pair in bucket) {
            if (pair.key == key) return pair._val
        }
        // Return null if key is absent
        return null
    }

    /* Insert a key-value pair */
    fun put(key: Int, _val: String) {
        // Expand the table when the load factor exceeds the threshold
        if (loadFactor() > loadThres) {
            extend()
        }
        val index = hashFunc(key)
        val bucket = buckets[index]
        // Scan the bucket. If the specified key is found, update its val and return
        for (pair in bucket) {
            if (pair.key == key) {
                pair._val = _val
                return
            }
        }
        // If key is absent, append the pair to the end of the list
        val pair = Pair(key, _val)
        bucket.add(pair)
        size++
    }

    /* Remove a key-value pair */
    fun remove(key: Int) {
        val index = hashFunc(key)
        val bucket = buckets[index]
        // Scan the bucket and remove the pair
        for (pair in bucket) {
            if (pair.key == key) {
                bucket.remove(pair)
                size--
                break
            }
        }
    }

    /* Expand the hash table */
    fun extend() {
        // Save the original hash table
        val bucketsTmp = buckets
        // Initialize the larger hash table
        capacity *= extendRatio
        // A mutable list has no fixed size
        buckets = mutableListOf()
        for (i in 0..<capacity) {
            buckets.add(mutableListOf())
        }
        size = 0
        // Move the key-value pairs from the old table into the new one
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

    /* Insert a key-value pair */
    // Insert the pair (key, value) into the hash table
    map.put(12836, "Xiao Ha")
    map.put(15937, "Xiao Luo")
    map.put(16750, "Xiao Suan")
    map.put(13276, "Xiao Fa")
    map.put(10583, "Xiao Ya")
    println("\nHash table after insertion:\nKey -> Value")
    map.print()

    /* Look up a value */
    // Look up key in the hash table to get value
    val name = map.get(13276)
    println("\nName for student ID 13276: $name")

    /* Remove a key-value pair */
    // Remove the pair (key, value) from the hash table
    map.remove(12836)
    println("\nHash table after removing 12836:\nKey -> Value")
    map.print()
}