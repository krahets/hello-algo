/**
 * File: hash_map.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

import utils.printHashMap

/* Driver Code */
fun main() {
    /* Initialize hash table */
    val map = HashMap<Int, String>()

    /* Add operation */
    // Add key-value pair (key, value) to the hash table
    map[12836] = "Xiao Ha"
    map[15937] = "Xiao Luo"
    map[16750] = "Xiao Suan"
    map[13276] = "Xiao Fa"
    map[10583] = "Xiao Ya"
    println("\nAfter adding is complete, hash table is\nKey -> Value")
    printHashMap(map)

    /* Query operation */
    // Input key into hash table to get value
    val name = map[15937]
    println("\nInput student ID 15937, found name $name")

    /* Remove operation */
    // Remove key-value pair (key, value) from hash table
    map.remove(10583)
    println("\nAfter removing 10583, hash table is\nKey -> Value")
    printHashMap(map)

    /* Traverse hash table */
    println("\nTraverse key-value pairs Key->Value")
    for ((key, value) in map) {
        println("$key -> $value")
    }
    println("\nTraverse keys only Key")
    for (key in map.keys) {
        println(key)
    }
    println("\nTraverse values only Value")
    for (_val in map.values) {
        println(_val)
    }
}