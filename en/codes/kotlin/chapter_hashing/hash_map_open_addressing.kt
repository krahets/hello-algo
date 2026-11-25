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
    private val loadThres: Double       // Load factor threshold for resizing
    private val extendRatio: Int        // Growth factor
    private var buckets: Array<Pair?>   // Bucket array
    private val TOMBSTONE: Pair         // Deletion marker

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
                // If a deletion marker was found earlier, move the pair to that index
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index]
                    buckets[index] = TOMBSTONE
                    return firstTombstone // Return the new bucket index
                }
                return index // Return the bucket index
            }
            // Record the first deletion marker encountered
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index
            }
            // Compute the next bucket index, wrapping to the start at the end
            index = (index + 1) % capacity
        }
        // If key is absent, return the index for insertion
        return if (firstTombstone == -1) index else firstTombstone
    }

    /* Look up a value */
    fun get(key: Int): String? {
        // Find the bucket index for key
        val index = findBucket(key)
        // If the pair is found, return its val
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index]?._val
        }
        // Return null if the pair is absent
        return null
    }

    /* Insert a key-value pair */
    fun put(key: Int, _val: String) {
        // Expand the table when the load factor exceeds the threshold
        if (loadFactor() > loadThres) {
            extend()
        }
        // Find the bucket index for key
        val index = findBucket(key)
        // If the pair is found, overwrite val and return
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index]!!._val = _val
            return
        }
        // If the pair is absent, insert it
        buckets[index] = Pair(key, _val)
        size++
    }

    /* Remove a key-value pair */
    fun remove(key: Int) {
        // Find the bucket index for key
        val index = findBucket(key)
        // If the pair is found, replace it with a deletion marker
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE
            size--
        }
    }

    /* Expand the hash table */
    fun extend() {
        // Save the original hash table
        val bucketsTmp = buckets
        // Initialize the larger hash table
        capacity *= extendRatio
        buckets = arrayOfNulls(capacity)
        size = 0
        // Move the key-value pairs from the old table into the new one
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

    // Insert a key-value pair
    // Insert the pair (key, val) into the hash table
    hashmap.put(12836, "Xiao Ha")
    hashmap.put(15937, "Xiao Luo")
    hashmap.put(16750, "Xiao Suan")
    hashmap.put(13276, "Xiao Fa")
    hashmap.put(10583, "Xiao Ya")
    println("\nHash table after insertion:\nKey -> Value")
    hashmap.print()

    // Look up a value
    // Look up key in the hash table to get val
    val name = hashmap.get(13276)
    println("\nName for student ID 13276: $name")

    // Remove a key-value pair
    // Remove the pair (key, val) from the hash table
    hashmap.remove(16750)
    println("\nHash table after removing 16750:\nKey -> Value")
    hashmap.print()
}