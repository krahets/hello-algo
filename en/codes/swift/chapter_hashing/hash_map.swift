/**
 * File: hash_map.swift
 * Created Time: 2023-01-16
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

@main
enum HashMap {
    /* Driver Code */
    static func main() {
        /* Initialize hash table */
        var map: [Int: String] = [:]

        /* Add operation */
        // Add key-value pair (key, value) to the hash table
        map[12836] = "Xiao Ha"
        map[15937] = "Xiao Luo"
        map[16750] = "Xiao Suan"
        map[13276] = "Xiao Fa"
        map[10583] = "Xiao Ya"
        print("\nAfter adding is complete, hash table is\nKey -> Value")
        PrintUtil.printHashMap(map: map)

        /* Query operation */
        // Input key into hash table to get value
        let name = map[15937]!
        print("\nInput student ID 15937, found name \(name)")

        /* Remove operation */
        // Remove key-value pair (key, value) from hash table
        map.removeValue(forKey: 10583)
        print("\nAfter removing 10583, hash table is\nKey -> Value")
        PrintUtil.printHashMap(map: map)

        /* Traverse hash table */
        print("\nTraverse key-value pairs Key->Value")
        for (key, value) in map {
            print("\(key) -> \(value)")
        }
        print("\nTraverse keys only Key")
        for key in map.keys {
            print(key)
        }
        print("\nTraverse values only Value")
        for value in map.values {
            print(value)
        }
    }
}
