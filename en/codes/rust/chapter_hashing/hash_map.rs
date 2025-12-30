/*
 * File: hash_map.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

use std::collections::HashMap;

/* Driver Code */
pub fn main() {
    // Initialize hash table
    let mut map = HashMap::new();

    // Add operation
    // Add key-value pair (key, value) to the hash table
    map.insert(12836, "Xiao Ha");
    map.insert(15937, "Xiao Luo");
    map.insert(16750, "Xiao Suan");
    map.insert(13276, "Xiao Fa");
    map.insert(10583, "Xiao Ya");
    println!("\nAfter adding is complete, hash table is\nKey -> Value");
    print_util::print_hash_map(&map);

    // Query operation
    // Input key into hash table to get value
    let name = map.get(&15937).copied().unwrap();
    println!("\nInput student ID 15937, found name {name}");

    // Remove operation
    // Remove key-value pair (key, value) from hash table
    _ = map.remove(&10583);
    println!("\nAfter removing 10583, hash table is\nKey -> Value");
    print_util::print_hash_map(&map);

    // Traverse hash table
    println!("\nTraverse key-value pairs Key->Value");
    print_util::print_hash_map(&map);
    println!("\nTraverse keys only Key");
    for key in map.keys() {
        println!("{key}");
    }
    println!("\nTraverse values separately");
    for value in map.values() {
        println!("{value}");
    }
}
