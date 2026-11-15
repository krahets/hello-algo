/**
 * File: hash_map.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

import utils.printHashMap

/* Driver code */
fun main() {
    // [region]{init_hash_map}
    /* Initialize the hash table */
    val map = HashMap<Int, String>()
    // [endregion]{init_hash_map}

    // [region]{add_pairs}
    /* Insert operation */
    // Insert the key-value pair (key, value) into the hash table
    map[12836] = "小哈"
    map[15937] = "小啰"
    map[16750] = "小算"
    map[13276] = "小法"
    map[10583] = "小鸭"
    // [endregion]{add_pairs}
    println("\nHash table after insertion:\nKey -> Value")
    printHashMap(map)

    // [region]{get_value}
    /* Lookup operation */
    // Look up key in the hash table to obtain value
    val name = map[15937]
    // [endregion]{get_value}
    println("\nLook up student ID 15937 to obtain the name $name")

    // [region]{remove_pair}
    /* Remove operation */
    // Remove the key-value pair (key, value) from the hash table
    map.remove(10583)
    // [endregion]{remove_pair}
    println("\nHash table after removing 10583:\nKey -> Value")
    printHashMap(map)

    println("\nTraverse key-value pairs: Key->Value")
    // [region]{iterate_pairs}
    /* Traverse the hash table */
    // Traverse key-value pairs: key->value
    for ((key, value) in map) {
        println("$key -> $value")
    }
    // [endregion]{iterate_pairs}

    println("\nTraverse keys only: Key")
    // [region]{iterate_keys}
    // Traverse keys only: key
    for (key in map.keys) {
        println(key)
    }
    // [endregion]{iterate_keys}

    println("\nTraverse values only: Value")
    // [region]{iterate_values}
    // Traverse values only: value
    for (_val in map.values) {
        println(_val)
    }
    // [endregion]{iterate_values}
}