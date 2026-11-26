/**
 * File: hash_map.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

import utils.printHashMap

/* Driver code */
fun main() {
    /* Initialize the hash table */
    val map = HashMap<Int, String>()

    /* Insert a key-value pair */
    // Insert the pair (key, value) into the hash table
    map[12836] = "Xiao Ha"
    map[15937] = "Xiao Luo"
    map[16750] = "Xiao Suan"
    map[13276] = "Xiao Fa"
    map[10583] = "Xiao Ya"
    println("\nHash table after insertion:\nKey -> Value")
    printHashMap(map)

    /* Look up a value */
    // Look up key in the hash table to get value
    val name = map[15937]
    println("\nName for student ID 15937: $name")

    /* Remove a key-value pair */
    // Remove the pair (key, value) from the hash table
    map.remove(10583)
    println("\nHash table after removing 10583:\nKey -> Value")
    printHashMap(map)

    /* Iterate over the hash table */
    println("\nIterate over key-value pairs (Key->Value)")
    for ((key, value) in map) {
        println("$key -> $value")
    }
    println("\nIterate over keys only")
    for (key in map.keys) {
        println(key)
    }
    println("\nIterate over values only")
    for (_val in map.values) {
        println(_val)
    }
}