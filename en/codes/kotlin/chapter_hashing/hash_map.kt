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

    /* Insert operation */
    // Insert the key-value pair (key, value) into the hash table
    map[12836] = "小哈"
    map[15937] = "小啰"
    map[16750] = "小算"
    map[13276] = "小法"
    map[10583] = "小鸭"
    println("\nHash table after insertion:\nKey -> Value")
    printHashMap(map)

    /* Lookup operation */
    // Look up key in the hash table to obtain value
    val name = map[15937]
    println("\nLook up student ID 15937 to obtain the name $name")

    /* Remove operation */
    // Remove the key-value pair (key, value) from the hash table
    map.remove(10583)
    println("\nHash table after removing 10583:\nKey -> Value")
    printHashMap(map)

    /* Traverse the hash table */
    println("\nTraverse key-value pairs: Key->Value")
    for ((key, value) in map) {
        println("$key -> $value")
    }
    println("\nTraverse keys only: Key")
    for (key in map.keys) {
        println(key)
    }
    println("\nTraverse values only: Value")
    for (_val in map.values) {
        println(_val)
    }
}