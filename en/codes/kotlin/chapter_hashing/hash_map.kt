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
    map[12836] = "Ha"
    map[15937] = "Luo"
    map[16750] = "Suan"
    map[13276] = "Fa"
    map[10583] = "Ya"
    println("\nAfter adding, the hash table is\nKey -> Value")
    printHashMap(map)

    /* Query operation */
    // Enter key to the hash table, get value
    val name = map[15937]
    println("\nInput student ID 15937, found name $name")

    /* Remove operation */
    // Remove key-value pair (key, value) from the hash table
    map.remove(10583)
    println("\nAfter removing 10583, the hash table is\nKey -> Value")
    printHashMap(map)

    /* Traverse hash table */
    println("\nTraverse key-value pairs Key->Value")
    for ((key, value) in map) {
        println("$key -> $value")
    }
    println("\nIndividually traverse keys Key")
    for (key in map.keys) {
        println(key)
    }
    println("\nIndividually traverse values Value")
    for (_val in map.values) {
        println(_val)
    }
}