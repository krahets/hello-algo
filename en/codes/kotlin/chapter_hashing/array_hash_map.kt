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

/* Hash table based on array implementation */
class ArrayHashMap {
    // Initialize array with 100 buckets
    private val buckets = arrayOfNulls<Pair>(100)

    /* Hash function */
    fun hashFunc(key: Int): Int {
        val index = key % 100
        return index
    }

    /* Query operation */
    fun get(key: Int): String? {
        val index = hashFunc(key)
        val pair = buckets[index] ?: return null
        return pair._val
    }

    /* Add operation */
    fun put(key: Int, _val: String) {
        val pair = Pair(key, _val)
        val index = hashFunc(key)
        buckets[index] = pair
    }

    /* Remove operation */
    fun remove(key: Int) {
        val index = hashFunc(key)
        // Set to null to represent deletion
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

    /* Print hash table */
    fun print() {
        for (kv in pairSet()) {
            val key = kv.key
            val _val = kv._val
            println("$key -> $_val")
        }
    }
}

/* Driver Code */
fun main() {
    /* Initialize hash table */
    val map = ArrayHashMap()

    /* Add operation */
    // Add key-value pair (key, value) to the hash table
    map.put(12836, "Xiao Ha")
    map.put(15937, "Xiao Luo")
    map.put(16750, "Xiao Suan")
    map.put(13276, "Xiao Fa")
    map.put(10583, "Xiao Ya")
    println("\nAfter adding is complete, hash table is\nKey -> Value")
    map.print()

    /* Query operation */
    // Input key into hash table to get value
    val name = map.get(15937)
    println("\nInput student ID 15937, found name $name")

    /* Remove operation */
    // Remove key-value pair (key, value) from hash table
    map.remove(10583)
    println("\nAfter removing 10583, hash table is\nKey -> Value")
    map.print()

    /* Traverse hash table */
    println("\nTraverse key-value pairs Key -> Value")
    for (kv in map.pairSet()) {
        println("${kv.key} -> ${kv._val}")
    }
    println("\nTraverse keys only Key")
    for (key in map.keySet()) {
        println(key)
    }
    println("\nTraverse values only Value")
    for (_val in map.valueSet()) {
        println(_val)
    }
}