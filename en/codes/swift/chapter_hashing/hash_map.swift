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

        /* Insert operation */
        // Insert the key-value pair (key, value) into the hash table
        map[12836] = "小哈"
        map[15937] = "小啰"
        map[16750] = "小算"
        map[13276] = "小法"
        map[10583] = "小鸭"
        print("\nHash table after insertion:\nKey -> Value")
        PrintUtil.printHashMap(map: map)

        /* Lookup operation */
        // Look up key in the hash table to obtain value
        let name = map[15937]!
        print("\nLooking up student ID 15937 gives the name \(name)")

        /* Remove operation */
        // Remove the key-value pair (key, value) from the hash table
        map.removeValue(forKey: 10583)
        print("\nHash table after removing 10583:\nKey -> Value")
        PrintUtil.printHashMap(map: map)

        /* Traverse the hash table */
        print("\nTraverse key-value pairs: Key->Value")
        for (key, value) in map {
            print("\(key) -> \(value)")
        }
        print("\nTraverse keys only: Key")
        for key in map.keys {
            print(key)
        }
        print("\nTraverse values only: Value")
        for value in map.values {
            print(value)
        }
    }
}
