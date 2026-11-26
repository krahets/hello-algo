/**
 * File: array_hash_map.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

/* Key-value pair */
class Pair(
    var key: Int,
    var _val: String
)

/* Array-based hash table */
class ArrayHashMap {
    // Initialize an array with 100 buckets
    private val buckets = arrayOfNulls<Pair>(100)

    /* Hash function */
    fun hashFunc(key: Int): Int {
        val index = key % 100
        return index
    }

    /* Look up a value */
    fun get(key: Int): String? {
        val index = hashFunc(key)
        val pair = buckets[index] ?: return null
        return pair._val
    }

    /* Insert a key-value pair */
    fun put(key: Int, _val: String) {
        val pair = Pair(key, _val)
        val index = hashFunc(key)
        buckets[index] = pair
    }

    /* Remove a key-value pair */
    fun remove(key: Int) {
        val index = hashFunc(key)
        // Set the slot to null to remove the entry
        buckets[index] = null
    }

    /* Get all key-value pairs */
    fun pairSet(): MutableList<Pair> {
        val pairSet = mutableListOf<Pair>()
        for (pair in buckets) {
            if (pair != null)
                pairSet.add(pair)
        }
        return pairSet
    }

    /* Get all keys */
    fun keySet(): MutableList<Int> {
        val keySet = mutableListOf<Int>()
        for (pair in buckets) {
            if (pair != null)
                keySet.add(pair.key)
        }
        return keySet
    }

    /* Get all values */
    fun valueSet(): MutableList<String> {
        val valueSet = mutableListOf<String>()
        for (pair in buckets) {
            if (pair != null)
                valueSet.add(pair._val)
        }
        return valueSet
    }

    /* Print the hash table */
    fun print() {
        for (kv in pairSet()) {
            val key = kv.key
            val _val = kv._val
            println("$key -> $_val")
        }
    }
}

/* Driver code */
fun main() {
    /* Initialize the hash table */
    val map = ArrayHashMap()

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
    val name = map.get(15937)
    println("\nName for student ID 15937: $name")

    /* Remove a key-value pair */
    // Remove the pair (key, value) from the hash table
    map.remove(10583)
    println("\nHash table after removing 10583:\nKey -> Value")
    map.print()

    /* Iterate over the hash table */
    println("\nIterate over key-value pairs (Key -> Value)")
    for (kv in map.pairSet()) {
        println("${kv.key} -> ${kv._val}")
    }
    println("\nIterate over keys only")
    for (key in map.keySet()) {
        println(key)
    }
    println("\nIterate over values only")
    for (_val in map.valueSet()) {
        println(_val)
    }
}