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

    // Insert a key-value pair
    // Insert the pair (key, value) into the hash table
    map.insert(12836, "Xiao Ha");
    map.insert(15937, "Xiao Luo");
    map.insert(16750, "Xiao Suan");
    map.insert(13276, "Xiao Fa");
    map.insert(10583, "Xiao Ya");
    println!("\nHash table after insertion:\nKey -> Value");
    print_util::print_hash_map(&map);

    // Look up a value
    // Look up key in the hash table to get value
    let name = map.get(&15937).copied().unwrap();
    println!("\nName for student ID 15937: {name}");

    // Remove a key-value pair
    // Remove the pair (key, value) from the hash table
    _ = map.remove(&10583);
    println!("\nHash table after removing 10583:\nKey -> Value");
    print_util::print_hash_map(&map);

    // Iterate over the hash table
    println!("\nIterate over key-value pairs (Key->Value)");
    print_util::print_hash_map(&map);
    println!("\nIterate over keys only");
    for key in map.keys() {
        println!("{key}");
    }
    println!("\nIterate over values only");
    for value in map.values() {
        println!("{value}");
    }
}
