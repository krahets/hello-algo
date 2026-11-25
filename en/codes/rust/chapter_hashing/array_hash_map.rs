/**
 * File: array_hash_map.rs
 * Created Time: 2023-2-18
 * Author: xBLACICEx (xBLACKICEx@outlook.com)
 */

/* Key-value pair */
#[derive(Debug, Clone, PartialEq)]
pub struct Pair {
    pub key: i32,
    pub val: String,
}
/* Array-based hash table */
pub struct ArrayHashMap {
    buckets: Vec<Option<Pair>>,
}

impl ArrayHashMap {
    pub fn new() -> ArrayHashMap {
        // Initialize an array with 100 buckets
        Self {
            buckets: vec![None; 100],
        }
    }

    /* Hash function */
    fn hash_func(&self, key: i32) -> usize {
        key as usize % 100
    }

    /* Look up a value */
    pub fn get(&self, key: i32) -> Option<&String> {
        let index = self.hash_func(key);
        self.buckets[index].as_ref().map(|pair| &pair.val)
    }

    /* Insert a key-value pair */
    pub fn put(&mut self, key: i32, val: &str) {
        let index = self.hash_func(key);
        self.buckets[index] = Some(Pair {
            key,
            val: val.to_string(),
        });
    }

    /* Remove a key-value pair */
    pub fn remove(&mut self, key: i32) {
        let index = self.hash_func(key);
        // Set the slot to None to remove the entry
        self.buckets[index] = None;
    }

    /* Get all key-value pairs */
    pub fn entry_set(&self) -> Vec<&Pair> {
        self.buckets
            .iter()
            .filter_map(|pair| pair.as_ref())
            .collect()
    }

    /* Get all keys */
    pub fn key_set(&self) -> Vec<&i32> {
        self.buckets
            .iter()
            .filter_map(|pair| pair.as_ref().map(|pair| &pair.key))
            .collect()
    }

    /* Get all values */
    pub fn value_set(&self) -> Vec<&String> {
        self.buckets
            .iter()
            .filter_map(|pair| pair.as_ref().map(|pair| &pair.val))
            .collect()
    }

    /* Print the hash table */
    pub fn print(&self) {
        for pair in self.entry_set() {
            println!("{} -> {}", pair.key, pair.val);
        }
    }
}

fn main() {
    /* Initialize the hash table */
    let mut map = ArrayHashMap::new();
    /*Insert a key-value pair */
    // Insert the pair (key, value) into the hash table
    map.put(12836, "Xiao Ha");
    map.put(15937, "Xiao Luo");
    map.put(16750, "Xiao Suan");
    map.put(13276, "Xiao Fa");
    map.put(10583, "Xiao Ya");
    println!("\nHash table after insertion:\nKey -> Value");
    map.print();

    /* Look up a value */
    // Look up key in the hash table to get value
    let name = map.get(15937).unwrap();
    println!("\nName for student ID 15937: {}", name);

    /* Remove a key-value pair */
    // Remove the pair (key, value) from the hash table
    map.remove(10583);
    println!("\nHash table after removing 10583:\nKey -> Value");
    map.print();

    /* Iterate over the hash table */
    println!("\nIterate over key-value pairs (Key->Value)");
    for pair in map.entry_set() {
        println!("{} -> {}", pair.key, pair.val);
    }

    println!("\nIterate over keys only");
    for key in map.key_set() {
        println!("{}", key);
    }

    println!("\nIterate over values only");
    for val in map.value_set() {
        println!("{}", val);
    }
}
