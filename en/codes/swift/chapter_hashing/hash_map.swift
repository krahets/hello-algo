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
        map[12836] = "Ha"
        map[15937] = "Luo"
        map[16750] = "Suan"
        map[13276] = "Fa"
        map[10583] = "Ya"
        print("\nAfter adding, the hash table is\nKey -> Value")
        PrintUtil.printHashMap(map: map)

        /* Query operation */
        // Enter key to the hash table, get value
        let name = map[15937]!
        print("\nInput student ID 15937, found name \(name)")

        /* Remove operation */
        // Remove key-value pair (key, value) from the hash table
        map.removeValue(forKey: 10583)
        print("\nAfter removing 10583, the hash table is\nKey -> Value")
        PrintUtil.printHashMap(map: map)

        /* Traverse hash table */
        print("\nTraverse key-value pairs Key->Value")
        for (key, value) in map {
            print("\(key) -> \(value)")
        }
        print("\nIndividually traverse keys Key")
        for key in map.keys {
            print(key)
        }
        print("\nIndividually traverse values Value")
        for value in map.values {
            print(value)
        }
    }
}
