/*
 * File: hash_map.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

// [region]{import_hash_map}
use std::collections::HashMap;
// [endregion]{import_hash_map}

/* Driver code */
pub fn main() {
    // [region]{init_hash_map}
    // Initialize the hash table
    let mut map = HashMap::new();
    // [endregion]{init_hash_map}

    // [region]{add_pairs}
    // Insert operation
    // Insert the key-value pair (key, value) into the hash table
    map.insert(12836, "小哈");
    map.insert(15937, "小啰");
    map.insert(16750, "小算");
    map.insert(13276, "小法");
    map.insert(10583, "小鸭");
    // [endregion]{add_pairs}
    println!("\nHash table after insertion:\nKey -> Value");
    print_util::print_hash_map(&map);

    // [region]{get_value}
    // Lookup operation
    // Look up key in the hash table to obtain value
    let name = map.get(&15937).copied().unwrap();
    // [endregion]{get_value}
    println!("\nLooking up student ID 15937 gives name {name}");

    // [region]{remove_pair}
    // Remove operation
    // Remove the key-value pair (key, value) from the hash table
    _ = map.remove(&10583);
    // [endregion]{remove_pair}
    println!("\nHash table after removing 10583:\nKey -> Value");
    print_util::print_hash_map(&map);

    println!("\nTraverse key-value pairs: Key->Value");
    // [region]{iterate_pairs}
    // Traverse the hash table
    // Traverse key-value pairs: key->value
    for (key, value) in &map {
        println!("{key} -> {value}");
    }
    // [endregion]{iterate_pairs}

    println!("\nTraverse keys only: Key");
    // [region]{iterate_keys}
    // Traverse keys only: key
    for key in map.keys() {
        println!("{key}");
    }
    // [endregion]{iterate_keys}

    println!("\nIterate over values only");
    // [region]{iterate_values}
    // Traverse values only: value
    for value in map.values() {
        println!("{value}");
    }
    // [endregion]{iterate_values}
}
