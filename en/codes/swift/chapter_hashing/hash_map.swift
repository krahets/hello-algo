/**
 * File: hash_map.swift
 * Created Time: 2023-01-16
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

@main
enum HashMap {
    /* Driver code */
    static func main() {
        /* Initialize the hash table */
        var map: [Int: String] = [:]

        /* Insert a key-value pair */
        // Insert the pair (key, value) into the hash table
        map[12836] = "Xiao Ha"
        map[15937] = "Xiao Luo"
        map[16750] = "Xiao Suan"
        map[13276] = "Xiao Fa"
        map[10583] = "Xiao Ya"
        print("\nHash table after insertion:\nKey -> Value")
        PrintUtil.printHashMap(map: map)

        /* Look up a value */
        // Look up key in the hash table to get value
        let name = map[15937]!
        print("\nName for student ID 15937: \(name)")

        /* Remove a key-value pair */
        // Remove the pair (key, value) from the hash table
        map.removeValue(forKey: 10583)
        print("\nHash table after removing 10583:\nKey -> Value")
        PrintUtil.printHashMap(map: map)

        /* Iterate over the hash table */
        print("\nIterate over key-value pairs (Key->Value)")
        for (key, value) in map {
            print("\(key) -> \(value)")
        }
        print("\nIterate over keys only")
        for key in map.keys {
            print(key)
        }
        print("\nIterate over values only")
        for value in map.values {
            print(value)
        }
    }
}
