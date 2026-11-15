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
        // [region]{init_hash_map}
        /* Initialize the hash table */
        var map: [Int: String] = [:]
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
        print("\nHash table after insertion:\nKey -> Value")
        PrintUtil.printHashMap(map: map)

        // [region]{get_value}
        /* Lookup operation */
        // Look up key in the hash table to obtain value
        let name = map[15937]!
        // [endregion]{get_value}
        print("\nLooking up student ID 15937 gives the name \(name)")

        // [region]{remove_pair}
        /* Remove operation */
        // Remove the key-value pair (key, value) from the hash table
        map.removeValue(forKey: 10583)
        // [endregion]{remove_pair}
        print("\nHash table after removing 10583:\nKey -> Value")
        PrintUtil.printHashMap(map: map)

        print("\nTraverse key-value pairs: Key->Value")
        // [region]{iterate_pairs}
        /* Traverse the hash table */
        // Traverse key-value pairs: key->value
        for (key, value) in map {
            print("\(key) -> \(value)")
        }
        // [endregion]{iterate_pairs}

        print("\nTraverse keys only: Key")
        // [region]{iterate_keys}
        // Traverse keys only: key
        for key in map.keys {
            print(key)
        }
        // [endregion]{iterate_keys}

        print("\nTraverse values only: Value")
        // [region]{iterate_values}
        // Traverse values only: value
        for value in map.values {
            print(value)
        }
        // [endregion]{iterate_values}
    }
}
