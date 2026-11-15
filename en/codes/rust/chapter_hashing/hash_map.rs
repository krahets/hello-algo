/*
 * File: hash_map.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

use std::collections::HashMap;

/* Driver code */
pub fn main() {
    // Initialize the hash table
    let mut map = HashMap::new();

    // Insert operation
    // Insert the key-value pair (key, value) into the hash table
    map.insert(12836, "小哈");
    map.insert(15937, "小啰");
    map.insert(16750, "小算");
    map.insert(13276, "小法");
    map.insert(10583, "小鸭");
    println!("\nHash table after insertion:\nKey -> Value");
    print_util::print_hash_map(&map);

    // Lookup operation
    // Look up key in the hash table to obtain value
    let name = map.get(&15937).copied().unwrap();
    println!("\nLooking up student ID 15937 gives name {name}");

    // Remove operation
    // Remove the key-value pair (key, value) from the hash table
    _ = map.remove(&10583);
    println!("\nHash table after removing 10583:\nKey -> Value");
    print_util::print_hash_map(&map);

    // Traverse the hash table
    println!("\nTraverse key-value pairs: Key->Value");
    print_util::print_hash_map(&map);
    println!("\nTraverse keys only: Key");
    for key in map.keys() {
        println!("{key}");
    }
    println!("\nIterate over values only");
    for value in map.values() {
        println!("{value}");
    }
}
