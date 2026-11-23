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

/* Hash table implemented with an array */
class ArrayHashMap {
    // Initialize an array containing 100 buckets
    private val buckets = arrayOfNulls<Pair>(100)

    /* Hash function */
    fun hashFunc(key: Int): Int {
        val index = key % 100
        return index
    }

    /* Lookup operation */
    fun get(key: Int): String? {
        val index = hashFunc(key)
        val pair = buckets[index] ?: return null
        return pair._val
    }

    /* Insert operation */
    fun put(key: Int, _val: String) {
        val pair = Pair(key, _val)
        val index = hashFunc(key)
        buckets[index] = pair
    }

    /* Remove operation */
    fun remove(key: Int) {
        val index = hashFunc(key)
        // Set the bucket to null to mark it as removed
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
    val name = map.get(15937)
    println("\nLook up student ID 15937 to obtain the name $name")

    /* Remove operation */
    // Remove the key-value pair (key, value) from the hash table
    map.remove(10583)
    println("\nHash table after removing 10583:\nKey -> Value")
    map.print()

    /* Traverse the hash table */
    println("\nTraverse key-value pairs: Key -> Value")
    for (kv in map.pairSet()) {
        println("${kv.key} -> ${kv._val}")
    }
    println("\nTraverse keys only: Key")
    for (key in map.keySet()) {
        println(key)
    }
    println("\nTraverse values only: Value")
    for (_val in map.valueSet()) {
        println(_val)
    }
}