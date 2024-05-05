/*
 * File: hash_map.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

include!("../include/include.rs");

use std::collections::HashMap;

/* Driver Code */
pub fn main() {
    // Initialize hash table
    let mut map = HashMap::new();

    // Add operation
    // Add key-value pair (key, value) to the hash table
    map.insert(12836, "Ha");
    map.insert(15937, "Luo");
    map.insert(16750, "Suan");
    map.insert(13276, "Fa");
    map.insert(10583, "Ya");
    println!("\nAfter adding, the hash table is\nKey -> Value");
    print_util::print_hash_map(&map);

    // Query operation
    // Enter key to the hash table, get value
    let name = map.get(&15937).copied().unwrap();
    println!("\nInput student ID 15937, found name {name}");

    // Remove operation
    // Remove key-value pair (key, value) from the hash table
    _ = map.remove(&10583);
    println!("\nAfter removing 10583, the hash table is\nKey -> Value");
    print_util::print_hash_map(&map);

    // Traverse hash table
    println!("\nTraverse key-value pairs Key->Value");
    print_util::print_hash_map(&map);
    println!("\nIndividually traverse keys Key");
    for key in map.keys() {
        println!("{key}");
    }
    println!("\nTraverse values individually");
    for value in map.values() {
        println!("{value}");
    }
}
